-- 7-day weekly closing: Direct Income + Helping Level Income → WeeklyClosing / WeeklyClosingMaster
-- PAY: debit TransactionDetail (Income Payout) after bank Transaction ID
-- @Mode = CREATE (default) | PAY
-- CREATE keeps Status=1 (paid) rows as-is and inserts any userid still missing for that week.

IF OBJECT_ID('dbo.CreateWeeklyclosingpayout', 'P') IS NOT NULL
    DROP PROCEDURE dbo.CreateWeeklyclosingpayout;
GO

CREATE PROCEDURE [dbo].[CreateWeeklyclosingpayout]
    @FromDate DATETIME = NULL,
    @ToDate DATETIME = NULL,
    @Mode VARCHAR(20) = 'CREATE',
    @UserId NVARCHAR(50) = NULL,
    @id INT = NULL,
    @paymentTransactionId NVARCHAR(100) = NULL,
    @Amount DECIMAL(18,2) = NULL
AS
SET NOCOUNT ON

DECLARE @modeNorm VARCHAR(20) = UPPER(LTRIM(RTRIM(ISNULL(@Mode, 'CREATE'))))

/* ===================== PAY ===================== */
IF @modeNorm = 'PAY'
BEGIN
    IF ISNULL(@paymentTransactionId, N'') = N''
    BEGIN
        SELECT 'notxn' AS Result
        RETURN
    END

    DECLARE @payUser NVARCHAR(50)
    DECLARE @payAmt DECIMAL(18,2)
    DECLARE @st INT
    DECLARE @fdate DATE
    DECLARE @tdate DATE
    DECLARE @helping DECIMAL(18,2)
    DECLARE @direct DECIMAL(18,2)
    DECLARE @txnid INT
    DECLARE @pkey VARCHAR(8)
    DECLARE @pkeyTo VARCHAR(8)

    SELECT
        @payUser = LTRIM(RTRIM(UserId)),
        @payAmt = ISNULL(PaybleAmount, 0),
        @st = ISNULL(Status, 0),
        @fdate = CAST(FromDate AS date),
        @tdate = CAST(ToDate AS date),
        @helping = ISNULL(Levelincome, 0),
        @direct = ISNULL(DirectIncome, 0)
    FROM WeeklyClosing WITH (UPDLOCK)
    WHERE id = @id

    IF @payUser IS NULL
    BEGIN
        SELECT '-1' AS Result
        RETURN
    END

    IF @st = 1 OR @payAmt <= 0
    BEGIN
        SELECT 'f' AS Result
        RETURN
    END

    SET @pkey = CONVERT(VARCHAR(8), @fdate, 112)
    SET @pkeyTo = CONVERT(VARCHAR(8), @tdate, 112)
    SET @txnid = ISNULL((SELECT MAX(transactionid) FROM TransactionDetail WITH (UPDLOCK, HOLDLOCK)), 0) + 1

    INSERT INTO TransactionDetail (transactionid, cramount, dramount, userid, transactiontype, remark, mentionby, mentiondate)
    VALUES (
        @txnid,
        0,
        @payAmt,
        @payUser,
        N'Income Payout',
        N'Income Payout PayoutWeek=' + @pkey + N'; PayoutTo=' + @pkeyTo + N'; PayoutDate=' + @pkey
            + N'; WeeklyClosingId=' + CAST(@id AS NVARCHAR(20))
            + N'; OnlineTxnId=' + REPLACE(@paymentTransactionId, N'''', N'')
            + N'; Helping=' + CONVERT(VARCHAR(30), @helping)
            + N' Direct=' + CONVERT(VARCHAR(30), @direct) + N';',
        'admin',
        GETDATE()
    )

    UPDATE WeeklyClosing
    SET Status = 1,
        TransactionID = @paymentTransactionId,
        PaymentDate = GETDATE()
    WHERE id = @id

    SELECT 't' AS Result
    RETURN
END

/* ===================== CREATE (7-day week) ===================== */
IF @FromDate IS NULL AND @ToDate IS NULL
BEGIN
    SET @ToDate = CAST(GETDATE() AS date)
    SET @FromDate = DATEADD(DAY, -6, @ToDate)
END
ELSE IF @FromDate IS NULL
    SET @FromDate = DATEADD(DAY, -6, CAST(@ToDate AS date))
ELSE IF @ToDate IS NULL
    SET @ToDate = DATEADD(DAY, 6, CAST(@FromDate AS date))

SET @FromDate = CAST(@FromDate AS date)
SET @ToDate = DATEADD(DAY, 6, @FromDate)

DECLARE @masterExists BIT = 0
DECLARE @DailyId INT

IF EXISTS (
    SELECT 1 FROM WeeklyClosingMaster WITH (UPDLOCK)
    WHERE CAST(FromDate AS date) = @FromDate
      AND CAST(ToDate AS date) = @ToDate
)
BEGIN
    SET @masterExists = 1
    SELECT TOP 1 @DailyId = weekno
    FROM WeeklyClosingMaster WITH (UPDLOCK)
    WHERE CAST(FromDate AS date) = @FromDate
      AND CAST(ToDate AS date) = @ToDate
END
ELSE
    SET @DailyId = ISNULL((SELECT MAX(weekno) FROM WeeklyClosingMaster WITH (UPDLOCK)), 0) + 1

DECLARE @TxnBase INT = ISNULL((SELECT MAX(transactionid) FROM TransactionDetail WITH (UPDLOCK, HOLDLOCK)), 0)

-- Income is included if it falls in this week, OR it is leftover (not inside any WeeklyClosing yet)
-- Backfill unposted Helping / Direct credits
;WITH Missing AS (
    SELECT
        CAST(ISNULL(i.Income, 0)
            - ROUND(ISNULL(i.Income, 0) * 0.05, 2)
            - ROUND(ISNULL(i.Income, 0) * 0.05, 2) AS DECIMAL(18,2)) AS Amt,
        i.UserId AS Uid,
        CAST(N'Helping Level Income' AS NVARCHAR(100)) AS TType,
        N'Helping Level Income (Admin 5% + TDS 5%) Level '
            + CAST(i.LevelNo AS NVARCHAR(10))
            + N' HelpingId=' + CAST(i.HelpingId AS NVARCHAR(20))
            + N' IncId=' + CAST(i.id AS NVARCHAR(20)) + N';' AS Rmk,
        ISNULL(i.MentionDate, GETDATE()) AS MDate,
        i.id AS SortId,
        1 AS SortGrp
    FROM HelpingLevelIncomeDetail i WITH (NOLOCK)
    WHERE ISNULL(i.Income, 0) > 0
      AND CAST(ISNULL(i.MentionDate, GETDATE()) AS date) <= @ToDate
      AND (
            CAST(ISNULL(i.MentionDate, GETDATE()) AS date) BETWEEN @FromDate AND @ToDate
            OR NOT EXISTS (
                SELECT 1 FROM WeeklyClosing w WITH (NOLOCK)
                WHERE LTRIM(RTRIM(w.UserId)) = LTRIM(RTRIM(i.UserId))
                  AND CAST(ISNULL(i.MentionDate, GETDATE()) AS date)
                      BETWEEN CAST(w.FromDate AS date) AND CAST(w.ToDate AS date)
            )
          )
      AND NOT EXISTS (
          SELECT 1 FROM TransactionDetail t WITH (NOLOCK)
          WHERE t.transactiontype = N'Helping Level Income'
            AND t.Remark LIKE N'%IncId=' + CAST(i.id AS NVARCHAR(20)) + N';%'
      )
    UNION ALL
    SELECT
        CAST(ISNULL(d.directincome, 0)
            - ROUND(ISNULL(d.directincome, 0) * 0.05, 2)
            - ROUND(ISNULL(d.directincome, 0) * 0.05, 2) AS DECIMAL(18,2)),
        d.userid,
        N'Direct Income',
        N'Direct Income (Admin 5% + TDS 5%) From '
            + ISNULL(d.fromuserid, N'')
            + N' RefId=' + CAST(d.id AS NVARCHAR(20)) + N';',
        ISNULL(d.entrydate, GETDATE()),
        d.id,
        2
    FROM directincometb d WITH (NOLOCK)
    WHERE ISNULL(d.directincome, 0) > 0
      AND CAST(ISNULL(d.entrydate, GETDATE()) AS date) <= @ToDate
      AND (
            CAST(ISNULL(d.entrydate, GETDATE()) AS date) BETWEEN @FromDate AND @ToDate
            OR NOT EXISTS (
                SELECT 1 FROM WeeklyClosing w WITH (NOLOCK)
                WHERE LTRIM(RTRIM(w.UserId)) = LTRIM(RTRIM(d.userid))
                  AND CAST(ISNULL(d.entrydate, GETDATE()) AS date)
                      BETWEEN CAST(w.FromDate AS date) AND CAST(w.ToDate AS date)
            )
          )
      AND NOT EXISTS (
          SELECT 1 FROM TransactionDetail t WITH (NOLOCK)
          WHERE t.transactiontype = N'Direct Income'
            AND t.Remark LIKE N'%RefId=' + CAST(d.id AS NVARCHAR(20)) + N';%'
      )
)
INSERT INTO TransactionDetail (transactionid, cramount, dramount, userid, transactiontype, remark, mentionby, mentiondate)
SELECT @TxnBase + ROW_NUMBER() OVER (ORDER BY SortGrp, SortId), Amt, 0, Uid, TType, Rmk, 'admin', MDate
FROM Missing
WHERE Amt > 0

-- Leftover credits (kisi WeeklyClosing range me nahi) is week me count hon, next closing me double na hon
UPDATE t
SET mentiondate = @ToDate
FROM TransactionDetail t
WHERE t.transactiontype IN (N'Helping Level Income', N'Direct Income')
  AND ISNULL(t.cramount, 0) > 0
  AND CAST(t.mentiondate AS date) < @FromDate
  AND NOT EXISTS (
      SELECT 1 FROM WeeklyClosing w WITH (NOLOCK)
      WHERE LTRIM(RTRIM(w.UserId)) = LTRIM(RTRIM(t.userid))
        AND CAST(t.mentiondate AS date)
            BETWEEN CAST(w.FromDate AS date) AND CAST(w.ToDate AS date)
  )

IF OBJECT_ID('tempdb..#Inc') IS NOT NULL DROP TABLE #Inc
IF OBJECT_ID('tempdb..#Paid') IS NOT NULL DROP TABLE #Paid

SELECT
    LTRIM(RTRIM(td.userid)) AS userid,
    CAST(SUM(CASE WHEN td.transactiontype = N'Helping Level Income' THEN ISNULL(td.cramount, 0) ELSE 0 END) AS DECIMAL(18,2)) AS Levelincome,
    CAST(SUM(CASE WHEN td.transactiontype = N'Direct Income' THEN ISNULL(td.cramount, 0) ELSE 0 END) AS DECIMAL(18,2)) AS DirectIncome
INTO #Inc
FROM TransactionDetail td WITH (NOLOCK)
WHERE td.transactiontype IN (N'Helping Level Income', N'Direct Income')
  AND ISNULL(td.cramount, 0) > 0
  AND CAST(td.mentiondate AS date) BETWEEN @FromDate AND @ToDate
GROUP BY LTRIM(RTRIM(td.userid))

-- Only this week's payout (PayoutWeek=FromDate). Do not use mentiondate —
-- previous weeks paid during this calendar week must not zero out leftover income.
SELECT
    LTRIM(RTRIM(t.userid)) AS userid,
    CAST(SUM(ISNULL(t.dramount, 0)) AS DECIMAL(18,2)) AS PaidAmount
INTO #Paid
FROM TransactionDetail t WITH (NOLOCK)
WHERE t.transactiontype = N'Income Payout'
  AND t.Remark LIKE N'%PayoutWeek=' + CONVERT(varchar(8), @FromDate, 112) + N';%'
GROUP BY LTRIM(RTRIM(t.userid))

UPDATE w
SET
    DirectIncome = i.DirectIncome,
    Levelincome = i.Levelincome,
    totalincome = i.Levelincome + i.DirectIncome,
    PaybleAmount = CAST((i.Levelincome + i.DirectIncome) - ISNULL(p.PaidAmount, 0) AS DECIMAL(18,2)),
    Adminper = 5,
    tdsper = 5
FROM WeeklyClosing w
INNER JOIN #Inc i ON LTRIM(RTRIM(w.UserId)) = i.userid
LEFT JOIN #Paid p ON p.userid = i.userid
WHERE CAST(w.FromDate AS date) = @FromDate
  AND CAST(w.ToDate AS date) = @ToDate
  AND ISNULL(w.Status, 0) = 0
  AND (i.Levelincome + i.DirectIncome) - ISNULL(p.PaidAmount, 0) > 0
  AND (
        ISNULL(w.Levelincome, 0) <> i.Levelincome
        OR ISNULL(w.DirectIncome, 0) <> i.DirectIncome
        OR ISNULL(w.PaybleAmount, 0) <> CAST((i.Levelincome + i.DirectIncome) - ISNULL(p.PaidAmount, 0) AS DECIMAL(18,2))
      )

DECLARE @updated INT = @@ROWCOUNT

-- Paid (Status=1) rows stay. Insert only userids that do not yet have a row for this week.
INSERT INTO WeeklyClosing (
    fromdate, todate, UserId, MatchingBV, Commission, Adminper, admincharge, TDS, DirectIncome, totalincome, tdsper,
    PaybleAmount, Status, weekno, GenerateDate, Levelincome, PoolIncome, holdincome, levelfranchiseIncome, BinaryIncome,
    SelfPurchaseIncomee, MatchingIncomee, leadershipIncomee, directorIncomee, golddirectorIncomee, crowndirectorIncomee,
    diamonddirectorIncomee, platinumdirectorIncomee
)
SELECT
    @FromDate,
    @ToDate,
    i.userid,
    0, 0,
    5, 0, 0,
    i.DirectIncome,
    i.Levelincome + i.DirectIncome,
    5,
    CAST((i.Levelincome + i.DirectIncome) - ISNULL(p.PaidAmount, 0) AS DECIMAL(18,2)),
    0,
    @DailyId,
    GETDATE(),
    i.Levelincome,
    0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0
FROM #Inc i
LEFT JOIN #Paid p ON p.userid = i.userid
WHERE (i.Levelincome + i.DirectIncome) > 0
  AND CAST((i.Levelincome + i.DirectIncome) - ISNULL(p.PaidAmount, 0) AS DECIMAL(18,2)) > 0
  AND NOT EXISTS (
      SELECT 1 FROM WeeklyClosing w WITH (NOLOCK)
      WHERE LTRIM(RTRIM(w.UserId)) = i.userid
        AND CAST(w.FromDate AS date) = @FromDate
        AND CAST(w.ToDate AS date) = @ToDate
  )

DECLARE @inserted INT = @@ROWCOUNT

IF @masterExists = 0 AND (@inserted > 0 OR @updated > 0)
    INSERT INTO WeeklyClosingMaster (fromdate, todate, Createdate, weekno)
    VALUES (@FromDate, @ToDate, GETDATE(), @DailyId)

IF @inserted > 0 OR @updated > 0
    SELECT 't' AS Result
ELSE IF @masterExists = 1
    SELECT 'exists' AS Result
ELSE
    SELECT 'empty' AS Result
GO

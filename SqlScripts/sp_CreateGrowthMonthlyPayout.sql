-- Growth monthly payout snapshot + bank pay debit
-- CREATE: HelpingLevelIncomeDetailPool2 → GrowthMonthlyClosing
-- PAY:    TransactionDetail debit (Growth Income Payout)

IF OBJECT_ID('dbo.GrowthMonthlyClosing', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.GrowthMonthlyClosing (
        id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        FromDate DATETIME NOT NULL,
        ToDate DATETIME NOT NULL,
        UserId NVARCHAR(100) NOT NULL,
        GrowthIncome DECIMAL(18,2) NOT NULL CONSTRAINT DF_GMC_GrowthIncome DEFAULT (0),
        TotalIncome DECIMAL(18,2) NOT NULL CONSTRAINT DF_GMC_TotalIncome DEFAULT (0),
        AdminPer DECIMAL(18,2) NOT NULL CONSTRAINT DF_GMC_AdminPer DEFAULT (5),
        AdminCharge DECIMAL(18,2) NOT NULL CONSTRAINT DF_GMC_AdminCharge DEFAULT (0),
        TdsPer DECIMAL(18,2) NOT NULL CONSTRAINT DF_GMC_TdsPer DEFAULT (5),
        TDS DECIMAL(18,2) NOT NULL CONSTRAINT DF_GMC_TDS DEFAULT (0),
        PaybleAmount DECIMAL(18,2) NOT NULL CONSTRAINT DF_GMC_Payble DEFAULT (0),
        Status INT NOT NULL CONSTRAINT DF_GMC_Status DEFAULT (0),
        TransactionID NVARCHAR(100) NULL,
        GenerateDate DATETIME NULL,
        PaymentDate DATETIME NULL,
        MonthNo INT NULL
    )
END
GO

IF OBJECT_ID('dbo.GrowthMonthlyClosingMaster', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.GrowthMonthlyClosingMaster (
        id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        FromDate DATETIME NOT NULL,
        ToDate DATETIME NOT NULL,
        CreateDate DATETIME NULL,
        MonthNo INT NULL
    )
END
GO

IF OBJECT_ID('dbo.sp_CreateGrowthMonthlyPayout', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_CreateGrowthMonthlyPayout;
GO

CREATE PROCEDURE dbo.sp_CreateGrowthMonthlyPayout
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
    DECLARE @growth DECIMAL(18,2)
    DECLARE @txnid INT
    DECLARE @pkey VARCHAR(8)
    DECLARE @pkeyTo VARCHAR(8)

    SELECT
        @payUser = LTRIM(RTRIM(UserId)),
        @payAmt = ISNULL(PaybleAmount, 0),
        @st = ISNULL(Status, 0),
        @fdate = CAST(FromDate AS date),
        @tdate = CAST(ToDate AS date),
        @growth = ISNULL(GrowthIncome, 0)
    FROM GrowthMonthlyClosing WITH (UPDLOCK)
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
        N'Growth Income Payout',
        N'Growth Income Payout PayoutFrom=' + @pkey + N'; PayoutTo=' + @pkeyTo
            + N'; GrowthMonthlyId=' + CAST(@id AS NVARCHAR(20))
            + N'; OnlineTxnId=' + REPLACE(@paymentTransactionId, N'''', N'')
            + N'; Growth=' + CONVERT(VARCHAR(30), @growth) + N';',
        'admin',
        GETDATE()
    )

    UPDATE GrowthMonthlyClosing
    SET Status = 1,
        TransactionID = @paymentTransactionId,
        PaymentDate = GETDATE()
    WHERE id = @id

    SELECT 't' AS Result
    RETURN
END

/* ===================== CREATE / refresh unpaid ===================== */
IF @FromDate IS NULL AND @ToDate IS NULL
BEGIN
    SET @FromDate = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)
    SET @ToDate = DATEADD(DAY, -1, DATEADD(MONTH, 1, @FromDate))
END
ELSE IF @FromDate IS NULL
BEGIN
    SET @FromDate = DATEADD(MONTH, DATEDIFF(MONTH, 0, @ToDate), 0)
END
ELSE IF @ToDate IS NULL
    SET @ToDate = DATEADD(DAY, -1, DATEADD(MONTH, 1, DATEADD(MONTH, DATEDIFF(MONTH, 0, @FromDate), 0)))

SET @FromDate = CAST(@FromDate AS date)
SET @ToDate = CAST(@ToDate AS date)

DECLARE @MonthNo INT = YEAR(@FromDate) * 100 + MONTH(@FromDate)

IF NOT EXISTS (
    SELECT 1 FROM GrowthMonthlyClosingMaster WITH (UPDLOCK)
    WHERE CAST(FromDate AS date) = @FromDate
      AND CAST(ToDate AS date) = @ToDate
)
BEGIN
    INSERT INTO GrowthMonthlyClosingMaster (FromDate, ToDate, CreateDate, MonthNo)
    VALUES (@FromDate, @ToDate, GETDATE(), @MonthNo)
END

;WITH Inc AS (
    SELECT
        LTRIM(RTRIM(i.UserId)) AS UserId,
        CAST(SUM(ISNULL(i.Income, 0)) AS DECIMAL(18,2)) AS GrowthIncome
    FROM HelpingLevelIncomeDetailPool2 i WITH (NOLOCK)
    WHERE ISNULL(i.Income, 0) > 0
      AND CAST(ISNULL(i.MentionDate, GETDATE()) AS date) BETWEEN @FromDate AND @ToDate
    GROUP BY LTRIM(RTRIM(i.UserId))
)
UPDATE w
SET
    w.GrowthIncome = i.GrowthIncome,
    w.TotalIncome = i.GrowthIncome,
    w.AdminCharge = CAST(ROUND(i.GrowthIncome * 0.05, 2) AS DECIMAL(18,2)),
    w.TDS = CAST(ROUND(i.GrowthIncome * 0.05, 2) AS DECIMAL(18,2)),
    w.PaybleAmount = CAST(i.GrowthIncome
        - ROUND(i.GrowthIncome * 0.05, 2)
        - ROUND(i.GrowthIncome * 0.05, 2) AS DECIMAL(18,2))
FROM GrowthMonthlyClosing w
INNER JOIN Inc i ON i.UserId = LTRIM(RTRIM(w.UserId))
WHERE CAST(w.FromDate AS date) = @FromDate
  AND CAST(w.ToDate AS date) = @ToDate
  AND ISNULL(w.Status, 0) = 0

;WITH Inc AS (
    SELECT
        LTRIM(RTRIM(i.UserId)) AS UserId,
        CAST(SUM(ISNULL(i.Income, 0)) AS DECIMAL(18,2)) AS GrowthIncome
    FROM HelpingLevelIncomeDetailPool2 i WITH (NOLOCK)
    WHERE ISNULL(i.Income, 0) > 0
      AND CAST(ISNULL(i.MentionDate, GETDATE()) AS date) BETWEEN @FromDate AND @ToDate
    GROUP BY LTRIM(RTRIM(i.UserId))
)
INSERT INTO GrowthMonthlyClosing (
    FromDate, ToDate, UserId, GrowthIncome, TotalIncome,
    AdminPer, AdminCharge, TdsPer, TDS, PaybleAmount,
    Status, GenerateDate, MonthNo
)
SELECT
    @FromDate,
    @ToDate,
    i.UserId,
    i.GrowthIncome,
    i.GrowthIncome,
    5,
    CAST(ROUND(i.GrowthIncome * 0.05, 2) AS DECIMAL(18,2)),
    5,
    CAST(ROUND(i.GrowthIncome * 0.05, 2) AS DECIMAL(18,2)),
    CAST(i.GrowthIncome
        - ROUND(i.GrowthIncome * 0.05, 2)
        - ROUND(i.GrowthIncome * 0.05, 2) AS DECIMAL(18,2)),
    0,
    GETDATE(),
    @MonthNo
FROM Inc i
WHERE i.GrowthIncome > 0
  AND NOT EXISTS (
      SELECT 1 FROM GrowthMonthlyClosing w WITH (NOLOCK)
      WHERE LTRIM(RTRIM(w.UserId)) = i.UserId
        AND CAST(w.FromDate AS date) = @FromDate
        AND CAST(w.ToDate AS date) = @ToDate
  )

SELECT 't' AS Result
GO

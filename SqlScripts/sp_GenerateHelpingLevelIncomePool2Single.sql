-- Growth Closing (single/ID income) — HelpingBinaryDetailPool2 → HelpingLevelIncomeDetailPool2
-- Rules:
--  1) Income slab = HelpingLevelDetailPool2 jahan FinalAmount > 0  (L1, L3, L5, ...)
--  2) Qualify = us level par Target IDs (HelpingBinaryDetailPool2 downline)
--     L1 Target 2, L3 Target 8, L5 Target 32
--  3) Pay IDs = RequireTeam (uper wali IDs); level jahan Target = RequireTeam
--     L1 RequireTeam 2 → L1 ke 2 IDs
--     L3 RequireTeam 4 → L2 ke 4 IDs
--     L5 RequireTeam 8 → L3 ke 8 IDs
--  4) Per ID = FinalAmount / RequireTeam
--     L1: 600 / 2 = 300 × 2 = 600
--     L3: 1200 / 4 = 300 × 4 = 1200
--     L5: 5700 / 8 = 712.50 × 8 = 5700
--  5) Tabhi jab us ID ke neeche qualify Target complete ho
--  6) Award/re-entry RequireTeam se (alag)
--  7) JuniorId = pay hone wali uper Pool2 id; stored LevelNo = FinalAmount wali row
--  8) TransactionDetail: user-wise credit after 5% admin + 5% TDS (IncId dedup)

IF OBJECT_ID('dbo.sp_GenerateHelpingLevelIncomePool2Single', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_GenerateHelpingLevelIncomePool2Single;
GO

CREATE PROC sp_GenerateHelpingLevelIncomePool2Single
    @FromDate DATETIME,
    @ToDate DATETIME
AS
SET NOCOUNT ON

DECLARE @ClosingDate DATETIME = ISNULL(@ToDate, GETDATE())

;WITH roots AS (
    SELECT h.id AS HelpingId, h.Userid AS RootUserId
    FROM HelpingBinaryDetailPool2 h WITH (NOLOCK)
),
MyCTE AS (
    SELECT r.HelpingId, r.RootUserId, h.id, h.userid, h.ParentId, 0 AS userlevel
    FROM roots r
    INNER JOIN HelpingBinaryDetailPool2 h WITH (NOLOCK) ON h.id = r.HelpingId
    UNION ALL
    SELECT MyCTE.HelpingId, MyCTE.RootUserId, d.id, d.userid, d.ParentId, MyCTE.userlevel + 1
    FROM HelpingBinaryDetailPool2 d WITH (NOLOCK)
    INNER JOIN MyCTE ON d.ParentId = MyCTE.id
    WHERE d.id <> MyCTE.HelpingId
),
team AS (
    SELECT HelpingId, userlevel, COUNT(*) AS Cnt
    FROM MyCTE
    WHERE userlevel >= 1
    GROUP BY HelpingId, userlevel
),
ranked AS (
    SELECT
        c.HelpingId,
        c.RootUserId,
        c.id AS JuniorId,
        pay.LevelNo AS PayoutLevelNo,
        CAST(pay.FinalAmount / ISNULL(NULLIF(pay.RequireTeam, 0), pay.Target) AS DECIMAL(18,2)) AS SingleIncome,
        ISNULL(NULLIF(pay.RequireTeam, 0), pay.Target) AS PayCount,
        ROW_NUMBER() OVER (PARTITION BY c.HelpingId, pay.LevelNo ORDER BY c.id) AS rn
    FROM MyCTE c
    INNER JOIN HelpingLevelDetailPool2 pay WITH (NOLOCK)
        ON ISNULL(pay.FinalAmount, 0) > 0
    INNER JOIN HelpingLevelDetailPool2 elig WITH (NOLOCK)
        ON elig.Target = ISNULL(NULLIF(pay.RequireTeam, 0), pay.Target)
       AND elig.LevelNo <= pay.LevelNo
    INNER JOIN team tpay
        ON tpay.HelpingId = c.HelpingId
       AND tpay.userlevel = pay.LevelNo
       AND tpay.Cnt >= pay.Target
    WHERE c.userlevel = elig.LevelNo
      AND c.userlevel >= 1
      AND ISNULL(NULLIF(pay.RequireTeam, 0), pay.Target) > 0
      AND ISNULL(pay.Target, 0) > 0
)
INSERT INTO HelpingLevelIncomeDetailPool2 (
    HelpingId, UserId, LevelNo, Income, MentionBy, MentionDate, awardname, JuniorId
)
SELECT
    r.HelpingId,
    r.RootUserId,
    r.PayoutLevelNo,
    r.SingleIncome,
    'admin',
    @ClosingDate,
    NULL,
    r.JuniorId
FROM ranked r
WHERE r.rn <= r.PayCount
  AND NOT EXISTS (
      SELECT 1 FROM HelpingLevelIncomeDetailPool2 i WITH (NOLOCK)
      WHERE i.HelpingId = r.HelpingId
        AND i.LevelNo = r.PayoutLevelNo
        AND i.JuniorId = r.JuniorId
  )
  AND NOT EXISTS (
      SELECT 1 FROM HelpingLevelIncomeDetailPool2 i WITH (NOLOCK)
      WHERE i.HelpingId = r.HelpingId
        AND i.LevelNo = r.PayoutLevelNo
        AND i.JuniorId IS NULL
        AND i.Income > 0
  )
OPTION (MAXRECURSION 0)

-- Award + re-entry (RequireTeam)
DECLARE @userid NVARCHAR(100), @HelpingId INT

DECLARE cur_closing2 CURSOR LOCAL FAST_FORWARD FOR
SELECT id, Userid FROM HelpingBinaryDetailPool2 WITH (NOLOCK) ORDER BY id

OPEN cur_closing2
FETCH NEXT FROM cur_closing2 INTO @HelpingId, @userid
WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @tempteam TABLE (
        id INT,
        userid NVARCHAR(100),
        ParentId INT,
        LevelNo INT
    )

    ;WITH MyCTE AS (
        SELECT id, userid, ParentId, 0 AS userlevel
        FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
        WHERE id = @HelpingId
        UNION ALL
        SELECT HelpingBinaryDetailPool2.id, HelpingBinaryDetailPool2.userid,
               HelpingBinaryDetailPool2.ParentId, MyCTE.userlevel + 1
        FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
        INNER JOIN MyCTE ON HelpingBinaryDetailPool2.ParentId = MyCTE.id
        WHERE HelpingBinaryDetailPool2.id != @HelpingId
    )
    INSERT INTO @tempteam (id, userid, ParentId, LevelNo)
    SELECT MyCTE.id, MyCTE.userid, MyCTE.ParentId, MyCTE.userlevel
    FROM MyCTE
    WHERE MyCTE.userlevel >= 1 AND MyCTE.userlevel <= 15
    OPTION (MAXRECURSION 0)

    DECLARE @levelno INT, @requireteam INT, @team INT
    DECLARE @parentid INT, @reentry INT, @awardname NVARCHAR(100)
    DECLARE @sponsercount INT, @StandingPositionHelping INT
    DECLARE @id INT, @downlineid NVARCHAR(100), @fetchParentId INT
    DECLARE @reentrycount INT

    DECLARE cur_closingDownline CURSOR LOCAL FAST_FORWARD FOR
    SELECT id, userid, ParentId, LevelNo FROM @tempteam ORDER BY LevelNo, id

    OPEN cur_closingDownline
    FETCH NEXT FROM cur_closingDownline INTO @id, @downlineid, @fetchParentId, @levelno
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @requireteam = ISNULL((SELECT RequireTeam FROM HelpingLevelDetailPool2 WITH (NOLOCK) WHERE LevelNo = @levelno), 0)
        SET @team = ISNULL((SELECT COUNT(id) FROM @tempteam WHERE LevelNo = @levelno), 0)

        IF (@levelno > 1 AND @team = @requireteam AND @requireteam > 0)
        BEGIN
            IF (NOT EXISTS (
                SELECT helpingid FROM HelpingAwardDetailPool2 WITH (NOLOCK)
                WHERE helpingid = @HelpingId AND levelno = @levelno
            ))
            BEGIN
                SET @awardname = ISNULL((SELECT awardname FROM HelpingLevelDetailPool2 WITH (NOLOCK) WHERE LevelNo = @levelno), '')
                SET @reentry = ISNULL((SELECT Rentry FROM HelpingLevelDetailPool2 WITH (NOLOCK) WHERE LevelNo = @levelno), 0)

                INSERT INTO HelpingAwardDetailPool2 (HelpingId, UserId, LevelNo, MentionBy, MentionDate, awardname)
                VALUES (@HelpingId, @userid, @levelno, 'admin', @ClosingDate, @awardname)

                SET @reentrycount = 1
                WHILE (@reentrycount <= @reentry)
                BEGIN
                    IF (@userid != 'BM000001')
                    BEGIN
                        SET @parentid = (SELECT TOP 1 id FROM HelpingBinaryDetailPool2 WITH (NOLOCK) ORDER BY id)
                        SET @sponsercount = (SELECT COUNT(id) FROM HelpingBinaryDetailPool2 WITH (NOLOCK) WHERE parentid = @parentid)
                        IF (@sponsercount >= 2)
                        BEGIN
                            ;WITH MyCTE AS (
                                SELECT id, userid, ParentId, 0 AS userlevel
                                FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
                                WHERE id = @parentid
                                UNION ALL
                                SELECT HelpingBinaryDetailPool2.id, HelpingBinaryDetailPool2.userid,
                                       HelpingBinaryDetailPool2.ParentId, MyCTE.userlevel + 1
                                FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
                                INNER JOIN MyCTE ON HelpingBinaryDetailPool2.ParentId = MyCTE.id
                                WHERE HelpingBinaryDetailPool2.id != @parentid
                            )
                            SELECT TOP 1 @parentid = MyCTE.id
                            FROM MyCTE
                            WHERE (SELECT COUNT(id) FROM HelpingBinaryDetailPool2 ud WITH (NOLOCK) WHERE ud.ParentId = MyCTE.id) < 2
                            ORDER BY MyCTE.userlevel, MyCTE.id
                            OPTION (MAXRECURSION 0)
                        END

                        SET @StandingPositionHelping = (SELECT COUNT(userid) FROM HelpingBinaryDetailPool2 WITH (NOLOCK) WHERE ParentId = @parentid) + 1

                        INSERT INTO HelpingBinaryDetailPool2 (UserId, ParentId, StandingPosition, MentionBy, MentionDate, EntryType)
                        VALUES (@userid, @parentid, @StandingPositionHelping, 'admin', @ClosingDate, 'Re-Entry')
                    END

                    SET @reentrycount = @reentrycount + 1
                END
            END
        END

        FETCH NEXT FROM cur_closingDownline INTO @id, @downlineid, @fetchParentId, @levelno
    END
    CLOSE cur_closingDownline
    DEALLOCATE cur_closingDownline

    DELETE FROM @tempteam
    FETCH NEXT FROM cur_closing2 INTO @HelpingId, @userid
END
CLOSE cur_closing2
DEALLOCATE cur_closing2

-- TransactionDetail: user-wise credit payable after 5% admin + 5% TDS
-- (new rows + backfill of existing unmatched HelpingLevelIncomeDetailPool2)
DECLARE @AdminPer DECIMAL(18,2) = 5
DECLARE @TdsPer DECIMAL(18,2) = 5
DECLARE @TxnBase INT = ISNULL((SELECT MAX(transactionid) FROM TransactionDetail WITH (UPDLOCK, HOLDLOCK)), 0)

INSERT INTO TransactionDetail (
    transactionid, cramount, dramount, userid, transactiontype, remark, mentionby, mentiondate
)
SELECT
    @TxnBase + ROW_NUMBER() OVER (ORDER BY i.id),
    CAST(ISNULL(i.Income, 0)
        - ROUND(ISNULL(i.Income, 0) * @AdminPer / 100.0, 2)
        - ROUND(ISNULL(i.Income, 0) * @TdsPer / 100.0, 2) AS DECIMAL(18,2)),
    0,
    i.UserId,
    N'Helping Growth Bonus',
    N'Helping Growth Bonus (Admin 5% + TDS 5%) Level '
        + CAST(i.LevelNo AS NVARCHAR(10))
        + N' HelpingId=' + CAST(i.HelpingId AS NVARCHAR(20))
        + N' JuniorId=' + CAST(ISNULL(i.JuniorId, 0) AS NVARCHAR(20))
        + N' IncId=' + CAST(i.id AS NVARCHAR(20)) + N';',
    'admin',
    ISNULL(i.MentionDate, @ClosingDate)
FROM HelpingLevelIncomeDetailPool2 i WITH (NOLOCK)
WHERE ISNULL(i.Income, 0) > 0
  AND NOT EXISTS (
      SELECT 1
      FROM TransactionDetail t WITH (NOLOCK)
      WHERE t.TransactionType = N'Helping Growth Bonus'
        AND t.Remark LIKE N'%IncId=' + CAST(i.id AS NVARCHAR(20)) + N';%'
  )

SET NOCOUNT OFF
SELECT 't'
GO

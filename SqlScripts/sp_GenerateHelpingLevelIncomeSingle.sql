-- Level Closing (single/ID income) — HelpingBinaryDetail → HelpingLevelIncomeDetail
-- Rules:
--  1) Level 1 se 15 tak income
--  2) Ek bhi downline ID aate hi income milti hai
--  3) Income = HelpingLevelDetail amount / Target  (L1: 600/2=300, L2: 300/4=75)
--  4) Us level ka Target complete hone tak hi (ROW_NUMBER <= Target)
--  5) Pool2 entry: Level-1 Target complete hone par
--  6) Re-entry: max level ka Target isi run me complete hone par

IF OBJECT_ID('dbo.sp_GenerateHelpingLevelIncomeSingle', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_GenerateHelpingLevelIncomeSingle;
GO

CREATE PROC sp_GenerateHelpingLevelIncomeSingle
    @FromDate DATETIME,
    @ToDate DATETIME
AS
SET NOCOUNT ON

DECLARE @ClosingDate DATETIME = ISNULL(@ToDate, GETDATE())
DECLARE @maxlevel INT = ISNULL((SELECT MAX(LevelNo) FROM HelpingLevelDetail WITH (NOLOCK)), 15)
DECLARE @inserted TABLE (HelpingId INT, LevelNo INT)

;WITH roots AS (
    SELECT id AS HelpingId, Userid AS RootUserId
    FROM HelpingBinaryDetail WITH (NOLOCK)
),
MyCTE AS (
    SELECT r.HelpingId, r.RootUserId, h.id, h.userid, h.Parentid, 0 AS userlevel
    FROM roots r
    INNER JOIN HelpingBinaryDetail h WITH (NOLOCK) ON h.id = r.HelpingId
    UNION ALL
    SELECT MyCTE.HelpingId, MyCTE.RootUserId, d.id, d.userid, d.Parentid, MyCTE.userlevel + 1
    FROM HelpingBinaryDetail d WITH (NOLOCK)
    INNER JOIN MyCTE ON d.Parentid = MyCTE.id
    WHERE d.id <> MyCTE.HelpingId
),
ranked AS (
    SELECT
        c.HelpingId,
        c.RootUserId,
        c.id AS JuniorId,
        c.userlevel AS LevelNo,
        hl.Target,
        CASE
            WHEN ISNULL(hl.FinalAmount, 0) > 0 THEN hl.FinalAmount
            ELSE ISNULL(hl.Income, 0)
        END AS PayoutAmount,
        ROW_NUMBER() OVER (PARTITION BY c.HelpingId, c.userlevel ORDER BY c.id) AS rn
    FROM MyCTE c
    INNER JOIN HelpingLevelDetail hl WITH (NOLOCK) ON hl.LevelNo = c.userlevel
    WHERE c.userlevel >= 1 AND c.userlevel <= 15
)
INSERT INTO HelpingLevelIncomeDetail (
    HelpingId, UserId, LevelNo, Income, MentionBy, MentionDate, JuniorId
)
OUTPUT INSERTED.HelpingId, INSERTED.LevelNo INTO @inserted (HelpingId, LevelNo)
SELECT
    r.HelpingId,
    r.RootUserId,
    r.LevelNo,
    r.PayoutAmount / r.Target,
    'admin',
    @ClosingDate,
    r.JuniorId
FROM ranked r
WHERE r.Target > 0
  AND r.PayoutAmount > 0
  AND r.rn <= r.Target
  AND NOT EXISTS (
      SELECT 1 FROM HelpingLevelIncomeDetail i WITH (NOLOCK)
      WHERE i.HelpingId = r.HelpingId
        AND i.LevelNo = r.LevelNo
        AND i.JuniorId = r.JuniorId
  )
  AND NOT EXISTS (
      SELECT 1 FROM HelpingLevelIncomeDetail i WITH (NOLOCK)
      WHERE i.HelpingId = r.HelpingId
        AND i.LevelNo = r.LevelNo
        AND i.JuniorId IS NULL
        AND i.Income > 0
  )
OPTION (MAXRECURSION 0)

-- Pool2 + Re-entry
DECLARE @userid NVARCHAR(100), @HelpingId INT
DECLARE @parentid INT, @sponserid NVARCHAR(100), @sponsercount INT
DECLARE @StandingPositionHelping NVARCHAR(100)
DECLARE @team INT, @target INT, @paidcount INT

DECLARE cur_closing2 CURSOR LOCAL FAST_FORWARD FOR
SELECT id, Userid FROM HelpingBinaryDetail WITH (NOLOCK) ORDER BY id

OPEN cur_closing2
FETCH NEXT FROM cur_closing2 INTO @HelpingId, @userid
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @team = 0
    SET @target = 0
    SET @paidcount = 0
    SET @parentid = NULL

    ;WITH MyCTE AS (
        SELECT id, userid, Parentid, 0 AS userlevel
        FROM HelpingBinaryDetail WITH (NOLOCK)
        WHERE id = @HelpingId
        UNION ALL
        SELECT HelpingBinaryDetail.id, HelpingBinaryDetail.userid,
               HelpingBinaryDetail.Parentid, MyCTE.userlevel + 1
        FROM HelpingBinaryDetail WITH (NOLOCK)
        INNER JOIN MyCTE ON HelpingBinaryDetail.Parentid = MyCTE.id
        WHERE HelpingBinaryDetail.id <> @HelpingId
    )
    SELECT @team = COUNT(*)
    FROM MyCTE
    WHERE userlevel = 1
    OPTION (MAXRECURSION 0)

    SET @team = ISNULL(@team, 0)
    SET @target = ISNULL((SELECT Target FROM HelpingLevelDetail WITH (NOLOCK) WHERE LevelNo = 1), 0)

    IF (@team >= @target AND @target > 0
        AND NOT EXISTS (
            SELECT 1 FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
            WHERE HelpingBinaryId = @HelpingId OR UserId = @userid
        ))
    BEGIN
        IF (NOT EXISTS (SELECT userid FROM HelpingBinaryDetailPool2 WITH (NOLOCK)))
        BEGIN
            SET @parentid = 0
            INSERT INTO HelpingBinaryDetailPool2 (HelpingBinaryId, UserId, ParentId, StandingPosition, MentionBy, MentionDate, EntryType)
            VALUES (@HelpingId, @userid, @parentid, 0, 'admin', @ClosingDate, 'First')
        END
        ELSE
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
                    WHERE HelpingBinaryDetailPool2.id <> @parentid
                )
                SELECT TOP 1 @parentid = MyCTE.id
                FROM MyCTE
                WHERE (SELECT COUNT(id) FROM HelpingBinaryDetailPool2 ud WITH (NOLOCK) WHERE ud.ParentId = MyCTE.id) < 2
                ORDER BY MyCTE.userlevel, MyCTE.id
                OPTION (MAXRECURSION 0)
            END

            SET @StandingPositionHelping = (SELECT COUNT(userid) FROM HelpingBinaryDetailPool2 WITH (NOLOCK) WHERE ParentId = @parentid) + 1

            INSERT INTO HelpingBinaryDetailPool2 (HelpingBinaryId, UserId, ParentId, StandingPosition, MentionBy, MentionDate, EntryType)
            VALUES (@HelpingId, @userid, @parentid, @StandingPositionHelping, 'admin', @ClosingDate, 'First')
        END
    END

    -- Re-entry only if this run completed max level
    IF EXISTS (SELECT 1 FROM @inserted WHERE HelpingId = @HelpingId AND LevelNo = @maxlevel)
       AND @userid <> 'BM000001'
    BEGIN
        SET @target = ISNULL((SELECT Target FROM HelpingLevelDetail WITH (NOLOCK) WHERE LevelNo = @maxlevel), 0)
        SET @paidcount = ISNULL((
            SELECT COUNT(*) FROM HelpingLevelIncomeDetail WITH (NOLOCK)
            WHERE HelpingId = @HelpingId AND LevelNo = @maxlevel AND Income > 0
        ), 0)

        IF (@target > 0 AND @paidcount >= @target)
        BEGIN
            SET @sponserid = ISNULL((SELECT sponserid FROM UserDetail WITH (NOLOCK) WHERE UserId = @userid), '0')
            SET @parentid = (SELECT TOP 1 id FROM HelpingBinaryDetail WITH (NOLOCK) WHERE UserId = @sponserid ORDER BY id)
            SET @sponsercount = (SELECT COUNT(id) FROM HelpingBinaryDetail WITH (NOLOCK) WHERE parentid = @parentid)
            IF (@sponsercount >= 2)
            BEGIN
                ;WITH MyCTE AS (
                    SELECT id, userid, ParentId, 0 AS userlevel
                    FROM HelpingBinaryDetail WITH (NOLOCK)
                    WHERE id = @parentid
                    UNION ALL
                    SELECT HelpingBinaryDetail.id, HelpingBinaryDetail.userid,
                           HelpingBinaryDetail.ParentId, MyCTE.userlevel + 1
                    FROM HelpingBinaryDetail WITH (NOLOCK)
                    INNER JOIN MyCTE ON HelpingBinaryDetail.ParentId = MyCTE.id
                    WHERE HelpingBinaryDetail.id <> @parentid
                )
                SELECT TOP 1 @parentid = MyCTE.id
                FROM MyCTE
                WHERE (SELECT COUNT(id) FROM HelpingBinaryDetail ud WITH (NOLOCK) WHERE ud.ParentId = MyCTE.id) < 2
                ORDER BY MyCTE.userlevel, MyCTE.id
                OPTION (MAXRECURSION 0)
            END

            SET @StandingPositionHelping = (SELECT COUNT(userid) FROM HelpingBinaryDetail WITH (NOLOCK) WHERE ParentId = @parentid) + 1

            INSERT INTO HelpingBinaryDetail (UserId, ParentId, StandingPosition, MentionBy, MentionDate, EntryType, EpinNo)
            VALUES (@userid, @parentid, @StandingPositionHelping, 'admin', @ClosingDate, 'Re-Entry', NULL)
        END
    END

    FETCH NEXT FROM cur_closing2 INTO @HelpingId, @userid
END
CLOSE cur_closing2
DEALLOCATE cur_closing2

SET NOCOUNT OFF
SELECT 't'
GO

-- Growth Closing — HelpingBinaryDetailPool2 → HelpingLevelIncomeDetailPool2
-- @FromDate / @ToDate: used as MentionDate on inserts (closing UI)
-- Team count = full downline (original behaviour — date filter removed)
IF OBJECT_ID('dbo.sp_GenerateHelpingLevelIncomePool2', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_GenerateHelpingLevelIncomePool2;
GO

CREATE PROC sp_GenerateHelpingLevelIncomePool2
    @FromDate DATETIME,
    @ToDate DATETIME
AS
SET NOCOUNT ON

DECLARE @ClosingDate DATETIME = ISNULL(@ToDate, GETDATE())
DECLARE @userid NVARCHAR(100), @HelpingId INT

DECLARE cur_closing2 CURSOR STATIC FOR
SELECT id, Userid FROM HelpingBinaryDetailPool2 WITH (NOLOCK) ORDER BY id

OPEN cur_closing2
BEGIN
    FETCH NEXT FROM cur_closing2 INTO @HelpingId, @userid
    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @tempteam TABLE (levelno INT, totalteam INT)

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
        INSERT INTO @tempteam (levelno, totalteam)
        SELECT MyCTE.userlevel, COUNT(mycte.id) AS totaluser
        FROM MyCTE
        WHERE MyCTE.userlevel >= 1 AND MyCTE.userlevel <= 15
        GROUP BY MyCTE.userlevel
        ORDER BY MyCTE.userlevel
        OPTION (MAXRECURSION 0)

        DECLARE @levelno INT, @target INT, @finalamount DECIMAL(18,2), @maxlevel INT, @team INT
        DECLARE @reentry INT, @awardname NVARCHAR(100)
        DECLARE @parentid INT, @sponserid NVARCHAR(100), @sponsercount INT, @StandingPositionHelping INT

        SET @maxlevel = (SELECT MAX(levelno) FROM HelpingLevelDetailPool2 WITH (NOLOCK))
        SET @levelno = 1
        WHILE (@levelno <= @maxlevel)
        BEGIN
            SET @target = ISNULL((SELECT target FROM HelpingLevelDetailPool2 WITH (NOLOCK) WHERE LevelNo = @levelno), 0)
            SET @finalamount = ISNULL((SELECT finalamount FROM HelpingLevelDetailPool2 WHERE levelno = @levelno), 0)
            SET @awardname = ISNULL((SELECT awardname FROM HelpingLevelDetailPool2 WHERE levelno = @levelno), 0)
            SET @reentry = ISNULL((SELECT Rentry FROM HelpingLevelDetailPool2 WHERE levelno = @levelno), 0)
            SET @team = ISNULL((SELECT totalteam FROM @tempteam WHERE levelno = @levelno), 0)

            IF (@team = @target)
            BEGIN
                IF (NOT EXISTS (
                    SELECT helpingid FROM HelpingLevelIncomeDetailPool2 WITH (NOLOCK)
                    WHERE helpingid = @HelpingId AND levelno = @levelno
                ))
                BEGIN
                    INSERT INTO HelpingLevelIncomeDetailPool2 (HelpingId, UserId, LevelNo, Income, MentionBy, MentionDate, awardname)
                    VALUES (@HelpingId, @userid, @levelno, @finalamount, 'admin', @ClosingDate, @awardname)

                    --=============== Re entry ========================
                    DECLARE @reentrycount INT
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

            SET @levelno = @levelno + 1
        END

        DELETE FROM @tempteam
        FETCH NEXT FROM cur_closing2 INTO @HelpingId, @userid
    END
END
CLOSE cur_closing2
DEALLOCATE cur_closing2
SET NOCOUNT OFF

SELECT 't'
GO

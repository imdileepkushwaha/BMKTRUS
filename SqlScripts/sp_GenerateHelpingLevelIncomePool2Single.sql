-- Growth Closing (single/pair income) — HelpingBinaryDetailPool2 → HelpingLevelIncomeDetailPool2

-- Rules:

--  1) Level 1 se income nahi jati

--  2) Income = HelpingLevelDetailPool2.FinalAmount / Target  (e.g. 1200/8 = 150)

--  3) Award/re-entry loop RequireTeam se (Target nahi)

--  4) LevelNo = MyCTE.userlevel; JuniorId = Pool2 id (INT)

IF OBJECT_ID('dbo.sp_GenerateHelpingLevelIncomePool2Single', 'P') IS NOT NULL

    DROP PROCEDURE dbo.sp_GenerateHelpingLevelIncomePool2Single;

GO



CREATE PROC sp_GenerateHelpingLevelIncomePool2Single

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

        ORDER BY MyCTE.userlevel, MyCTE.id

        OPTION (MAXRECURSION 0)



        DECLARE @levelno INT, @target INT, @requireteam INT, @finalamount DECIMAL(18,2), @team INT

        DECLARE @parentid INT, @singleincome DECIMAL(18,2), @parentcount INT

        DECLARE @reentry INT, @awardname NVARCHAR(100)

        DECLARE @sponsercount INT, @StandingPositionHelping INT

        DECLARE @id INT, @downlineid NVARCHAR(100), @fetchParentId INT

        DECLARE @reentrycount INT



        DECLARE cur_closingDownline CURSOR STATIC FOR

        SELECT id, userid, ParentId, LevelNo FROM @tempteam ORDER BY LevelNo, id



        OPEN cur_closingDownline

        BEGIN

            FETCH NEXT FROM cur_closingDownline INTO @id, @downlineid, @fetchParentId, @levelno

            WHILE @@FETCH_STATUS = 0

            BEGIN

                SET @target = ISNULL((SELECT Target FROM HelpingLevelDetailPool2 WITH (NOLOCK) WHERE LevelNo = @levelno), 0)

                SET @requireteam = ISNULL((SELECT RequireTeam FROM HelpingLevelDetailPool2 WITH (NOLOCK) WHERE LevelNo = @levelno), 0)

                SET @finalamount = ISNULL((SELECT FinalAmount FROM HelpingLevelDetailPool2 WITH (NOLOCK) WHERE LevelNo = @levelno), 0)



                -- Income = FinalAmount / Target (no growth cut, no *2)

                IF (@target > 0 AND @finalamount > 0)

                    SET @singleincome = @finalamount / @target

                ELSE

                    SET @singleincome = 0



                SET @parentid = ISNULL(@fetchParentId, 0)

                SET @parentcount = (SELECT COUNT(id) FROM @tempteam WHERE ParentId = @parentid)

                SET @team = ISNULL((SELECT COUNT(id) FROM @tempteam WHERE LevelNo = @levelno), 0)



                -- Level 1 skip; eligible Pool2 pair (parent has 2) → credit FinalAmount/Target

                IF (@levelno > 1 AND @parentcount = 2 AND @singleincome > 0 AND @target > 0)

                BEGIN

                    IF (NOT EXISTS (

                        SELECT helpingid FROM HelpingLevelIncomeDetailPool2 WITH (NOLOCK)

                        WHERE helpingid = @HelpingId AND levelno = @levelno AND JuniorId = @id

                    ))

                    BEGIN

                        INSERT INTO HelpingLevelIncomeDetailPool2 (

                            HelpingId, UserId, LevelNo, Income, MentionBy, MentionDate, awardname, JuniorId

                        )

                        VALUES (

                            @HelpingId, @userid, @levelno, @singleincome, 'admin', @ClosingDate, NULL, @id

                        )

                    END

                END



                -- Level fully filled (RequireTeam) → award + re-entry

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

        END

        CLOSE cur_closingDownline

        DEALLOCATE cur_closingDownline



        DELETE FROM @tempteam

        FETCH NEXT FROM cur_closing2 INTO @HelpingId, @userid

    END

END

CLOSE cur_closing2

DEALLOCATE cur_closing2

SET NOCOUNT OFF



SELECT 't'

GO


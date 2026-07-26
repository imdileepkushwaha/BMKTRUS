-- Fixed bulk user creator for testing.
-- IMPORTANT: sp_add_UserDetailAuto ko INSERT EXEC se call NAHI karte
-- (nested BEGIN TRAN + INSERT EXEC se EPin Used ho jati hai, UserDetail rollback).
--
-- Usage:
--   -- pehle orphan used pins reactive karo (jinke user exist nahi)
--   EXEC sp_reset_OrphanUsedEPins;
--   -- phir users add karo
--   EXEC sp_add_UserDetailAuto_Bulk @UserCount = 100;
--   EXEC sp_add_UserDetailAuto_Bulk @UserCount = 100, @SponserId = 'BM000001';

IF OBJECT_ID('dbo.sp_reset_OrphanUsedEPins', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_reset_OrphanUsedEPins;
GO

CREATE PROCEDURE [dbo].[sp_reset_OrphanUsedEPins]
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE e
    SET e.EPinStatus = 'Active',
        e.UsedUserId = NULL
    FROM EPinMaster e
    WHERE e.EPinStatus = 'Used'
      AND (
            e.UsedUserId IS NULL
            OR NOT EXISTS (SELECT 1 FROM UserDetail u WHERE u.UserId = e.UsedUserId)
          );

    SELECT @@ROWCOUNT AS ReactivatedEpinCount;
END
GO

IF OBJECT_ID('dbo.sp_add_UserDetailAuto_Bulk', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_add_UserDetailAuto_Bulk;
GO

CREATE PROCEDURE [dbo].[sp_add_UserDetailAuto_Bulk]
    @UserCount   INT,
    @SponserId   NVARCHAR(100) = 'BM000001',
    @EPinOwnerId NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF (ISNULL(@UserCount, 0) <= 0)
    BEGIN
        SELECT 0 AS SuccessCount, 'UserCount must be > 0' AS Message;
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM UserDetail WITH (NOLOCK) WHERE UserId = @SponserId)
    BEGIN
        SELECT 0 AS SuccessCount, 'SponserId not found: ' + @SponserId AS Message;
        RETURN;
    END

    -- HelpingBinary root: agar sponsor missing hai to pehle seed karo
    IF NOT EXISTS (SELECT 1 FROM HelpingBinaryDetail WITH (NOLOCK) WHERE UserId = @SponserId)
    BEGIN
        INSERT INTO HelpingBinaryDetail (UserId, ParentId, StandingPosition, MentionBy, MentionDate, EntryType, EpinNo)
        VALUES (@SponserId, 0, 0, 'BULKTEST', GETDATE(), 'First', NULL);
    END

    DECLARE @i INT = 1;
    DECLARE @SuccessCount INT = 0;
    DECLARE @FailCount INT = 0;

    DECLARE @EPinNo NVARCHAR(100);
    DECLARE @StandingPosition NVARCHAR(10);
    DECLARE @UserName NVARCHAR(100);
    DECLARE @LastName NVARCHAR(100);
    DECLARE @Mobile NVARCHAR(100);
    DECLARE @Email NVARCHAR(100);
    DECLARE @Password NVARCHAR(20) = '123456';
    DECLARE @MentionBy NVARCHAR(100) = 'BULKTEST';
    DECLARE @CityId INT = 292;

    DECLARE @userid NVARCHAR(100);
    DECLARE @Id INT;
    DECLARE @ParentUserId NVARCHAR(100);
    DECLARE @transactionid INT;
    DECLARE @BonusID INT;
    DECLARE @EpinAmount DECIMAL(18,2);
    DECLARE @BV DECIMAL(18,2);
    DECLARE @OPPermission VARCHAR(500);
    DECLARE @MonthlyAmount DECIMAL(18,2);
    DECLARE @CountMonth INT;
    DECLARE @ROIPER DECIMAL(18,2);
    DECLARE @Err NVARCHAR(4000);

    DECLARE @parentid INT;
    DECLARE @sponsercount INT;
    DECLARE @StandingPositionHelping NVARCHAR(100);

    DECLARE @SponsorIncome DECIMAL(18,2);
    DECLARE @tds DECIMAL(18,2);
    DECLARE @adminper DECIMAL(18,2);
    DECLARE @admincharge DECIMAL(18,2);
    DECLARE @tdscharge DECIMAL(18,2);
    DECLARE @paybleamount DECIMAL(18,2);
    DECLARE @tdswithpan DECIMAL(18,2);
    DECLARE @tdswithoutpan DECIMAL(18,2);
    DECLARE @Pannumber NVARCHAR(50);

    CREATE TABLE #CreatedUsers
    (
        RowNo INT IDENTITY(1,1),
        EPinNo NVARCHAR(100),
        StandingPosition NVARCHAR(10),
        ResultUserId NVARCHAR(200),
        StatusMsg NVARCHAR(400)
    );

    WHILE (@i <= @UserCount)
    BEGIN
        SET @EPinNo = NULL;
        SET @userid = NULL;
        SET @Err = NULL;

        IF (@EPinOwnerId IS NULL OR LTRIM(RTRIM(@EPinOwnerId)) = '')
        BEGIN
            SELECT TOP 1 @EPinNo = EpinNo
            FROM EPinMaster WITH (UPDLOCK, READPAST)
            WHERE EPinStatus = 'Active'
            ORDER BY id;
        END
        ELSE
        BEGIN
            SELECT TOP 1 @EPinNo = EpinNo
            FROM EPinMaster WITH (UPDLOCK, READPAST)
            WHERE EPinStatus = 'Active'
              AND GenerateUserId = @EPinOwnerId
            ORDER BY id;
        END

        IF (@EPinNo IS NULL)
        BEGIN
            INSERT INTO #CreatedUsers (EPinNo, StandingPosition, ResultUserId, StatusMsg)
            VALUES (NULL, NULL, NULL, 'STOPPED: Active EPin khatam. Remaining=' + CAST(@UserCount - @i + 1 AS VARCHAR(10)));
            BREAK;
        END

        SET @StandingPosition = CAST(((@i - 1) % 3) + 1 AS NVARCHAR(10));
        SET @UserName = 'TestUser' + CAST(@i AS VARCHAR(10));
        SET @LastName = 'Auto' + CAST(@i AS VARCHAR(10));
        SET @Mobile = '9' + RIGHT('000000000' + CAST(100000000 + @i AS VARCHAR(10)), 9);
        SET @Email = 'testuser' + CAST(@i AS VARCHAR(10)) + '@test.local';
        SET @ParentUserId = @SponserId;

        BEGIN TRY
            BEGIN TRANSACTION;

            SET @Id = (SELECT ISNULL(MAX(Id), 0) + 1 FROM UserDetail WITH (UPDLOCK, HOLDLOCK));
            SET @userid = 'BM' + RIGHT('00000' + CONVERT(VARCHAR(6), @Id), 6);

            IF EXISTS (SELECT 1 FROM EPinMaster WITH (UPDLOCK) WHERE EpinNo = @EPinNo AND EPinStatus = 'Used')
            BEGIN
                ROLLBACK TRANSACTION;
                INSERT INTO #CreatedUsers (EPinNo, StandingPosition, ResultUserId, StatusMsg)
                VALUES (@EPinNo, @StandingPosition, NULL, 'EPin already Used');
                SET @FailCount = @FailCount + 1;
                SET @i = @i + 1;
                CONTINUE;
            END

            SET @transactionid = (SELECT ISNULL(MAX(TransactionId), 0) + 1 FROM TransactionDetail WITH (UPDLOCK, HOLDLOCK));
            SET @BonusID = 0;
            SET @EpinAmount = (SELECT ISNULL(Amount, 0) FROM EPinMaster WHERE EpinNo = @EPinNo);

            SELECT
                @BV = BuisnessVolume,
                @OPPermission = Operatorpermission,
                @BonusID = Id,
                @MonthlyAmount = MonthlyAmount,
                @CountMonth = CountMonth,
                @ROIPER = roi
            FROM PlanMaster
            WHERE planamount = @EpinAmount;

            UPDATE EPinMaster
            SET EPinStatus = 'Used',
                UsedUserId = @userid
            WHERE EpinNo = @EPinNo;

            INSERT INTO UserDetail
            (
                id, UserId, SponserId, UserName, DateofBirth, Gender, Email, Mobile, Address,
                CityId, AreaName, Pincode, RegDate, EPinNo, ParentUserId, StandingPosition,
                DeleteStatus, ActiveStatus, MentionBy, MentionDate, BalanceAmount, TransactionId,
                status, slabId, OtherCity, utilitybalance, transactionpassword, activatedate,
                coursename, telegramname, telegramnumber
            )
            VALUES
            (
                @Id, @userid, @SponserId, @UserName, '1990-01-01', 'Male', @Email, @Mobile, 'Test Address',
                @CityId, '', '000000', GETDATE(), NULL, @ParentUserId, @StandingPosition,
                '0', '1', @MentionBy, GETDATE(), 0, @transactionid,
                1, @BonusID, NULL, 0, @Password, GETDATE(),
                '', '', ''
            );

            INSERT INTO LoginDetail (Username, Password, Role, Status, MentionBy, MentionDate)
            VALUES (@userid, @Password, 'User', '1', @MentionBy, GETDATE());

            INSERT INTO UserTopupTb (Userid, entrydate, PlanId, Status, Planamount, Type)
            VALUES (@userid, GETDATE(), @BonusID, 0, @EpinAmount, 'A');

            UPDATE UserDetail SET Rank = 'Distributor' WHERE UserId = @userid;

            IF (@StandingPosition = '1')
                UPDATE UserDetail SET DirectLeft = '1' WHERE UserId = @ParentUserId;

            IF (@StandingPosition = '2')
                UPDATE UserDetail SET DirectRight = '1' WHERE UserId = @ParentUserId;

            -- HelpingBinaryDetail (same logic as sp_add_UserDetailAuto)
            IF NOT EXISTS (SELECT userid FROM HelpingBinaryDetail WITH (NOLOCK) WHERE userid = @userid)
            BEGIN
                IF NOT EXISTS (SELECT userid FROM HelpingBinaryDetail WITH (NOLOCK))
                BEGIN
                    SET @parentid = 0;
                    INSERT INTO HelpingBinaryDetail (UserId, ParentId, StandingPosition, MentionBy, MentionDate, EntryType, EpinNo)
                    VALUES (@userid, @parentid, 0, @MentionBy, GETDATE(), 'First', @EPinNo);
                END
                ELSE
                BEGIN
                    SET @parentid = (SELECT TOP 1 id FROM HelpingBinaryDetail WITH (NOLOCK) WHERE UserId = @SponserId ORDER BY id);

                    IF (@parentid IS NULL)
                    BEGIN
                        -- sponsor node missing: attach under root-like first node
                        SET @parentid = (SELECT TOP 1 id FROM HelpingBinaryDetail WITH (NOLOCK) ORDER BY id);
                    END

                    SET @sponsercount = (SELECT COUNT(id) FROM HelpingBinaryDetail WITH (NOLOCK) WHERE parentid = @parentid);
                    IF (@sponsercount >= 2)
                    BEGIN
                        ; WITH MyCTE AS
                        (
                            SELECT id, userid, ParentId, 0 AS userlevel
                            FROM HelpingBinaryDetail WITH (NOLOCK)
                            WHERE id = @parentid
                            UNION ALL
                            SELECT h.id, h.userid, h.ParentId, MyCTE.userlevel + 1
                            FROM HelpingBinaryDetail h WITH (NOLOCK)
                            INNER JOIN MyCTE ON h.ParentId = MyCTE.id
                            WHERE h.id <> @parentid
                        )
                        SELECT TOP 1 @parentid = MyCTE.id
                        FROM MyCTE
                        WHERE (SELECT COUNT(id) FROM HelpingBinaryDetail ud WITH (NOLOCK) WHERE ud.ParentId = MyCTE.id) < 2
                        ORDER BY MyCTE.userlevel, MyCTE.id
                        OPTION (MAXRECURSION 0);
                    END

                    SET @StandingPositionHelping =
                        CAST((SELECT COUNT(userid) FROM HelpingBinaryDetail WITH (NOLOCK) WHERE ParentId = @parentid) + 1 AS NVARCHAR(100));

                    INSERT INTO HelpingBinaryDetail (UserId, ParentId, StandingPosition, MentionBy, MentionDate, EntryType, EpinNo)
                    VALUES (@userid, @parentid, @StandingPositionHelping, @MentionBy, GETDATE(), 'First', @EPinNo);
                END
            END

            -- Direct income calc (same rules; insert commented in original SP)
            SET @SponsorIncome = 0;
            SET @tds = 0;
            SET @adminper = 0;
            SET @admincharge = 0;
            SET @tdscharge = 0;
            SET @paybleamount = 0;
            SET @tdswithpan = 0;
            SET @tdswithoutpan = 0;

            SELECT @adminper = admincharge, @tdswithpan = tdswithpan, @tdswithoutpan = tdswithoutpan
            FROM tbl_Deduction WHERE id = 1;

            SELECT @Pannumber = ISNULL(PanNumber, '') FROM UserDetail WHERE UserId = @SponserId;
            IF (@Pannumber = '') SET @tds = @tdswithoutpan; ELSE SET @tds = @tdswithpan;

            IF (@BV = 1200) SET @SponsorIncome = 50;
            IF (@BV = 2400) SET @SponsorIncome = 100;
            IF (@BV = 3600) SET @SponsorIncome = 150;
            IF (@BV = 4800) SET @SponsorIncome = 200;

            SET @admincharge = @SponsorIncome * @adminper * 0.01;
            SET @tdscharge = @SponsorIncome * @tds * 0.01;
            SET @paybleamount = @SponsorIncome - @admincharge - @tdscharge;

            UPDATE UserDetail SET Legstatus = ISNULL(Legstatus, 0) + 1 WHERE UserId = @ParentUserId;

            COMMIT TRANSACTION;

            INSERT INTO #CreatedUsers (EPinNo, StandingPosition, ResultUserId, StatusMsg)
            VALUES (@EPinNo, @StandingPosition, @userid, 'OK');
            SET @SuccessCount = @SuccessCount + 1;
        END TRY
        BEGIN CATCH
            SET @Err = ERROR_MESSAGE();
            IF (XACT_STATE() <> 0)
                ROLLBACK TRANSACTION;

            -- safety: agar kisi reason se pin Used reh gayi aur user nahi bana, wapas Active
            IF (@EPinNo IS NOT NULL AND @userid IS NOT NULL)
            BEGIN
                IF EXISTS (SELECT 1 FROM EPinMaster WHERE EpinNo = @EPinNo AND EPinStatus = 'Used' AND UsedUserId = @userid)
                   AND NOT EXISTS (SELECT 1 FROM UserDetail WHERE UserId = @userid)
                BEGIN
                    UPDATE EPinMaster
                    SET EPinStatus = 'Active', UsedUserId = NULL
                    WHERE EpinNo = @EPinNo AND UsedUserId = @userid;
                END
            END

            INSERT INTO #CreatedUsers (EPinNo, StandingPosition, ResultUserId, StatusMsg)
            VALUES (@EPinNo, @StandingPosition, NULL, 'ERROR: ' + ISNULL(@Err, 'unknown'));
            SET @FailCount = @FailCount + 1;
        END CATCH

        SET @i = @i + 1;
    END

    SELECT
        @SuccessCount AS SuccessCount,
        @FailCount AS FailCount,
        @UserCount AS RequestedCount,
        'Done' AS Message;

    SELECT * FROM #CreatedUsers ORDER BY RowNo;

    DROP TABLE #CreatedUsers;
END
GO

-- Helping Binary Pool2 (2X2 matrix) downline tree
-- Used by: user/admin HelpingBinaryMatrix2X2.aspx -> HelpingBinaryTree2X2.aspx
IF OBJECT_ID('dbo.sp_getHelpingBinaryPool2', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_getHelpingBinaryPool2;
GO

CREATE PROC sp_getHelpingBinaryPool2
    @userid NVARCHAR(100)
AS
DECLARE @parentid INT
SET @parentid = (SELECT TOP 1 id FROM HelpingBinaryDetailPool2 WITH (NOLOCK) WHERE userid = @userid)

;WITH MyCTE
AS (
    SELECT id, userid, ParentId, 0 AS userlevel
    FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
    WHERE id = @parentid
    UNION ALL
    SELECT HelpingBinaryDetailPool2.id, HelpingBinaryDetailPool2.userid, HelpingBinaryDetailPool2.ParentId, MyCTE.userlevel + 1
    FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
    INNER JOIN MyCTE ON HelpingBinaryDetailPool2.ParentId = MyCTE.id
    WHERE HelpingBinaryDetailPool2.id != @parentid
)
SELECT mycte.*, UserDetail.UserName
FROM mycte
LEFT JOIN UserDetail WITH (NOLOCK) ON UserDetail.UserId = mycte.userid
ORDER BY mycte.userlevel, mycte.id
OPTION (MAXRECURSION 0)
GO

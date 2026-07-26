-- Helping Binary downline tree
-- Used by: user/admin HelpingBinaryMatrix.aspx -> HelpingBinaryTree.aspx
IF OBJECT_ID('dbo.sp_getHelpingBinary', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_getHelpingBinary;
GO

CREATE PROC sp_getHelpingBinary
    @userid NVARCHAR(100)
AS
DECLARE @parentid INT
SET @parentid = (SELECT TOP 1 id FROM HelpingBinaryDetail WITH (NOLOCK) WHERE userid = @userid)

;WITH MyCTE
AS (
    SELECT id, userid, ParentId, 0 AS userlevel
    FROM HelpingBinaryDetail WITH (NOLOCK)
    WHERE id = @parentid
    UNION ALL
    SELECT HelpingBinaryDetail.id, HelpingBinaryDetail.userid, HelpingBinaryDetail.ParentId, MyCTE.userlevel + 1
    FROM HelpingBinaryDetail WITH (NOLOCK)
    INNER JOIN MyCTE ON HelpingBinaryDetail.ParentId = MyCTE.id
    WHERE HelpingBinaryDetail.id != @parentid
)
SELECT mycte.*, UserDetail.UserName
FROM mycte
LEFT JOIN UserDetail WITH (NOLOCK) ON UserDetail.UserId = mycte.userid
ORDER BY mycte.userlevel, mycte.id
OPTION (MAXRECURSION 0)
GO

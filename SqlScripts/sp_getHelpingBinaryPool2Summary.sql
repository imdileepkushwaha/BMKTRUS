-- Helping Binary Pool2 level-wise summary
-- LevelNo + Target (required) from HelpingLevelDetailPool2
-- Team (completed) = downline count at that level
-- Used by: user/HelpingBinaryLevelWiseReport2X2.aspx
IF OBJECT_ID('dbo.sp_getHelpingBinaryPool2Summary', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_getHelpingBinaryPool2Summary;
GO

CREATE PROC sp_getHelpingBinaryPool2Summary
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
SELECT hl.LevelNo, hl.Target, COUNT(mycte.userid) AS Team
FROM HelpingLevelDetailPool2 hl WITH (NOLOCK)
LEFT JOIN MyCTE ON MyCTE.userlevel = hl.LevelNo
WHERE hl.Income > 0
GROUP BY hl.LevelNo, hl.Target
ORDER BY hl.LevelNo
OPTION (MAXRECURSION 0)
GO

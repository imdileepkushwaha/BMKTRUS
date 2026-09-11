-- Pool2 qualify check (level summary only)
-- HelpingLevelDetailPool2.Target = QualifyId
-- TeamCount            = us level par kitni IDs
-- CompleteParentCount  = just-uper parents me se kitne ke StandingPosition 1 AND 2 complete

IF OBJECT_ID('dbo.sp_getHelpingBinaryPool2Qualify', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_getHelpingBinaryPool2Qualify;
GO

CREATE PROC sp_getHelpingBinaryPool2Qualify
    @userid NVARCHAR(100)
AS
SET NOCOUNT ON

DECLARE @parentid INT
SET @parentid = (
    SELECT TOP 1 id
    FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
    WHERE userid = @userid
    ORDER BY id
)

IF OBJECT_ID('tempdb..#tree') IS NOT NULL DROP TABLE #tree
IF OBJECT_ID('tempdb..#legs') IS NOT NULL DROP TABLE #legs

CREATE TABLE #tree (
    id INT NOT NULL PRIMARY KEY,
    userid NVARCHAR(100),
    ParentId INT,
    StandingPosition INT,
    userlevel INT
)

CREATE TABLE #legs (
    ParentId INT NOT NULL PRIMARY KEY,
    ChildCount INT,
    Pos1Count INT,
    Pos2Count INT
)

IF @parentid IS NULL
BEGIN
    SELECT
        CAST(NULL AS INT) AS LevelNo,
        CAST(NULL AS INT) AS QualifyId,
        CAST(NULL AS INT) AS RequireTeam,
        CAST(0 AS INT) AS TeamCount,
        CAST(0 AS INT) AS CompleteParentCount,
        CAST(0 AS INT) AS IsQualified
    WHERE 1 = 0
    RETURN
END

;WITH MyCTE AS (
    SELECT id, userid, ParentId, StandingPosition, 0 AS userlevel
    FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
    WHERE id = @parentid
    UNION ALL
    SELECT
        d.id,
        d.userid,
        d.ParentId,
        d.StandingPosition,
        MyCTE.userlevel + 1
    FROM HelpingBinaryDetailPool2 d WITH (NOLOCK)
    INNER JOIN MyCTE ON d.ParentId = MyCTE.id
    WHERE d.id <> @parentid
)
INSERT INTO #tree (id, userid, ParentId, StandingPosition, userlevel)
SELECT id, userid, ParentId, StandingPosition, userlevel
FROM MyCTE
OPTION (MAXRECURSION 0)

INSERT INTO #legs (ParentId, ChildCount, Pos1Count, Pos2Count)
SELECT
    ParentId,
    COUNT(*) AS ChildCount,
    SUM(CASE WHEN StandingPosition = 1 THEN 1 ELSE 0 END) AS Pos1Count,
    SUM(CASE WHEN StandingPosition = 2 THEN 1 ELSE 0 END) AS Pos2Count
FROM HelpingBinaryDetailPool2 WITH (NOLOCK)
WHERE ParentId IS NOT NULL AND ParentId <> 0
GROUP BY ParentId

;WITH pairlvl AS (
    SELECT
        p.userlevel,
        COUNT(*) AS CompleteParentCount
    FROM #tree p
    INNER JOIN #legs lp ON lp.ParentId = p.id
    WHERE lp.Pos1Count >= 1 AND lp.Pos2Count >= 1
    GROUP BY p.userlevel
),
team AS (
    SELECT userlevel, COUNT(*) AS TeamCount
    FROM #tree
    WHERE userlevel >= 1
    GROUP BY userlevel
)
SELECT
    hl.LevelNo,
    hl.Target AS QualifyId,
    ISNULL(hl.RequireTeam, 0) AS RequireTeam,
    ISNULL(tm.TeamCount, 0) AS TeamCount,
    ISNULL(pl.CompleteParentCount, 0) AS CompleteParentCount,
    CASE
        WHEN hl.Target > 0
         AND ISNULL(tm.TeamCount, 0) >= hl.Target
         AND ISNULL(pl.CompleteParentCount, 0) >= ISNULL(NULLIF(hl.RequireTeam, 0), hl.Target / 2)
        THEN 1 ELSE 0
    END AS IsQualified
FROM HelpingLevelDetailPool2 hl WITH (NOLOCK)
LEFT JOIN team tm ON tm.userlevel = hl.LevelNo
LEFT JOIN pairlvl pl ON pl.userlevel = CASE WHEN hl.LevelNo <= 1 THEN 0 ELSE hl.LevelNo - 1 END
ORDER BY hl.LevelNo

DROP TABLE #tree
DROP TABLE #legs
GO

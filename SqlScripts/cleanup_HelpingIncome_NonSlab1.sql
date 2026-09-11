-- SlabID <> 1 (0 plan-amount) wali SAARI helping IDs se income hatao.
-- Pehle check, phir delete. Procedure alag se deploy karo:
--   SqlScripts/sp_GenerateHelpingLevelIncomeSingle.sql

-- 1) Confirm live SP mein SlabID filter hai ya nahi
SELECT
    CASE
        WHEN OBJECT_DEFINITION(OBJECT_ID('dbo.sp_GenerateHelpingLevelIncomeSingle')) LIKE '%SlabID%'
            THEN 'DEPLOYED'
        ELSE 'NOT DEPLOYED — pehle sp_GenerateHelpingLevelIncomeSingle.sql run karo'
    END AS ProcSlabFilter

-- 2) Saari SlabID <> 1 helping / Junior IDs
SELECT
    h.id AS JuniorId,
    h.Userid,
    ud.UserId,
    ISNULL(ud.SlabID, 0) AS SlabID,
    ud.UserName
FROM HelpingBinaryDetail h WITH (NOLOCK)
INNER JOIN UserDetail ud WITH (NOLOCK)
    ON LTRIM(RTRIM(ud.UserId)) = LTRIM(RTRIM(h.Userid))
WHERE ISNULL(ud.SlabID, 0) <> 1
ORDER BY h.id

-- 3) In JuniorIds se mili hui income
SELECT
    i.id,
    i.HelpingId,
    i.UserId,
    i.LevelNo,
    i.JuniorId,
    i.Income,
    i.MentionDate
FROM HelpingLevelIncomeDetail i WITH (NOLOCK)
WHERE i.JuniorId IN (
    SELECT h.id
    FROM HelpingBinaryDetail h WITH (NOLOCK)
    INNER JOIN UserDetail ud WITH (NOLOCK)
        ON LTRIM(RTRIM(ud.UserId)) = LTRIM(RTRIM(h.Userid))
    WHERE ISNULL(ud.SlabID, 0) <> 1
)
ORDER BY i.JuniorId, i.id

-- 4) Delete — uncomment karke run karo jab step 3 sahi dikhe
/*
DELETE i
FROM HelpingLevelIncomeDetail i
WHERE i.JuniorId IN (
    SELECT h.id
    FROM HelpingBinaryDetail h WITH (NOLOCK)
    INNER JOIN UserDetail ud WITH (NOLOCK)
        ON LTRIM(RTRIM(ud.UserId)) = LTRIM(RTRIM(h.Userid))
    WHERE ISNULL(ud.SlabID, 0) <> 1
)
*/

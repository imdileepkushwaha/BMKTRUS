-- Backfill TransactionDetail for existing HelpingLevelIncomeDetail
-- Payable = Income - 5% admin - 5% TDS. Duplicate IncId= rows skip.

SET NOCOUNT ON

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
    N'Helping Level Income',
    N'Helping Level Income (Admin 5% + TDS 5%) Level '
        + CAST(i.LevelNo AS NVARCHAR(10))
        + N' HelpingId=' + CAST(i.HelpingId AS NVARCHAR(20))
        + N' JuniorId=' + CAST(ISNULL(i.JuniorId, 0) AS NVARCHAR(20))
        + N' IncId=' + CAST(i.id AS NVARCHAR(20)) + N';',
    'admin',
    ISNULL(i.MentionDate, GETDATE())
FROM HelpingLevelIncomeDetail i WITH (NOLOCK)
WHERE ISNULL(i.Income, 0) > 0
  AND NOT EXISTS (
      SELECT 1
      FROM TransactionDetail t WITH (NOLOCK)
      WHERE t.TransactionType = N'Helping Level Income'
        AND t.Remark LIKE N'%IncId=' + CAST(i.id AS NVARCHAR(20)) + N';%'
  )

SELECT @@ROWCOUNT AS InsertedRows
GO

-- Referral bonus: 5% admin + 5% TDS on directincometb + TransactionDetail payable credit.
-- Future joins: AFTER INSERT on directincometb writes payable txn (joining SPs often reuse
-- TransactionId so their Direct Income insert fails). Untagged Direct Income rows from the
-- SP are deleted so they cannot double-credit.

SET NOCOUNT ON

-- 1) Stored charges on existing rows
UPDATE directincometb
SET adminper = 5,
    tdsper = 5,
    admincharge = ROUND(ISNULL(directincome, 0) * 0.05, 2),
    tdscharge = ROUND(ISNULL(directincome, 0) * 0.05, 2),
    paybleamount = ISNULL(directincome, 0)
        - ROUND(ISNULL(directincome, 0) * 0.05, 2)
        - ROUND(ISNULL(directincome, 0) * 0.05, 2)
WHERE ISNULL(directincome, 0) > 0
  AND (
        ISNULL(adminper, 0) <> 5
     OR ISNULL(tdsper, 0) <> 5
     OR ISNULL(admincharge, 0) = 0
     OR ISNULL(tdscharge, 0) = 0
  )

-- 2) Credit payable for existing income (skip if already posted)
DECLARE @TxnBase INT = ISNULL((SELECT MAX(transactionid) FROM TransactionDetail WITH (UPDLOCK, HOLDLOCK)), 0)

INSERT INTO TransactionDetail (
    transactionid, cramount, dramount, userid, transactiontype, remark, mentionby, mentiondate
)
SELECT
    @TxnBase + ROW_NUMBER() OVER (ORDER BY d.id),
    CAST(ISNULL(d.directincome, 0)
        - ROUND(ISNULL(d.directincome, 0) * 0.05, 2)
        - ROUND(ISNULL(d.directincome, 0) * 0.05, 2) AS DECIMAL(18,2)),
    0,
    d.userid,
    N'Direct Income',
    N'Direct Income (Admin 5% + TDS 5%) From '
        + ISNULL(d.fromuserid, N'')
        + N' RefId=' + CAST(d.id AS NVARCHAR(20)) + N';',
    'admin',
    ISNULL(d.entrydate, GETDATE())
FROM directincometb d WITH (NOLOCK)
WHERE ISNULL(d.directincome, 0) > 0
  AND NOT EXISTS (
      SELECT 1
      FROM TransactionDetail t WITH (NOLOCK)
      WHERE t.TransactionType = N'Direct Income'
        AND t.Remark LIKE N'%RefId=' + CAST(d.id AS NVARCHAR(20)) + N';%'
  )

SELECT @@ROWCOUNT AS InsertedTxnRows

-- 3) Future: fill 5%/5% and credit payable txn on new directincometb rows
IF OBJECT_ID('dbo.trg_directincometb_ApplyTds', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_directincometb_ApplyTds
GO
CREATE TRIGGER dbo.trg_directincometb_ApplyTds ON dbo.directincometb
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON

    UPDATE d
    SET adminper = 5,
        tdsper = 5,
        admincharge = ROUND(ISNULL(d.directincome, 0) * 0.05, 2),
        tdscharge = ROUND(ISNULL(d.directincome, 0) * 0.05, 2),
        paybleamount = ISNULL(d.directincome, 0)
            - ROUND(ISNULL(d.directincome, 0) * 0.05, 2)
            - ROUND(ISNULL(d.directincome, 0) * 0.05, 2)
    FROM dbo.directincometb d
    INNER JOIN inserted i ON i.id = d.id

    DECLARE @TxnBase INT = ISNULL((SELECT MAX(transactionid) FROM TransactionDetail WITH (UPDLOCK, HOLDLOCK)), 0)

    INSERT INTO TransactionDetail (
        transactionid, cramount, dramount, userid, transactiontype, remark, mentionby, mentiondate
    )
    SELECT
        @TxnBase + ROW_NUMBER() OVER (ORDER BY i.id),
        CAST(ISNULL(i.directincome, 0)
            - ROUND(ISNULL(i.directincome, 0) * 0.05, 2)
            - ROUND(ISNULL(i.directincome, 0) * 0.05, 2) AS DECIMAL(18,2)),
        0,
        i.userid,
        N'Direct Income',
        N'Direct Income (Admin 5% + TDS 5%) From '
            + ISNULL(i.fromuserid, N'')
            + N' RefId=' + CAST(i.id AS NVARCHAR(20)) + N';',
        'admin',
        ISNULL(i.entrydate, GETDATE())
    FROM inserted i
    WHERE ISNULL(i.directincome, 0) > 0
      AND NOT EXISTS (
          SELECT 1
          FROM TransactionDetail t WITH (NOLOCK)
          WHERE t.TransactionType = N'Direct Income'
            AND t.Remark LIKE N'%RefId=' + CAST(i.id AS NVARCHAR(20)) + N';%'
      )
END
GO

-- 4) If joining SP also inserts a gross Direct Income row, drop it (payable already posted above)
IF OBJECT_ID('dbo.trg_TransactionDetail_DirectIncomeNet', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_TransactionDetail_DirectIncomeNet
GO
CREATE TRIGGER dbo.trg_TransactionDetail_DirectIncomeNet ON dbo.TransactionDetail
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON

    DELETE t
    FROM dbo.TransactionDetail t
    INNER JOIN inserted ins ON ins.TransactionId = t.TransactionId
    WHERE ins.TransactionType = N'Direct Income'
      AND ISNULL(ins.Remark, N'') NOT LIKE N'%(Admin 5% + TDS 5%)%'
      AND ISNULL(ins.CrAmount, 0) > 0
END
GO

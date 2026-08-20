IF OBJECT_ID('dbo.DonationRequest', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.DonationRequest
    (
        id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        UserId NVARCHAR(50) NOT NULL,
        Amount DECIMAL(18,2) NOT NULL,
        DepositBankID INT NULL,
        OnlineTransactionId NVARCHAR(100) NULL,
        Img NVARCHAR(500) NULL,
        Status NVARCHAR(20) NOT NULL CONSTRAINT DF_DonationRequest_Status DEFAULT ('Pending'),
        RejectReason NVARCHAR(500) NULL,
        MentionBy NVARCHAR(50) NULL,
        MentionDate DATETIME NOT NULL CONSTRAINT DF_DonationRequest_MentionDate DEFAULT (GETDATE()),
        ApproveBy NVARCHAR(50) NULL,
        ApproveDate DATETIME NULL
    );
END
GO

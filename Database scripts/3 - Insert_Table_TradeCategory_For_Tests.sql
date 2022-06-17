USE [TradesApi]
GO

INSERT INTO [dbo].[TradeCategory] VALUES (NEWID(), 'LOWRISK', 1000000, 'Public', 2, GETDATE())
INSERT INTO [dbo].[TradeCategory] VALUES (NEWID(), 'MEDIUMRISK', 1000000, 'Public', 3, GETDATE())
INSERT INTO [dbo].[TradeCategory] VALUES (NEWID(), 'HIGHRISK', 1000000, 'Private', 3, GETDATE())

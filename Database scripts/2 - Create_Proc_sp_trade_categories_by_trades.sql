USE [TradesApi]
GO

CREATE TYPE [dbo].[Trades_list] AS TABLE
(
    Value FLOAT,
	ClientSector NVARCHAR(25)
)
GO

CREATE PROCEDURE [dbo].[sp_trade_categories_by_trades] (@list_trades [dbo].[Trades_list] READONLY)
AS
BEGIN
DECLARE @value FLOAT, @clientSector NVARCHAR(25);

DECLARE cursorTrade CURSOR FOR
select Value, ClientSector from @list_trades

OPEN cursorTrade
 
FETCH NEXT FROM cursorTrade INTO @value, @clientSector
 
WHILE @@FETCH_STATUS = 0
BEGIN
 
	SELECT tc.Category        
    FROM [TradesApi].[dbo].[TradeCategory] tc
	WHERE (tc.ClientSector = @clientSector AND tc.Symbol = 1 AND @value =tc.Value) OR
		  (tc.ClientSector = @clientSector AND tc.Symbol = 2 AND @value < tc.Value) OR
		  (tc.ClientSector = @clientSector AND tc.Symbol = 3 AND @value >= tc.Value) 
 
FETCH NEXT FROM cursorTrade INTO @value, @clientSector
END
 
CLOSE cursorTrade
 
DEALLOCATE cursorTrade
END
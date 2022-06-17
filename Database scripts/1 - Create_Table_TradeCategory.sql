USE [TradesApi]
GO

CREATE TABLE [dbo].[TradeCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Category] [nvarchar](25) NOT NULL,
	[Value] [float] NOT NULL,
	[ClientSector] [nvarchar](25) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TradeCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_trade_category_Value_ClientSector ON [dbo].[TradeCategory](Value ASC,ClientSector ASC);
GO
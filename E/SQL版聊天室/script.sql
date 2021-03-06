IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'test')
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[聊天记录]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[聊天记录](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[内容] [varchar](500) NULL,
	[时间] [datetime] NULL CONSTRAINT [DF_聊天记录_时间]  DEFAULT (getdate())
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[在线昵称]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[在线昵称](
	[昵称] [varchar](50) NULL,
	[时间] [datetime] NULL CONSTRAINT [DF_在线昵称_时间]  DEFAULT (getdate())
) ON [PRIMARY]
END

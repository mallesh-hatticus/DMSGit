USE [DMS]
GO
/****** Object:  Table [dbo].[DMST_User]    Script Date: 1/25/2020 4:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DMST_User](
	[Usr_ID] [int] IDENTITY(1,1) NOT NULL,
	[Usr_Name] [varchar](150) NULL,
	[Usr_Email] [varchar](50) NULL,
	[Usr_Password] [varchar](50) NULL,
	[Usr_RoleID] [int] NULL,
	[Is_Active] [bit] NOT NULL,
	[Usr_CreatedDate] [datetime] NULL,
	[Usr_CreatedBy] [int] NULL,
	[Usr_ModifiedDate] [datetime] NULL,
	[Usr_ModifiedBy] [int] NULL,
 CONSTRAINT [PK_DMST_User] PRIMARY KEY CLUSTERED 
(
	[Usr_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DMST_User] ADD  CONSTRAINT [DF_DMST_User_IS_Active]  DEFAULT ((1)) FOR [Is_Active]
GO

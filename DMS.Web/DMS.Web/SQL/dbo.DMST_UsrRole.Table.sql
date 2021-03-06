USE [DMS]
GO
/****** Object:  Table [dbo].[DMST_UsrRole]    Script Date: 1/25/2020 4:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DMST_UsrRole](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NULL,
	[Role_Description] [varchar](50) NULL,
	[Is_Active] [bit] NOT NULL,
	[Role_CreatedBy] [int] NULL,
	[Role_CreatedDate] [datetime] NULL,
	[Role_ModifiedBy] [int] NULL,
	[Role_ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DMST_UsrRole] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DMST_UsrRole] ADD  CONSTRAINT [DF_DMST_UsrRole_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO

USE [DMS]
GO
/****** Object:  Table [dbo].[DMST_MenuTypes]    Script Date: 1/25/2020 4:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DMST_MenuTypes](
	[MT_Id] [int] IDENTITY(1,1) NOT NULL,
	[MT_TypeName] [varchar](50) NULL,
	[MT_Description] [varchar](50) NULL,
	[Is_Active] [bit] NOT NULL,
	[MT_CreatedBy] [int] NULL,
	[MT_CreatedDate] [datetime] NULL,
	[MT_ModifiedBy] [datetime] NULL,
	[MT_ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DMST_MenuTypes] PRIMARY KEY CLUSTERED 
(
	[MT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DMST_MenuTypes] ADD  CONSTRAINT [DF_DMST_MenuTypes_Is_Active]  DEFAULT ((0)) FOR [Is_Active]
GO

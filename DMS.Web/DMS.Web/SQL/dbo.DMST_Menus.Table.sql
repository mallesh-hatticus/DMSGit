USE [DMS]
GO
/****** Object:  Table [dbo].[DMST_Menus]    Script Date: 1/25/2020 4:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DMST_Menus](
	[Menu_ID] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Name] [varchar](50) NULL,
	[Menu_TypeID] [int] NULL,
	[Menu_ParentID] [int] NULL,
	[Menu_Url] [varchar](50) NULL,
	[Is_Active] [bit] NOT NULL,
	[Menu_CreatedBy] [int] NULL,
	[Menu_CreatedDate] [datetime] NULL,
	[Menu_ModifiedBy] [int] NULL,
	[Menu_ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DMST_Menus] PRIMARY KEY CLUSTERED 
(
	[Menu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DMST_Menus] ADD  CONSTRAINT [DF_DMST_Menus_Is_Active]  DEFAULT ((0)) FOR [Is_Active]
GO

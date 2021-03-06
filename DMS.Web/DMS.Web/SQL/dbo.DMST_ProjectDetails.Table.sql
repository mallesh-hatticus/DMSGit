USE [DMS]
GO
/****** Object:  Table [dbo].[DMST_ProjectDetails]    Script Date: 1/25/2020 4:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DMST_ProjectDetails](
	[Projd_ID] [int] IDENTITY(1,1) NOT NULL,
	[Projd_Name] [varchar](50) NULL,
	[Projd_PrjTypeID] [int] NULL,
	[Projd_Description] [varchar](50) NULL,
	[Projd_MasterTable] [varchar](50) NULL,
	[Is_Active] [bit] NOT NULL,
	[Projd_CreatedBy] [int] NULL,
	[Projd_CreatedDate] [datetime] NULL,
	[Projd_ModifiedBy] [int] NULL,
	[Projd_ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DMST_ProjectDetails] PRIMARY KEY CLUSTERED 
(
	[Projd_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DMST_ProjectDetails] ADD  CONSTRAINT [DF_DMST_ProjectDetails_Is_Active]  DEFAULT ((0)) FOR [Is_Active]
GO

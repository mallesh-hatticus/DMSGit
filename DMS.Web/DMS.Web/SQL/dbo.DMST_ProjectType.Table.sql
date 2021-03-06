USE [DMS]
GO
/****** Object:  Table [dbo].[DMST_ProjectType]    Script Date: 1/25/2020 4:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DMST_ProjectType](
	[Proj_TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Proj_TypeName] [varchar](50) NULL,
	[Proj_TypeDescription] [varchar](50) NULL,
	[Is_Active] [bit] NOT NULL,
	[Proj_TypeCreatedBy] [int] NULL,
	[Proj_TypeCreatedDate] [datetime] NULL,
	[Proj_TypeModifiedBy] [int] NULL,
	[Proj_TypeModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DMST_ProjectType] PRIMARY KEY CLUSTERED 
(
	[Proj_TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DMST_ProjectType] ADD  CONSTRAINT [DF_DMST_ProjectType_Is_Active]  DEFAULT ((0)) FOR [Is_Active]
GO

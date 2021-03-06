USE [Policy]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 8/5/2021 10:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Client Number]  AS ('CN'+right('00000000'+CONVERT([varchar](6),[ID]),(6))) PERSISTED NOT NULL,
	[First Name] [nvarchar](60) NOT NULL,
	[Last Name] [nvarchar](60) NOT NULL,
	[Gender_id] [int] NOT NULL,
	[Date of Birth] [date] NOT NULL,
	[Indentity Number] [varchar](30) NOT NULL,
	[Marital_id] [int] NOT NULL,
	[Address] [nvarchar](120) NOT NULL,
	[Country_id] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Client Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 8/5/2021 10:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](30) NOT NULL,
	[Country Symbol] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 8/5/2021 10:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [varchar](30) NOT NULL,
	[Gender Symbol] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaritalStatus]    Script Date: 8/5/2021 10:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaritalStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Marital Status] [varchar](30) NOT NULL,
	[Marital Symbol] [varchar](10) NOT NULL,
 CONSTRAINT [PK_MartialStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [First Name], [Last Name], [Gender_id], [Date of Birth], [Indentity Number], [Marital_id], [Address], [Country_id]) VALUES (11, N'Luan', N'Nguyen Thanh', 1, CAST(N'1999-12-01' AS Date), N'175409876', 1, N'15 Dinh Tien Hoang', 1)
INSERT [dbo].[Client] ([ID], [First Name], [Last Name], [Gender_id], [Date of Birth], [Indentity Number], [Marital_id], [Address], [Country_id]) VALUES (12, N'Mai', N'Bui Thi Ngoc', 2, CAST(N'1999-12-12' AS Date), N'165809345', 2, N'136 Dong Da', 2)
INSERT [dbo].[Client] ([ID], [First Name], [Last Name], [Gender_id], [Date of Birth], [Indentity Number], [Marital_id], [Address], [Country_id]) VALUES (13, N'An', N'Nguyen Thi Thinh', 2, CAST(N'1999-12-21' AS Date), N'200377765', 1, N'32 Wall Street', 3)
INSERT [dbo].[Client] ([ID], [First Name], [Last Name], [Gender_id], [Date of Birth], [Indentity Number], [Marital_id], [Address], [Country_id]) VALUES (14, N'Nguyen', N'Vu', 1, CAST(N'2000-04-30' AS Date), N'340989875', 3, N'03 Washington', 4)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [Country], [Country Symbol]) VALUES (1, N'Vietnam', N'VNI')
INSERT [dbo].[Country] ([id], [Country], [Country Symbol]) VALUES (2, N'United States', N'USA')
INSERT [dbo].[Country] ([id], [Country], [Country Symbol]) VALUES (3, N'Singapore', N'SIN')
INSERT [dbo].[Country] ([id], [Country], [Country Symbol]) VALUES (4, N'Malaysia', N'MAL')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([id], [Gender], [Gender Symbol]) VALUES (1, N'Male', N'M')
INSERT [dbo].[Gender] ([id], [Gender], [Gender Symbol]) VALUES (2, N'Female', N'F')
INSERT [dbo].[Gender] ([id], [Gender], [Gender Symbol]) VALUES (3, N'Unknown', N'U')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[MaritalStatus] ON 

INSERT [dbo].[MaritalStatus] ([id], [Marital Status], [Marital Symbol]) VALUES (1, N'Single', N'S')
INSERT [dbo].[MaritalStatus] ([id], [Marital Status], [Marital Symbol]) VALUES (2, N'Married', N'M')
INSERT [dbo].[MaritalStatus] ([id], [Marital Status], [Marital Symbol]) VALUES (3, N'Divorced', N'D')
SET IDENTITY_INSERT [dbo].[MaritalStatus] OFF
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Country] FOREIGN KEY([Country_id])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Country]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([Gender_id])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_MartialStatus] FOREIGN KEY([Marital_id])
REFERENCES [dbo].[MaritalStatus] ([id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_MartialStatus]
GO

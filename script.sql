USE [coronaCart]
GO
/****** Object:  Table [dbo].[coronakit]    Script Date: 8/24/2020 12:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coronakit](
	[coronaKit_id] [int] NOT NULL,
	[product_name] [varchar](50) NOT NULL,
	[product_mail] [varchar](50) NOT NULL,
	[product_num] [varchar](50) NOT NULL,
	[amt] [varchar](50) NULL,
	[addr] [varchar](50) NULL,
	[orderdate] [varchar](50) NULL,
	[orderfinal] [varchar](50) NULL,
 CONSTRAINT [PK_coronakit] PRIMARY KEY CLUSTERED 
(
	[coronaKit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kitdetails]    Script Date: 8/24/2020 12:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitdetails](
	[kit_id] [int] NOT NULL,
	[coronaKit_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[qty] [int] NULL,
	[amt] [varchar](max) NULL,
 CONSTRAINT [PK_kitdetails] PRIMARY KEY CLUSTERED 
(
	[kit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 8/24/2020 12:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_desc] [varchar](255) NULL,
	[product_price] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

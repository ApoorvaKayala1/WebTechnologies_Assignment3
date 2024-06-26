USE [master]
GO
/****** Object:  Database [a2_kidsfashionstoredb]    Script Date: 29-03-2024 22:55:07 ******/
CREATE DATABASE [a2_kidsfashionstoredb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'a2_kidsfashionstoredb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\a2_kidsfashionstoredb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'a2_kidsfashionstoredb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\a2_kidsfashionstoredb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [a2_kidsfashionstoredb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET ARITHABORT OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET  MULTI_USER 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET QUERY_STORE = ON
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [a2_kidsfashionstoredb]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 29-03-2024 22:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK__cart__3213E83F8447D3BA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 29-03-2024 22:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
	[rating] [int] NULL,
	[image] [varchar](255) NULL,
	[text] [text] NULL,
 CONSTRAINT [PK__comments__3213E83F5FE0C17E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 29-03-2024 22:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[total_amount] [decimal](10, 2) NULL,
 CONSTRAINT [PK__orders__3213E83F89DE54C0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 29-03-2024 22:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[pricing] [decimal](10, 2) NULL,
	[shipping_cost] [decimal](10, 2) NULL,
	[name] [varchar](255) NULL,
 CONSTRAINT [PK__products__3213E83F3FB016F5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 29-03-2024 22:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[purchase_history] [text] NULL,
	[shipping_address] [varchar](255) NULL,
	[contact] [varchar](20) NULL,
	[city] [varchar](50) NULL,
	[province] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[zip_code] [varchar](20) NULL,
 CONSTRAINT [PK__users__3213E83F613921EE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK__cart__product_id__5165187F] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK__cart__product_id__5165187F]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK__cart__user_id__5070F446] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK__cart__user_id__5070F446]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK__comments__produc__5441852A] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK__comments__produc__5441852A]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK__comments__user_i__5535A963] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK__comments__user_i__5535A963]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__product___59063A47] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__product___59063A47]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__user_id__5812160E] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__user_id__5812160E]
GO
USE [master]
GO
ALTER DATABASE [a2_kidsfashionstoredb] SET  READ_WRITE 
GO

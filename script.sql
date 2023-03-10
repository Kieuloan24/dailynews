USE [master]
GO
/****** Object:  Database [SportNews]    Script Date: 12/30/2022 7:16:05 PM ******/
CREATE DATABASE [SportNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SportNews.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SportNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SportNews_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SportNews] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportNews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportNews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SportNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportNews] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportNews] SET  MULTI_USER 
GO
ALTER DATABASE [SportNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportNews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportNews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportNews] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SportNews] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SportNews]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/30/2022 7:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](150) NULL,
	[phonenumber] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[id_permission] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 12/30/2022 7:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_category] [int] NULL,
	[title] [nvarchar](max) NULL,
	[contents] [nvarchar](max) NULL,
	[images] [nvarchar](250) NULL,
	[createdDate] [datetime] NOT NULL,
	[createdById] [int] NOT NULL,
	[cre] [nvarchar](max) NOT NULL,
	[tags] [nvarchar](max) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/30/2022 7:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/30/2022 7:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_id] [int] NULL,
	[subscriber_id] [int] NULL,
	[contents] [nvarchar](max) NULL,
	[createddate] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/30/2022 7:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[contents] [nvarchar](max) NULL,
	[createddate] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 12/30/2022 7:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscriber]    Script Date: 12/30/2022 7:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriber](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nchar](20) NULL,
	[createddate] [datetime] NULL,
 CONSTRAINT [PK_Subscriber] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Permission] FOREIGN KEY([id_permission])
REFERENCES [dbo].[Permission] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Permission]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Account] FOREIGN KEY([createdById])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Account]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Category]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Subscriber] FOREIGN KEY([subscriber_id])
REFERENCES [dbo].[Subscriber] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Subscriber]
GO
USE [master]
GO
ALTER DATABASE [SportNews] SET  READ_WRITE 
GO

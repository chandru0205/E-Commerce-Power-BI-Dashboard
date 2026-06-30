USE [master]
GO
/****** Object:  Database [Ecommerce_Funnel_Analysis]    Script Date: 30-06-2026 3.34.11 PM ******/
CREATE DATABASE [Ecommerce_Funnel_Analysis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ecommerce_Funnel_Analysis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Ecommerce_Funnel_Analysis.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ecommerce_Funnel_Analysis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Ecommerce_Funnel_Analysis_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecommerce_Funnel_Analysis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET  MULTI_USER 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET QUERY_STORE = ON
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Ecommerce_Funnel_Analysis]
GO
/****** Object:  Table [dbo].[cleaned_customers]    Script Date: 30-06-2026 3.34.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cleaned_customers](
	[customer_id] [nvarchar](50) NOT NULL,
	[customer_unique_id] [nvarchar](50) NOT NULL,
	[customer_zip_code_prefix] [int] NOT NULL,
	[customer_city] [nvarchar](50) NOT NULL,
	[customer_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cleaned_order_items]    Script Date: 30-06-2026 3.34.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cleaned_order_items](
	[order_id] [nvarchar](50) NOT NULL,
	[order_item_id] [tinyint] NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[seller_id] [nvarchar](50) NOT NULL,
	[shipping_limit_date] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[freight_value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cleaned_orders]    Script Date: 30-06-2026 3.34.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cleaned_orders](
	[order_id] [nvarchar](50) NULL,
	[customer_id] [nvarchar](50) NULL,
	[order_status] [nvarchar](50) NULL,
	[order_purchase_timestamp] [nvarchar](50) NULL,
	[order_approved_at] [nvarchar](50) NULL,
	[order_delivered_carrier_date] [nvarchar](50) NULL,
	[order_delivered_customer_date] [nvarchar](50) NULL,
	[order_estimated_delivery_date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cleaned_payments]    Script Date: 30-06-2026 3.34.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cleaned_payments](
	[order_id] [nvarchar](50) NOT NULL,
	[payment_sequential] [tinyint] NOT NULL,
	[payment_type] [nvarchar](50) NOT NULL,
	[payment_installments] [tinyint] NOT NULL,
	[payment_value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cleaned_products]    Script Date: 30-06-2026 3.34.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cleaned_products](
	[product_id] [nvarchar](50) NULL,
	[product_category_name] [nvarchar](50) NULL,
	[product_name_lenght] [float] NULL,
	[product_description_lenght] [float] NULL,
	[product_photos_qty] [float] NULL,
	[product_weight_g] [float] NULL,
	[product_length_cm] [float] NULL,
	[product_height_cm] [float] NULL,
	[product_width_cm] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cleaned_reviews]    Script Date: 30-06-2026 3.34.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cleaned_reviews](
	[review_id] [nvarchar](50) NULL,
	[order_id] [nvarchar](50) NULL,
	[review_score] [tinyint] NULL,
	[review_comment_title] [nvarchar](50) NULL,
	[review_comment_message] [nvarchar](250) NULL,
	[review_creation_date] [nvarchar](50) NULL,
	[review_answer_timestamp] [nvarchar](50) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Ecommerce_Funnel_Analysis] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [DMS]    Script Date: 1/25/2020 4:27:47 PM ******/
CREATE DATABASE [DMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DMS] SET  MULTI_USER 
GO
ALTER DATABASE [DMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DMS] SET  READ_WRITE 
GO

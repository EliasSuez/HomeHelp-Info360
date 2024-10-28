USE [master]
GO
/****** Object:  Database [HOMEHELP]    Script Date: 21/10/2024 09:36:03 ******/
CREATE DATABASE [HOMEHELP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOMEHELP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HOMEHELP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HOMEHELP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HOMEHELP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HOMEHELP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOMEHELP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOMEHELP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOMEHELP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOMEHELP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOMEHELP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOMEHELP] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOMEHELP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HOMEHELP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOMEHELP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOMEHELP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOMEHELP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOMEHELP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOMEHELP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOMEHELP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOMEHELP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOMEHELP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HOMEHELP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOMEHELP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOMEHELP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOMEHELP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOMEHELP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOMEHELP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOMEHELP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOMEHELP] SET RECOVERY FULL 
GO
ALTER DATABASE [HOMEHELP] SET  MULTI_USER 
GO
ALTER DATABASE [HOMEHELP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOMEHELP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HOMEHELP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HOMEHELP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HOMEHELP] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HOMEHELP', N'ON'
GO
ALTER DATABASE [HOMEHELP] SET QUERY_STORE = OFF
GO
USE [HOMEHELP]
GO
/****** Object:  User [alumno]    Script Date: 21/10/2024 09:36:03 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 21/10/2024 09:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[ID_Servicio] [int] IDENTITY(1,1) NOT NULL,
	[DNI_Usuario1] [int] NOT NULL,
	[Nombre_Usuario1] [text] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[DNI_Usuario2] [int] NOT NULL,
	[Nombre_Usuario2] [text] NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[ID_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosXTrabajador]    Script Date: 21/10/2024 09:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosXTrabajador](
	[id] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
	[idTrabajador] [int] NOT NULL,
 CONSTRAINT [PK_ServiciosXTrabajador] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajadores]    Script Date: 21/10/2024 09:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajadores](
	[ID_Trabajador] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [text] NOT NULL,
	[Especialidad] [text] NOT NULL,
	[DNI] [int] NOT NULL,
 CONSTRAINT [PK_Trabajadores] PRIMARY KEY CLUSTERED 
(
	[ID_Trabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/10/2024 09:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[DNI] [int] NOT NULL,
	[Nombre] [text] NOT NULL,
	[Apellido] [text] NOT NULL,
	[Direccion] [text] NOT NULL,
	[Edad] [int] NOT NULL,
	[Calificacion] [int] NOT NULL,
	[Trabajador] [bit] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[ID_Visitante] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valoraciones]    Script Date: 21/10/2024 09:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoraciones](
	[ID_Valoracion] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [int] NOT NULL,
	[Puntuacion] [int] NOT NULL,
	[Comentario] [text] NOT NULL,
	[Desea_Recomendarlo] [bit] NOT NULL,
	[Calificacion] [int] NOT NULL,
 CONSTRAINT [PK_Valoraciones] PRIMARY KEY CLUSTERED 
(
	[ID_Valoracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitante]    Script Date: 21/10/2024 09:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitante](
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Visitante] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Usuarios1] FOREIGN KEY([DNI_Usuario1])
REFERENCES [dbo].[Usuarios] ([DNI])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Usuarios1]
GO
ALTER TABLE [dbo].[Trabajadores]  WITH CHECK ADD  CONSTRAINT [FK_Trabajadores_Usuarios] FOREIGN KEY([DNI])
REFERENCES [dbo].[Usuarios] ([DNI])
GO
ALTER TABLE [dbo].[Trabajadores] CHECK CONSTRAINT [FK_Trabajadores_Usuarios]
GO
ALTER TABLE [dbo].[Valoraciones]  WITH CHECK ADD  CONSTRAINT [FK_Valoraciones_Usuarios] FOREIGN KEY([DNI])
REFERENCES [dbo].[Usuarios] ([DNI])
GO
ALTER TABLE [dbo].[Valoraciones] CHECK CONSTRAINT [FK_Valoraciones_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [HOMEHELP] SET  READ_WRITE 
GO

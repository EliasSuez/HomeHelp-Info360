USE [master]
GO
/****** Object:  Database [HOMEHELP]    Script Date: 8/11/2024 13:57:48 ******/
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
/****** Object:  User [alumno]    Script Date: 8/11/2024 13:57:48 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 8/11/2024 13:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [text] NOT NULL,
	[ID_user] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 8/11/2024 13:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[ID_Especialidad] [int] IDENTITY(1,1) NOT NULL,
	[Especialidad] [text] NOT NULL,
	[Descripcion] [text] NOT NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[ID_Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 8/11/2024 13:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[ID_Servicio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [text] NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[ID_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosXTrabajador]    Script Date: 8/11/2024 13:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosXTrabajador](
	[ID_Serv_X_Tra] [int] NOT NULL,
	[ID_Servicio] [int] NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[ID_Trabajador] [int] NOT NULL,
 CONSTRAINT [PK_ServiciosXTrabajador] PRIMARY KEY CLUSTERED 
(
	[ID_Serv_X_Tra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajadores]    Script Date: 8/11/2024 13:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajadores](
	[ID_Trabajador] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [text] NOT NULL,
	[ID_Especialidad] [int] NOT NULL,
	[ID_User] [int] NULL,
 CONSTRAINT [PK_Trabajadores] PRIMARY KEY CLUSTERED 
(
	[ID_Trabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/11/2024 13:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[DNI] [int] NOT NULL,
	[Nombre] [text] NOT NULL,
	[Apellido] [text] NOT NULL,
	[Edad] [int] NOT NULL,
	[ID_Valoracion] [int] NOT NULL,
	[Trabajador] [bit] NOT NULL,
	[Password] [text] NULL,
	[Email] [text] NULL,
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Foto] [text] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valoraciones]    Script Date: 8/11/2024 13:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoraciones](
	[ID_Valoracion] [int] IDENTITY(1,1) NOT NULL,
	[Puntuacion] [int] NULL,
	[Comentario] [text] NULL,
	[Desea_Recomendarlo] [bit] NULL,
	[Calificacion] [int] NULL,
 CONSTRAINT [PK_Valoraciones] PRIMARY KEY CLUSTERED 
(
	[ID_Valoracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (1, N'Ana Gómez')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (2, N'Laura Martínez')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (3, N'Marta Ruiz')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (4, N'Sofía Mendoza')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (5, N'Carla Morales')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (6, N'Paula Díaz')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (7, N'Julia Vargas')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (8, N'Andrea Campos')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (9, N'Isabel Paredes')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (10, N'Patricia Rivera')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (11, N'Marta Ruiz')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (12, N'Laura Martínez')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (13, N'Paula Díaz')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (14, N'Andrea Campos')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (15, N'Isabel Paredes')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (16, N'Patricia Rivera')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (17, N'Laura Martínez')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (18, N'Marta Ruiz')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (19, N'Diego Torres')
INSERT [dbo].[Servicios] ([ID_Servicio], [Nombre]) VALUES (20, N'Carla Morales')
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[Trabajadores] ON 

INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (2, N'MAT12345', 10101010, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (3, N'MAT67890', 20202020, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (4, N'MAT11111', 30303030, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (5, N'MAT22222', 40404040, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (6, N'MAT33333', 50505050, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (7, N'MAT44444', 60606060, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (8, N'MAT55555', 70707070, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (9, N'MAT66666', 80808080, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (10, N'MAT77777', 90909090, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (11, N'MAT88888', 11111111, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (12, N'MAT99999', 12121212, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (13, N'MAT10101', 13131313, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (14, N'MAT20202', 14141414, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (15, N'MAT30303', 15151515, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (16, N'MAT40404', 16161616, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (17, N'MAT50505', 17171717, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (18, N'MAT60606', 18181818, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (19, N'MAT70707', 19191919, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (20, N'MAT80808', 20202021, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User]) VALUES (21, N'MAT90909', 21212121, NULL)
SET IDENTITY_INSERT [dbo].[Trabajadores] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (10101010, N'Juan', N'Pérez', 25, 4, 1, NULL, N'Usuario frecuente', 1, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (20202020, N'Ana', N'Gómez', 30, 3, 0, NULL, N'Nuevo usuario', 2, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (30303030, N'Carlos', N'López', 45, 4, 1, NULL, N'Usuario premium', 3, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (40404040, N'Laura', N'Martínez', 35, 3, 0, NULL, N'Usuario esporádico', 4, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (50505050, N'Luis', N'Fernández', 28, 4, 1, NULL, N'Cliente habitual', 5, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (60606060, N'Marta', N'Ruiz', 32, 3, 0, NULL, N'Nuevo usuario', 6, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (70707070, N'Pedro', N'Sánchez', 40, 4, 1, NULL, N'Usuario premium', 7, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (80808080, N'Sofía', N'Mendoza', 22, 4, 0, NULL, N'Recién registrado', 8, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (90909090, N'Diego', N'Torres', 33, 4, 1, NULL, N'Cliente frecuente', 9, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (11111111, N'Carla', N'Morales', 37, 3, 0, NULL, N'Nuevo usuario', 10, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (12121212, N'Rafael', N'Romero', 26, 4, 1, NULL, N'Usuario frecuente', 11, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (13131313, N'Paula', N'Díaz', 29, 3, 0, NULL, N'Usuario ocasional', 12, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (14141414, N'Ramón', N'Silva', 31, 4, 1, NULL, N'Cliente habitual', 13, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (15151515, N'Julia', N'Vargas', 23, 3, 0, NULL, N'Recién registrado', 14, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (16161616, N'Gonzalo', N'Ibáñez', 34, 4, 1, NULL, N'Usuario frecuente', 15, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (17171717, N'Andrea', N'Campos', 36, 3, 0, NULL, N'Nuevo usuario', 16, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (18181818, N'Fernando', N'Ríos', 38, 4, 1, NULL, N'Cliente habitual', 17, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (19191919, N'Isabel', N'Paredes', 27, 4, 0, NULL, N'Usuario premium', 18, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (20202021, N'Miguel', N'Luna', 39, 3, 1, NULL, N'Recomendado', 19, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (21212121, N'Patricia', N'Rivera', 24, 4, 0, NULL, N'Usuario frecuente', 20, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Valoraciones] ON 

INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (6, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (7, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (9, NULL, NULL, NULL, NULL)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (10, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Valoraciones] OFF
GO
ALTER TABLE [dbo].[ServiciosXTrabajador]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosXTrabajador_Servicios] FOREIGN KEY([ID_Servicio])
REFERENCES [dbo].[Servicios] ([ID_Servicio])
GO
ALTER TABLE [dbo].[ServiciosXTrabajador] CHECK CONSTRAINT [FK_ServiciosXTrabajador_Servicios]
GO
ALTER TABLE [dbo].[ServiciosXTrabajador]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosXTrabajador_Trabajadores] FOREIGN KEY([ID_Trabajador])
REFERENCES [dbo].[Trabajadores] ([ID_Trabajador])
GO
ALTER TABLE [dbo].[ServiciosXTrabajador] CHECK CONSTRAINT [FK_ServiciosXTrabajador_Trabajadores]
GO
USE [master]
GO
ALTER DATABASE [HOMEHELP] SET  READ_WRITE 
GO

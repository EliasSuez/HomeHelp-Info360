USE [master]
GO
/****** Object:  Database [HOMEHELP]    Script Date: 30/10/2024 08:53:44 ******/
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
/****** Object:  User [alumno]    Script Date: 30/10/2024 08:53:44 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 30/10/2024 08:53:44 ******/
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
/****** Object:  Table [dbo].[Trabajadores]    Script Date: 30/10/2024 08:53:44 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/10/2024 08:53:44 ******/
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
	[NumberUser] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valoraciones]    Script Date: 30/10/2024 08:53:44 ******/
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
/****** Object:  Table [dbo].[Visitante]    Script Date: 30/10/2024 08:53:44 ******/
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
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (1, 10101010, N'Juan Pérez', N'Reparación de aire acondicionado', 20202020, N'Ana Gómez')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (2, 30303030, N'Carlos López', N'Instalación de plomería', 40404040, N'Laura Martínez')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (3, 50505050, N'Luis Fernández', N'Electricidad', 60606060, N'Marta Ruiz')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (4, 70707070, N'Pedro Sánchez', N'Cerrajería', 80808080, N'Sofía Mendoza')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (5, 90909090, N'Diego Torres', N'Albañilería', 11111111, N'Carla Morales')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (6, 12121212, N'Rafael Romero', N'Pintura', 13131313, N'Paula Díaz')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (7, 14141414, N'Ramón Silva', N'Gasfitería', 15151515, N'Julia Vargas')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (8, 16161616, N'Gonzalo Ibáñez', N'Mantenimiento de jardín', 17171717, N'Andrea Campos')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (9, 18181818, N'Fernando Ríos', N'Reparación de electrodomésticos', 19191919, N'Isabel Paredes')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (10, 20202021, N'Miguel Luna', N'Construcción', 21212121, N'Patricia Rivera')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (11, 10101010, N'Juan Pérez', N'Electricidad', 60606060, N'Marta Ruiz')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (12, 30303030, N'Carlos López', N'Cerrajería', 40404040, N'Laura Martínez')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (13, 70707070, N'Pedro Sánchez', N'Albañilería', 13131313, N'Paula Díaz')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (14, 50505050, N'Luis Fernández', N'Reparación de autos', 17171717, N'Andrea Campos')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (15, 90909090, N'Diego Torres', N'Carpintería', 19191919, N'Isabel Paredes')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (16, 14141414, N'Ramón Silva', N'Gasfitería', 21212121, N'Patricia Rivera')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (17, 16161616, N'Gonzalo Ibáñez', N'Jardinería', 40404040, N'Laura Martínez')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (18, 18181818, N'Fernando Ríos', N'Reparación de calderas', 60606060, N'Marta Ruiz')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (19, 50505050, N'Luis Fernández', N'Electricidad', 90909090, N'Diego Torres')
INSERT [dbo].[Servicios] ([ID_Servicio], [DNI_Usuario1], [Nombre_Usuario1], [Descripcion], [DNI_Usuario2], [Nombre_Usuario2]) VALUES (20, 20202021, N'Miguel Luna', N'Pintura exterior', 11111111, N'Carla Morales')
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[Trabajadores] ON 

INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (2, N'MAT12345', N'Electricista', 10101010)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (3, N'MAT67890', N'Plomero', 20202020)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (4, N'MAT11111', N'Carpintero', 30303030)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (5, N'MAT22222', N'Jardinero', 40404040)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (6, N'MAT33333', N'Pintor', 50505050)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (7, N'MAT44444', N'Albañil', 60606060)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (8, N'MAT55555', N'Gasista', 70707070)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (9, N'MAT66666', N'Cerrajero', 80808080)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (10, N'MAT77777', N'Mecánico', 90909090)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (11, N'MAT88888', N'Soldador', 11111111)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (12, N'MAT99999', N'Electricista', 12121212)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (13, N'MAT10101', N'Plomero', 13131313)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (14, N'MAT20202', N'Carpintero', 14141414)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (15, N'MAT30303', N'Jardinero', 15151515)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (16, N'MAT40404', N'Pintor', 16161616)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (17, N'MAT50505', N'Albañil', 17171717)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (18, N'MAT60606', N'Gasista', 18181818)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (19, N'MAT70707', N'Cerrajero', 19191919)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (20, N'MAT80808', N'Mecánico', 20202021)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [Especialidad], [DNI]) VALUES (21, N'MAT90909', N'Soldador', 21212121)
SET IDENTITY_INSERT [dbo].[Trabajadores] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (10101010, N'Juan', N'Pérez', N'Calle 1', 25, 4, 1, N'Usuario frecuente', 1, 1)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (11111111, N'Carla', N'Morales', N'Calle 10', 37, 3, 0, N'Nuevo usuario', 10, 2)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (12121212, N'Rafael', N'Romero', N'Calle 11', 26, 4, 1, N'Usuario frecuente', 11, 3)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (13131313, N'Paula', N'Díaz', N'Calle 12', 29, 3, 0, N'Usuario ocasional', 12, 4)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (14141414, N'Ramón', N'Silva', N'Calle 13', 31, 4, 1, N'Cliente habitual', 13, 5)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (15151515, N'Julia', N'Vargas', N'Calle 14', 23, 3, 0, N'Recién registrado', 14, 6)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (16161616, N'Gonzalo', N'Ibáñez', N'Calle 15', 34, 4, 1, N'Usuario frecuente', 15, 7)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (17171717, N'Andrea', N'Campos', N'Calle 16', 36, 3, 0, N'Nuevo usuario', 16, 8)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (18181818, N'Fernando', N'Ríos', N'Calle 17', 38, 4, 1, N'Cliente habitual', 17, 9)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (19191919, N'Isabel', N'Paredes', N'Calle 18', 27, 4, 0, N'Usuario premium', 18, 10)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (20202020, N'Ana', N'Gómez', N'Calle 2', 30, 3, 0, N'Nuevo usuario', 2, 11)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (20202021, N'Miguel', N'Luna', N'Calle 19', 39, 3, 1, N'Recomendado', 19, 12)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (21212121, N'Patricia', N'Rivera', N'Calle 20', 24, 4, 0, N'Usuario frecuente', 20, 13)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (30303030, N'Carlos', N'López', N'Calle 3', 45, 4, 1, N'Usuario premium', 3, 14)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (40404040, N'Laura', N'Martínez', N'Calle 4', 35, 3, 0, N'Usuario esporádico', 4, 15)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (50505050, N'Luis', N'Fernández', N'Calle 5', 28, 4, 1, N'Cliente habitual', 5, 16)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (60606060, N'Marta', N'Ruiz', N'Calle 6', 32, 3, 0, N'Nuevo usuario', 6, 17)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (70707070, N'Pedro', N'Sánchez', N'Calle 7', 40, 4, 1, N'Usuario premium', 7, 18)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (80808080, N'Sofía', N'Mendoza', N'Calle 8', 22, 4, 0, N'Recién registrado', 8, 19)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Direccion], [Edad], [Calificacion], [Trabajador], [Descripcion], [ID_Visitante], [NumberUser]) VALUES (90909090, N'Diego', N'Torres', N'Calle 9', 33, 4, 1, N'Cliente frecuente', 9, 20)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Valoraciones] ON 

INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (1, 10101010, 5, N'Excelente servicio', 1, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (2, 20202020, 4, N'Muy bueno', 1, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (3, 30303030, 3, N'Adecuado', 0, 3)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (4, 40404040, 2, N'Mejorable', 0, 2)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (5, 50505050, 5, N'Recomendado', 1, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (6, 60606060, 4, N'Bueno', 1, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (7, 70707070, 3, N'Satisfactorio', 0, 3)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (8, 80808080, 4, N'Cumple con lo necesario', 1, 3)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (9, 90909090, 5, N'Increíble', 1, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [DNI], [Puntuacion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (10, 11111111, 3, N'Podría mejorar', 0, 3)
SET IDENTITY_INSERT [dbo].[Valoraciones] OFF
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

USE [master]
GO
/****** Object:  Database [HOMEHELP]    Script Date: 25/11/2024 17:40:32 ******/
CREATE DATABASE [HOMEHELP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOMEHELP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HOMEHELP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HOMEHELP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HOMEHELP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [HOMEHELP] SET QUERY_STORE = OFF
GO
USE [HOMEHELP]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 25/11/2024 17:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [text] NOT NULL,
	[ID_user] [int] NOT NULL,
	[Arreglo] [bit] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 25/11/2024 17:40:32 ******/
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
/****** Object:  Table [dbo].[ServiciosXTrabajador]    Script Date: 25/11/2024 17:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosXTrabajador](
	[ID_Serv_X_Tra] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[ID_Trabajador] [int] NOT NULL,
	[nombre_servicios] [varchar](50) NOT NULL,
	[fechahora] [datetime] NOT NULL,
 CONSTRAINT [PK_ServiciosXTrabajador] PRIMARY KEY CLUSTERED 
(
	[ID_Serv_X_Tra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajadores]    Script Date: 25/11/2024 17:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajadores](
	[ID_Trabajador] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [text] NOT NULL,
	[ID_Especialidad] [int] NOT NULL,
	[ID_User] [int] NULL,
	[hora_dispo] [bit] NULL,
 CONSTRAINT [PK_Trabajadores] PRIMARY KEY CLUSTERED 
(
	[ID_Trabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/11/2024 17:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[DNI] [int] NOT NULL,
	[Nombre] [text] NOT NULL,
	[Apellido] [text] NOT NULL,
	[Edad] [int] NOT NULL,
	[ID_Valoracion] [int] NULL,
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
/****** Object:  Table [dbo].[Valoraciones]    Script Date: 25/11/2024 17:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoraciones](
	[ID_Valoracion] [int] IDENTITY(1,1) NOT NULL,
	[Comentario] [text] NULL,
	[Desea_Recomendarlo] [bit] NULL,
	[Calificacion] [int] NULL,
 CONSTRAINT [PK_Valoraciones] PRIMARY KEY CLUSTERED 
(
	[ID_Valoracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (4, N'Calle Falsa 123', 24, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (5, N'Avenida Siempreviva 742', 25, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (6, N'Calle de la Paz 456', 26, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (7, N'Avenida Libertad 789', 27, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (8, N'Calle Solitaria 101', 28, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (9, N'Calle Primavera 202', 29, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (10, N'Calle de las Flores 303', 30, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (11, N'Avenida Central 404', 31, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (12, N'Calle Oscura 505', 32, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (13, N'Calle del Río 606', 33, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (14, N'Avenida del Sol 707', 34, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (15, N'Calle de la Luna 808', 35, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (16, N'Calle Principal 909', 36, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (17, N'Avenida del Mar 111', 37, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (18, N'Calle Real 222', 38, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (19, N'Avenida del Bosque 333', 39, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (20, N'Calle Nueva 444', 40, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (21, N'Avenida Norte 555', 41, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (22, N'Calle Sur 666', 42, NULL)
INSERT [dbo].[Clientes] ([ID_Cliente], [Direccion], [ID_user], [Arreglo]) VALUES (23, N'Avenida Este 777', 43, NULL)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 

INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (1, N'Electricista', N'Reparaciones y mantenimiento eléctrico')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (2, N'Plomero', N'Instalaciones y reparaciones de plomería')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (3, N'Carpintero', N'Diseño y fabricación de muebles')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (4, N'Albañil', N'Construcción y mantenimiento de estructuras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (5, N'Pintor', N'Aplicación de pintura en interiores y exteriores')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (6, N'Cerrajero', N'Reparaciones y aperturas de cerraduras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (7, N'Jardinero', N'Cuidado y diseño de jardines')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (8, N'Gasista', N'Instalaciones y reparaciones de gas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (9, N'Mecánico', N'Reparaciones de vehículos')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (10, N'Fontanero', N'Mantenimiento de instalaciones hidráulicas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (11, N'Soldador', N'Soldaduras en metal y estructuras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (12, N'Vidriero', N'Instalaciones de vidrios y ventanas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (13, N'Técnico en refrigeración', N'Reparaciones de equipos de frío')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (14, N'Instalador de redes', N'Configuración de redes y cableados')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (15, N'Técnico informático', N'Soporte técnico y reparaciones de PC')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (16, N'Electricista industrial', N'Instalaciones en áreas industriales')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (17, N'Técnico automotriz', N'Diagnósticos y reparaciones de autos')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (18, N'Decorador', N'Diseño y decoración de interiores')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (19, N'Electromecánico', N'Mantenimiento de maquinaria')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (20, N'Pintor de autos', N'Aplicación de pintura en vehículos')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (21, N'Electricista', N'Reparaciones y mantenimiento eléctrico')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (22, N'Plomero', N'Instalaciones y reparaciones de plomería')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (23, N'Carpintero', N'Diseño y fabricación de muebles')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (24, N'Albañil', N'Construcción y mantenimiento de estructuras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (25, N'Pintor', N'Aplicación de pintura en interiores y exteriores')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (26, N'Cerrajero', N'Reparaciones y aperturas de cerraduras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (27, N'Jardinero', N'Cuidado y diseño de jardines')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (28, N'Gasista', N'Instalaciones y reparaciones de gas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (29, N'Mecánico', N'Reparaciones de vehículos')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (30, N'Fontanero', N'Mantenimiento de instalaciones hidráulicas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (31, N'Soldador', N'Soldaduras en metal y estructuras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (32, N'Vidriero', N'Instalaciones de vidrios y ventanas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (33, N'Técnico en refrigeración', N'Reparaciones de equipos de frío')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (34, N'Instalador de redes', N'Configuración de redes y cableados')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (35, N'Técnico informático', N'Soporte técnico y reparaciones de PC')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (36, N'Electricista industrial', N'Instalaciones en áreas industriales')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (37, N'Técnico automotriz', N'Diagnósticos y reparaciones de autos')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (38, N'Decorador', N'Diseño y decoración de interiores')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (39, N'Electromecánico', N'Mantenimiento de maquinaria')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (40, N'Pintor de autos', N'Aplicación de pintura en vehículos')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (41, N'Electricista', N'Reparaciones y mantenimiento eléctrico')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (42, N'Plomero', N'Instalaciones y reparaciones de plomería')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (43, N'Carpintero', N'Diseño y fabricación de muebles')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (44, N'Albañil', N'Construcción y mantenimiento de estructuras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (45, N'Pintor', N'Aplicación de pintura en interiores y exteriores')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (46, N'Cerrajero', N'Reparaciones y aperturas de cerraduras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (47, N'Jardinero', N'Cuidado y diseño de jardines')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (48, N'Gasista', N'Instalaciones y reparaciones de gas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (49, N'Mecánico', N'Reparaciones de vehículos')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (50, N'Fontanero', N'Mantenimiento de instalaciones hidráulicas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (51, N'Soldador', N'Soldaduras en metal y estructuras')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (52, N'Vidriero', N'Instalaciones de vidrios y ventanas')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (53, N'Técnico en refrigeración', N'Reparaciones de equipos de frío')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (54, N'Instalador de redes', N'Configuración de redes y cableados')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (55, N'Técnico informático', N'Soporte técnico y reparaciones de PC')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (56, N'Electricista industrial', N'Instalaciones en áreas industriales')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (57, N'Técnico automotriz', N'Diagnósticos y reparaciones de autos')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (58, N'Decorador', N'Diseño y decoración de interiores')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (59, N'Electromecánico', N'Mantenimiento de maquinaria')
INSERT [dbo].[Especialidad] ([ID_Especialidad], [Especialidad], [Descripcion]) VALUES (60, N'Pintor de autos', N'Aplicación de pintura en vehículos')
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiciosXTrabajador] ON 

INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (2, 4, 22, N'Servicio de Reparación', CAST(N'2024-11-20T08:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (3, 5, 23, N'Limpieza de Hogar', CAST(N'2024-11-21T09:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (4, 6, 24, N'Mantenimiento Eléctrico', CAST(N'2024-11-22T10:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (5, 7, 25, N'Instalación de Fontanería', CAST(N'2024-11-23T11:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (6, 8, 26, N'Asesoría Legal', CAST(N'2024-11-24T12:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (7, 9, 27, N'Servicio de Reparación', CAST(N'2024-11-25T13:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (8, 10, 28, N'Limpieza de Hogar', CAST(N'2024-11-26T14:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (9, 11, 29, N'Mantenimiento Eléctrico', CAST(N'2024-11-27T15:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (10, 12, 30, N'Instalación de Fontanería', CAST(N'2024-11-28T16:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (11, 13, 31, N'Asesoría Legal', CAST(N'2024-11-29T17:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (12, 14, 32, N'Servicio de Reparación', CAST(N'2024-11-30T18:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (13, 15, 33, N'Limpieza de Hogar', CAST(N'2024-12-01T08:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (14, 16, 34, N'Mantenimiento Eléctrico', CAST(N'2024-12-02T09:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (15, 17, 35, N'Instalación de Fontanería', CAST(N'2024-12-03T10:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (16, 18, 36, N'Asesoría Legal', CAST(N'2024-12-04T11:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (17, 19, 37, N'Servicio de Reparación', CAST(N'2024-12-05T12:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (18, 20, 38, N'Limpieza de Hogar', CAST(N'2024-12-06T13:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (19, 21, 39, N'Mantenimiento Eléctrico', CAST(N'2024-12-07T14:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (20, 22, 40, N'Instalación de Fontanería', CAST(N'2024-12-08T15:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ([ID_Serv_X_Tra], [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (21, 23, 41, N'Asesoría Legal', CAST(N'2024-12-09T16:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ServiciosXTrabajador] OFF
GO
SET IDENTITY_INSERT [dbo].[Trabajadores] ON 

INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (22, N'MAT-001', 1, 24, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (23, N'MAT-002', 2, 25, 0)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (24, N'MAT-003', 3, 26, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (25, N'MAT-004', 4, 27, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (26, N'MAT-005', 5, 28, 0)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (27, N'MAT-006', 1, 29, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (28, N'MAT-007', 2, 30, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (29, N'MAT-008', 3, 31, 0)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (30, N'MAT-009', 4, 32, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (31, N'MAT-010', 5, 33, 0)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (32, N'MAT-011', 1, 34, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (33, N'MAT-012', 2, 35, 0)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (34, N'MAT-013', 3, 36, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (35, N'MAT-014', 4, 37, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (36, N'MAT-015', 5, 38, 0)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (37, N'MAT-016', 1, 39, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (38, N'MAT-017', 2, 40, 0)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (39, N'MAT-018', 3, 41, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (40, N'MAT-019', 4, 42, 0)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (41, N'MAT-020', 5, 43, 1)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (49, N'adad', 5, 28, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (63, N'dasdasd', 1, 80, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (64, N'dasdasd', 1, 81, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (65, N'asdasd', 1, 82, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (66, N'dasdas', 1, 83, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (67, N'asdasd', 1, 84, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (68, N'alskjd', 1, 85, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (69, N'asdkmojoasid', 1, 87, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (70, N'asokdnmasd', 1, 88, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (71, N'aojnsdoaisd', 1, 89, NULL)
INSERT [dbo].[Trabajadores] ([ID_Trabajador], [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES (72, N'askjodnasd', 1, 90, NULL)
SET IDENTITY_INSERT [dbo].[Trabajadores] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (12345678, N'Juan', N'Pérez', 30, 14, 0, N'1234', N'juan@example.com', 24, N'foto1.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (87654321, N'María', N'López', 25, 15, 0, N'abcd', N'maria@example.com', 25, N'foto2.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (11223344, N'Pedro', N'Gómez', 28, 16, 1, N'pass123', N'pedro@example.com', 26, N'foto3.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (44332211, N'Ana', N'Martínez', 35, 17, 1, N'5678', N'ana@example.com', 27, N'foto4.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (55667788, N'Luis', N'Ramírez', 40, 18, 0, N'qwerty', N'luis@example.com', 28, N'foto5.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (99887766, N'Sofía', N'Torres', 22, 19, 0, N'pass456', N'sofia@example.com', 29, N'foto6.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (22334455, N'Carlos', N'Díaz', 33, 20, 1, N'zxcvbn', N'carlos@example.com', 30, N'foto7.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (66778899, N'Elena', N'Suárez', 29, 21, 1, N'asdfgh', N'elena@example.com', 31, N'foto8.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (77889900, N'Diego', N'Vega', 31, 22, 0, N'hjkl', N'diego@example.com', 32, N'foto9.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (88990011, N'Valeria', N'Cruz', 27, 23, 1, N'tyui', N'valeria@example.com', 33, N'foto10.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (22334411, N'Martín', N'Castro', 32, 24, 0, N'martin123', N'martin@example.com', 34, N'foto11.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (33445522, N'Clara', N'Ortiz', 26, 25, 1, N'clara456', N'clara@example.com', 35, N'foto12.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (44556633, N'Tomás', N'Mendoza', 29, 26, 1, N'tomas789', N'tomas@example.com', 36, N'foto13.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (55667744, N'Laura', N'Guzmán', 24, 27, 0, N'laura321', N'laura@example.com', 37, N'foto14.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (66778855, N'Miguel', N'Salas', 36, 28, 0, N'miguel654', N'miguel@example.com', 38, N'foto15.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (77889966, N'Paula', N'Vargas', 23, 29, 1, N'paula987', N'paula@example.com', 39, N'foto16.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (88990077, N'Ricardo', N'Rojas', 34, 30, 1, N'ricardo123', N'ricardo@example.com', 40, N'foto17.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (99001188, N'Cecilia', N'Morales', 28, 31, 0, N'cecilia456', N'cecilia@example.com', 41, N'foto18.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (11002299, N'Andrés', N'Paredes', 27, 32, 0, N'andres789', N'andres@example.com', 42, N'foto19.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (22003344, N'Lucía', N'Peña', 25, 33, 1, N'lucia123', N'lucia@example.com', 43, N'foto20.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (43243287, N'azdfgf', N'sadasd', 18, 14, 0, N'2313', N'asdlkhah@gmail.com', 46, N'Foto')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (230230, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa', 48, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (230230, N'Kevin', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa', 49, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (230230, N'Kevin', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa', 50, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (2222, N'Agus', N'BEre', 2023, 17, 1, N'123', N'hola@nose', 51, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (2222, N'Agus', N'BEre', 2023, 17, 1, N'123', N'hola@nose', 52, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (2222, N'Agus', N'BEre', 2023, 17, 1, N'123', N'hola@nose', 53, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', 54, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', 55, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', 56, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', 57, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', 58, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', 59, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', 60, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 61, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 62, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 63, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 64, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 65, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 66, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 67, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 68, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 69, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 70, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', 71, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', 72, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', 73, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', 74, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', 75, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa', 76, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa', 77, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa', 78, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 79, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 80, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 81, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'asd@gmail.com', 82, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (230230, N'Elias', N'asda', 2023, 17, 1, N'123', N'asd@gmail.com', 83, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (23232, N'dasd', N'Lopez', 2023, 17, 1, N'123', N'asd@gmail.com', 84, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'asd', N'sad', 2023, 17, 1, N'123', N'hola@nose', 85, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', 86, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'Elias', N'Lopez', 2023, NULL, 0, N'123', N'asd@gmail.com', 87, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (23, N'asdasd', N'dasdasd', 2023, 17, 1, N'123', N'asdasd@dasujndi', 88, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (123123, N'asdasd', N'asdasd', 2023, 17, 1, N'123', N'suezelias@gmail.com', 89, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (123123, N'123123', N'asd', 2023, 17, 1, N'123', N'suezelias@gmail.com', 90, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (123123, N'123123', N'asd', 2023, 17, 1, N'123', N'suezelias@gmail.com', 91, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (123123, N'123123', N'asd', 2023, NULL, 0, N'123', N'asdasd@dasujndi', 92, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (123123, N'123123', N'asd', 2023, NULL, 0, N'123', N'asdasd@dasujndi', 93, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (123123, N'123123', N'asd', 2023, NULL, 0, N'123', N'asdasd@dasujndi', 94, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (123123, N'123123', N'asd', 2023, NULL, 0, N'123', N'asdasd@dasujndi', 95, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (48240167, N'123123', N'asdasdasd', 2023, NULL, 0, N'123', N'asdasd@dasujndi', 96, NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [ID_Usuario], [Foto]) VALUES (123123, N'123123', N'Suez', 2023, NULL, 0, N'123', N'suezelias@gmail.com', 97, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Valoraciones] ON 

INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (14, N'Excelente servicio', 1, 10)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (15, N'Buen trabajo, pero puede mejorar', 1, 8)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (16, N'Servicio regular', 0, 6)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (17, N'No cumplió las expectativas', 0, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (18, N'Mala experiencia', 0, 2)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (19, N'Muy profesional', 1, 10)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (20, N'Cumplió con lo esperado', 1, 8)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (21, N'Aceptable', 1, 6)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (22, N'Dejó incompleto el trabajo', 0, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (23, N'Pésimo servicio', 0, 2)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (24, N'Altamente recomendado', 1, 10)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (25, N'Trabajo eficiente', 1, 8)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (26, N'Podría mejorar', 1, 6)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (27, N'No quedé conforme', 0, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (28, N'No lo recomiendo', 0, 2)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (29, N'El mejor en su rubro', 1, 10)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (30, N'Satisfecho', 1, 8)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (31, N'Trabajo promedio', 1, 6)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (32, N'No fue puntual', 0, 4)
INSERT [dbo].[Valoraciones] ([ID_Valoracion], [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (33, N'Terrible experiencia', 0, 2)
SET IDENTITY_INSERT [dbo].[Valoraciones] OFF
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Usuarios] FOREIGN KEY([ID_user])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Usuarios]
GO
ALTER TABLE [dbo].[ServiciosXTrabajador]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosXTrabajador_Clientes] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[ServiciosXTrabajador] CHECK CONSTRAINT [FK_ServiciosXTrabajador_Clientes]
GO
ALTER TABLE [dbo].[ServiciosXTrabajador]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosXTrabajador_Trabajadores] FOREIGN KEY([ID_Trabajador])
REFERENCES [dbo].[Trabajadores] ([ID_Trabajador])
GO
ALTER TABLE [dbo].[ServiciosXTrabajador] CHECK CONSTRAINT [FK_ServiciosXTrabajador_Trabajadores]
GO
ALTER TABLE [dbo].[Trabajadores]  WITH CHECK ADD  CONSTRAINT [FK_Trabajadores_Especialidad] FOREIGN KEY([ID_Especialidad])
REFERENCES [dbo].[Especialidad] ([ID_Especialidad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Trabajadores] CHECK CONSTRAINT [FK_Trabajadores_Especialidad]
GO
ALTER TABLE [dbo].[Trabajadores]  WITH CHECK ADD  CONSTRAINT [FK_Trabajadores_Usuarios] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Trabajadores] CHECK CONSTRAINT [FK_Trabajadores_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Valoraciones] FOREIGN KEY([ID_Valoracion])
REFERENCES [dbo].[Valoraciones] ([ID_Valoracion])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Valoraciones]
GO
USE [master]
GO
ALTER DATABASE [HOMEHELP] SET  READ_WRITE 
GO

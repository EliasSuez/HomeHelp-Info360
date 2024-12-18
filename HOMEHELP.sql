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

INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES (N'Calle Falsa 123', 24, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES (N'Avenida Siempreviva 742', 25, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES (N'Calle de la Paz 456', 26, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES (N'Avenida Libertad 789', 27, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES (N'Calle Solitaria 101', 28, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES (N'Calle Primavera 202', 29, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Calle de las Flores 303', 30, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Avenida Central 404', 31, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Calle Oscura 505', 32, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Calle del Río 606', 33, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Avenida del Sol 707', 34, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Calle de la Luna 808', 35, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Calle Principal 909', 36, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Avenida del Mar 111', 37, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Calle Real 222', 38, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Avenida del Bosque 333', 39, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Calle Nueva 444', 40, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Avenida Norte 555', 41, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Calle Sur 666', 42, NULL)
INSERT [dbo].[Clientes] ([Direccion], [ID_user], [Arreglo]) VALUES ( N'Avenida Este 777', 43, NULL)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 

INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Electricista', N'Reparaciones y mantenimiento eléctrico')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Plomero', N'Instalaciones y reparaciones de plomería')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Carpintero', N'Diseño y fabricación de muebles')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Albañil', N'Construcción y mantenimiento de estructuras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Pintor', N'Aplicación de pintura en interiores y exteriores')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Cerrajero', N'Reparaciones y aperturas de cerraduras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Jardinero', N'Cuidado y diseño de jardines')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Gasista', N'Instalaciones y reparaciones de gas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES (N'Mecánico', N'Reparaciones de vehículos')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Fontanero', N'Mantenimiento de instalaciones hidráulicas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Soldador', N'Soldaduras en metal y estructuras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Vidriero', N'Instalaciones de vidrios y ventanas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico en refrigeración', N'Reparaciones de equipos de frío')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Instalador de redes', N'Configuración de redes y cableados')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico informático', N'Soporte técnico y reparaciones de PC')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Electricista industrial', N'Instalaciones en áreas industriales')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico automotriz', N'Diagnósticos y reparaciones de autos')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Decorador', N'Diseño y decoración de interiores')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Electromecánico', N'Mantenimiento de maquinaria')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Pintor de autos', N'Aplicación de pintura en vehículos')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Electricista', N'Reparaciones y mantenimiento eléctrico')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Plomero', N'Instalaciones y reparaciones de plomería')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Carpintero', N'Diseño y fabricación de muebles')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Albañil', N'Construcción y mantenimiento de estructuras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Pintor', N'Aplicación de pintura en interiores y exteriores')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Cerrajero', N'Reparaciones y aperturas de cerraduras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Jardinero', N'Cuidado y diseño de jardines')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Gasista', N'Instalaciones y reparaciones de gas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Mecánico', N'Reparaciones de vehículos')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Fontanero', N'Mantenimiento de instalaciones hidráulicas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Soldador', N'Soldaduras en metal y estructuras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Vidriero', N'Instalaciones de vidrios y ventanas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico en refrigeración', N'Reparaciones de equipos de frío')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Instalador de redes', N'Configuración de redes y cableados')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico informático', N'Soporte técnico y reparaciones de PC')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Electricista industrial', N'Instalaciones en áreas industriales')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico automotriz', N'Diagnósticos y reparaciones de autos')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Decorador', N'Diseño y decoración de interiores')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Electromecánico', N'Mantenimiento de maquinaria')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Pintor de autos', N'Aplicación de pintura en vehículos')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Electricista', N'Reparaciones y mantenimiento eléctrico')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Plomero', N'Instalaciones y reparaciones de plomería')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Carpintero', N'Diseño y fabricación de muebles')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Albañil', N'Construcción y mantenimiento de estructuras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Pintor', N'Aplicación de pintura en interiores y exteriores')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Cerrajero', N'Reparaciones y aperturas de cerraduras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Jardinero', N'Cuidado y diseño de jardines')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Gasista', N'Instalaciones y reparaciones de gas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Mecánico', N'Reparaciones de vehículos')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Fontanero', N'Mantenimiento de instalaciones hidráulicas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Soldador', N'Soldaduras en metal y estructuras')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Vidriero', N'Instalaciones de vidrios y ventanas')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico en refrigeración', N'Reparaciones de equipos de frío')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Instalador de redes', N'Configuración de redes y cableados')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico informático', N'Soporte técnico y reparaciones de PC')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Electricista industrial', N'Instalaciones en áreas industriales')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Técnico automotriz', N'Diagnósticos y reparaciones de autos')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Decorador', N'Diseño y decoración de interiores')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Electromecánico', N'Mantenimiento de maquinaria')
INSERT [dbo].[Especialidad] ([Especialidad], [Descripcion]) VALUES ( N'Pintor de autos', N'Aplicación de pintura en vehículos')
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiciosXTrabajador] ON 

INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (4, 22, N'Servicio de Reparación', CAST(N'2024-11-20T08:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (5, 23, N'Limpieza de Hogar', CAST(N'2024-11-21T09:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (6, 24, N'Mantenimiento Eléctrico', CAST(N'2024-11-22T10:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (7, 25, N'Instalación de Fontanería', CAST(N'2024-11-23T11:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (8, 26, N'Asesoría Legal', CAST(N'2024-11-24T12:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (9, 27, N'Servicio de Reparación', CAST(N'2024-11-25T13:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (10, 28, N'Limpieza de Hogar', CAST(N'2024-11-26T14:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES (11, 29, N'Mantenimiento Eléctrico', CAST(N'2024-11-27T15:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 12, 30, N'Instalación de Fontanería', CAST(N'2024-11-28T16:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 13, 31, N'Asesoría Legal', CAST(N'2024-11-29T17:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 14, 32, N'Servicio de Reparación', CAST(N'2024-11-30T18:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 15, 33, N'Limpieza de Hogar', CAST(N'2024-12-01T08:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 16, 34, N'Mantenimiento Eléctrico', CAST(N'2024-12-02T09:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 17, 35, N'Instalación de Fontanería', CAST(N'2024-12-03T10:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 18, 36, N'Asesoría Legal', CAST(N'2024-12-04T11:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 19, 37, N'Servicio de Reparación', CAST(N'2024-12-05T12:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 20, 38, N'Limpieza de Hogar', CAST(N'2024-12-06T13:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 21, 39, N'Mantenimiento Eléctrico', CAST(N'2024-12-07T14:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 22, 40, N'Instalación de Fontanería', CAST(N'2024-12-08T15:00:00.000' AS DateTime))
INSERT [dbo].[ServiciosXTrabajador] ( [ID_Cliente], [ID_Trabajador], [nombre_servicios], [fechahora]) VALUES ( 23, 41, N'Asesoría Legal', CAST(N'2024-12-09T16:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ServiciosXTrabajador] OFF
GO
SET IDENTITY_INSERT [dbo].[Trabajadores] ON 

INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-001', 1, 24, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-002', 2, 25, 0)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-003', 3, 26, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-004', 4, 27, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-005', 5, 28, 0)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-006', 1, 29, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-007', 2, 30, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-008', 3, 31, 0)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-009', 4, 32, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-010', 5, 33, 0)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-011', 1, 34, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-012', 2, 35, 0)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-013', 3, 36, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-014', 4, 37, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-015', 5, 38, 0)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-016', 1, 39, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-017', 2, 40, 0)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-018', 3, 41, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-019', 4, 42, 0)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'MAT-020', 5, 43, 1)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'adad', 5, 28, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'dasdasd', 1, 80, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'dasdasd', 1, 81, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'asdasd', 1, 82, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'dasdas', 1, 83, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'asdasd', 1, 84, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'alskjd', 1, 85, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'asdkmojoasid', 1, 87, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'asokdnmasd', 1, 88, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'aojnsdoaisd', 1, 89, NULL)
INSERT [dbo].[Trabajadores] ( [Matricula], [ID_Especialidad], [ID_User], [hora_dispo]) VALUES ( N'askjodnasd', 1, 90, NULL)
SET IDENTITY_INSERT [dbo].[Trabajadores] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (12345678, N'Juan', N'Pérez', 30, 14, 0, N'1234', N'juan@example.com', N'foto1.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (87654321, N'María', N'López', 25, 15, 0, N'abcd', N'maria@example.com',  N'foto2.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (11223344, N'Pedro', N'Gómez', 28, 16, 1, N'pass123', N'pedro@example.com',  N'foto3.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (44332211, N'Ana', N'Martínez', 35, 17, 1, N'5678', N'ana@example.com', N'foto4.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (55667788, N'Luis', N'Ramírez', 40, 18, 0, N'qwerty', N'luis@example.com', N'foto5.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (99887766, N'Sofía', N'Torres', 22, 19, 0, N'pass456', N'sofia@example.com',  N'foto6.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (22334455, N'Carlos', N'Díaz', 33, 20, 1, N'zxcvbn', N'carlos@example.com',  N'foto7.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (66778899, N'Elena', N'Suárez', 29, 21, 1, N'asdfgh', N'elena@example.com',  N'foto8.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (77889900, N'Diego', N'Vega', 31, 22, 0, N'hjkl', N'diego@example.com',  N'foto9.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (88990011, N'Valeria', N'Cruz', 27, 23, 1, N'tyui', N'valeria@example.com',  N'foto10.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (22334411, N'Martín', N'Castro', 32, 24, 0, N'martin123', N'martin@example.com',  N'foto11.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (33445522, N'Clara', N'Ortiz', 26, 25, 1, N'clara456', N'clara@example.com',  N'foto12.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (44556633, N'Tomás', N'Mendoza', 29, 26, 1, N'tomas789', N'tomas@example.com',  N'foto13.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (55667744, N'Laura', N'Guzmán', 24, 27, 0, N'laura321', N'laura@example.com',  N'foto14.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (66778855, N'Miguel', N'Salas', 36, 28, 0, N'miguel654', N'miguel@example.com',  N'foto15.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (77889966, N'Paula', N'Vargas', 23, 29, 1, N'paula987', N'paula@example.com',  N'foto16.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (88990077, N'Ricardo', N'Rojas', 34, 30, 1, N'ricardo123', N'ricardo@example.com',  N'foto17.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (99001188, N'Cecilia', N'Morales', 28, 31, 0, N'cecilia456', N'cecilia@example.com',  N'foto18.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (11002299, N'Andrés', N'Paredes', 27, 32, 0, N'andres789', N'andres@example.com',  N'foto19.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (22003344, N'Lucía', N'Peña', 25, 33, 1, N'lucia123', N'lucia@example.com',  N'foto20.jpg')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (43243287, N'azdfgf', N'sadasd', 18, 14, 0, N'2313', N'asdlkhah@gmail.com',  N'Foto')
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (230230, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (230230, N'Kevin', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (230230, N'Kevin', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (2222, N'Agus', N'BEre', 2023, 17, 1, N'123', N'hola@nose', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (2222, N'Agus', N'BEre', 2023, 17, 1, N'123', N'hola@nose', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (2222, N'Agus', N'BEre', 2023, 17, 1, N'123', N'hola@nose', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'sda', N'2141', 2023, 17, 1, N'123', N'asd@esf', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'111', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'lsdfqs@dwsa',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'Lopez', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (230230, N'Elias', N'asda', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (23232, N'dasd', N'Lopez', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'asd', N'sad', 2023, 17, 1, N'123', N'hola@nose', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (341235, N'Elias', N'rwerew', 2023, 17, 1, N'123', N'asd@gmail.com', NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'Elias', N'Lopez', 2023, NULL, 0, N'123', N'asd@gmail.com',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (23, N'asdasd', N'dasdasd', 2023, 17, 1, N'123', N'asdasd@dasujndi',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (123123, N'asdasd', N'asdasd', 2023, 17, 1, N'123', N'suezelias@gmail.com',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (123123, N'123123', N'asd', 2023, 17, 1, N'123', N'suezelias@gmail.com',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (123123, N'123123', N'asd', 2023, 17, 1, N'123', N'suezelias@gmail.com',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (123123, N'123123', N'asd', 2023, NULL, 0, N'123', N'asdasd@dasujndi',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (123123, N'123123', N'asd', 2023, NULL, 0, N'123', N'asdasd@dasujndi',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (123123, N'123123', N'asd', 2023, NULL, 0, N'123', N'asdasd@dasujndi',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (123123, N'123123', N'asd', 2023, NULL, 0, N'123', N'asdasd@dasujndi',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (48240167, N'123123', N'asdasdasd', 2023, NULL, 0, N'123', N'asdasd@dasujndi',  NULL)
INSERT [dbo].[Usuarios] ([DNI], [Nombre], [Apellido], [Edad], [ID_Valoracion], [Trabajador], [Password], [Email], [Foto]) VALUES (123123, N'123123', N'Suez', 2023, NULL, 0, N'123', N'suezelias@gmail.com',  NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Valoraciones] ON 

INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Excelente servicio', 1, 10)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Buen trabajo, pero puede mejorar', 1, 8)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Servicio regular', 0, 6)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'No cumplió las expectativas', 0, 4)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Mala experiencia', 0, 2)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Muy profesional', 1, 10)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Cumplió con lo esperado', 1, 8)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Aceptable', 1, 6)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Dejó incompleto el trabajo', 0, 4)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Pésimo servicio', 0, 2)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Altamente recomendado', 1, 10)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Trabajo eficiente', 1, 8)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Podría mejorar', 1, 6)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'No quedé conforme', 0, 4)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'No lo recomiendo', 0, 2)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'El mejor en su rubro', 1, 10)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Satisfecho', 1, 8)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Trabajo promedio', 1, 6)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'No fue puntual', 0, 4)
INSERT [dbo].[Valoraciones] ( [Comentario], [Desea_Recomendarlo], [Calificacion]) VALUES (N'Terrible experiencia', 0, 2)
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

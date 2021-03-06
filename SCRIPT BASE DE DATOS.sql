USE [master]
GO
/****** Object:  Database [db_farmaceutica2]    Script Date: 09/06/2022 22:33:39 ******/
CREATE DATABASE [db_farmaceutica2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_farmaceutica2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_farmaceutica2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_farmaceutica2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_farmaceutica2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_farmaceutica2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_farmaceutica2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_farmaceutica2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_farmaceutica2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_farmaceutica2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_farmaceutica2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_farmaceutica2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_farmaceutica2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_farmaceutica2] SET  MULTI_USER 
GO
ALTER DATABASE [db_farmaceutica2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_farmaceutica2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_farmaceutica2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_farmaceutica2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_farmaceutica2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_farmaceutica2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_farmaceutica2] SET QUERY_STORE = OFF
GO
USE [db_farmaceutica2]
GO
/****** Object:  Table [dbo].[barrios]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[barrios](
	[id_barrio] [int] NOT NULL,
	[barrio] [varchar](50) NULL,
	[id_localidad] [int] NULL,
 CONSTRAINT [pk_barrios] PRIMARY KEY CLUSTERED 
(
	[id_barrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] NOT NULL,
	[nom_cliente] [varchar](30) NULL,
	[ape_cliente] [varchar](30) NULL,
	[id_tipo_doc] [int] NULL,
	[num_doc] [int] NULL,
	[calle] [varchar](30) NULL,
	[nro_calle] [int] NULL,
	[id_barrio] [int] NULL,
 CONSTRAINT [pk_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_entrega]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_entrega](
	[id_detalle_entrega] [int] NOT NULL,
	[id_entrega] [int] NOT NULL,
	[id_suminitro] [int] NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [pk_detalles_entrega] PRIMARY KEY CLUSTERED 
(
	[id_detalle_entrega] ASC,
	[id_entrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_factura]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_factura](
	[id_detalle_ft] [int] NOT NULL,
	[nro_factura] [int] NOT NULL,
	[id_suministro] [int] NULL,
	[cobertura_os] [varchar](1) NULL,
	[precio] [money] NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [pk_detalles_factura] PRIMARY KEY CLUSTERED 
(
	[id_detalle_ft] ASC,
	[nro_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_receta]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_receta](
	[id_detalle_receta] [int] NOT NULL,
	[id_suministro] [int] NULL,
	[cod_autorizacion] [int] NOT NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [pk_detalles_receta] PRIMARY KEY CLUSTERED 
(
	[id_detalle_receta] ASC,
	[cod_autorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados_logistica]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados_logistica](
	[legajo_emp_log] [int] NOT NULL,
	[nom_empleado] [varchar](30) NULL,
	[ape_empleado] [varchar](30) NULL,
 CONSTRAINT [pk_empleados_logistica] PRIMARY KEY CLUSTERED 
(
	[legajo_emp_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados_suc]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados_suc](
	[legajo_emp_suc] [int] NOT NULL,
	[nom_empleado] [varchar](30) NULL,
	[ape_empleado] [varchar](30) NULL,
	[email] [varchar](30) NULL,
 CONSTRAINT [pk_empleados_suc] PRIMARY KEY CLUSTERED 
(
	[legajo_emp_suc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entregas]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entregas](
	[id_entrega] [int] NOT NULL,
	[legajo_emp_suc] [int] NULL,
	[id_logistica] [int] NULL,
	[fecha_entrega] [datetime] NULL,
	[id_sucursal] [int] NULL,
 CONSTRAINT [pk_entregas] PRIMARY KEY CLUSTERED 
(
	[id_entrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[nro_factura] [int] NOT NULL,
	[fecha_emision] [datetime] NULL,
	[fecha_baja] [datetime] NULL,
	[id_medio_pago] [int] NULL,
	[id_cliente] [int] NULL,
	[id_obra_social] [int] NULL,
	[id_sucursal] [int] NULL,
	[cod_autorizacion] [int] NULL,
 CONSTRAINT [pk_facturas] PRIMARY KEY CLUSTERED 
(
	[nro_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidades]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidades](
	[id_localidad] [int] NOT NULL,
	[localidad] [varchar](50) NULL,
	[id_provincia] [int] NULL,
 CONSTRAINT [pk_localidades] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_f]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_f](
	[id_login_f] [int] IDENTITY(1,1) NOT NULL,
	[legajo_emp_suc] [int] NULL,
	[pass] [varchar](20) NULL,
 CONSTRAINT [pk_login_f] PRIMARY KEY CLUSTERED 
(
	[id_login_f] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logisticas]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logisticas](
	[id_logistica] [int] NOT NULL,
	[nom_logistica] [varchar](30) NULL,
	[id_barrio] [int] NULL,
	[legajo_emp_log] [int] NULL,
 CONSTRAINT [pk_logisticas] PRIMARY KEY CLUSTERED 
(
	[id_logistica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medios_pago]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medios_pago](
	[id_medio_pago] [int] NOT NULL,
	[descripcion] [varchar](30) NULL,
 CONSTRAINT [pk_medios_pago] PRIMARY KEY CLUSTERED 
(
	[id_medio_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[obras_sociales]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[obras_sociales](
	[id_obra_social] [int] NOT NULL,
	[obra_social] [varchar](30) NULL,
	[id_localidad] [int] NULL,
 CONSTRAINT [pk_obras_sociales] PRIMARY KEY CLUSTERED 
(
	[id_obra_social] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[os_suministros]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_suministros](
	[id_os_sum] [int] NOT NULL,
	[id_obra_social] [int] NULL,
	[id_suministro] [int] NULL,
	[descuento] [decimal](4, 2) NULL,
	[mes] [varchar](10) NULL,
 CONSTRAINT [pk_os_suministros] PRIMARY KEY CLUSTERED 
(
	[id_os_sum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[id_provincia] [int] NOT NULL,
	[provincia] [varchar](30) NULL,
 CONSTRAINT [pk_provincias] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recetas]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recetas](
	[cod_autorizacion] [int] NOT NULL,
	[nom_medico] [varchar](30) NULL,
	[ape_medico] [varchar](30) NULL,
	[matricula_medico] [int] NULL,
	[fecha_receta] [datetime] NULL,
	[id_cliente] [int] NULL,
 CONSTRAINT [pk_recetas] PRIMARY KEY CLUSTERED 
(
	[cod_autorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stocks]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stocks](
	[id_stock] [int] NOT NULL,
	[id_sucursal] [int] NULL,
	[id_suministro] [int] NULL,
	[stock] [int] NULL,
	[stock_min] [int] NULL,
 CONSTRAINT [pk_stocks] PRIMARY KEY CLUSTERED 
(
	[id_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursales]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursales](
	[id_sucursal] [int] NOT NULL,
	[nom_sucursal] [varchar](30) NULL,
	[calle] [varchar](30) NULL,
	[altura] [int] NULL,
	[id_barrio] [int] NULL,
	[email] [varchar](30) NULL,
	[tel] [numeric](10, 0) NULL,
	[legajo_empleado_suc] [int] NULL,
 CONSTRAINT [pk_sucursales] PRIMARY KEY CLUSTERED 
(
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suministros]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suministros](
	[id_suministro] [int] NOT NULL,
	[suministro] [varchar](30) NULL,
	[venta_libre] [varchar](1) NULL,
	[id_tipo_suministro] [int] NULL,
	[pre_unitario] [decimal](8, 2) NULL,
	[descripcion] [varchar](30) NULL,
 CONSTRAINT [pk_suministros] PRIMARY KEY CLUSTERED 
(
	[id_suministro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_doc]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_doc](
	[id_tipo_doc] [int] NOT NULL,
	[tipo] [varchar](25) NULL,
 CONSTRAINT [pk_tipos_contacto] PRIMARY KEY CLUSTERED 
(
	[id_tipo_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_suministro]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_suministro](
	[id_tipo_suministro] [int] NOT NULL,
	[tipo_suministro] [varchar](30) NULL,
 CONSTRAINT [pk_tipos_suminsitro] PRIMARY KEY CLUSTERED 
(
	[id_tipo_suministro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[barrios]  WITH CHECK ADD  CONSTRAINT [fk_localidades_barrios] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[barrios] CHECK CONSTRAINT [fk_localidades_barrios]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk_barrios_clientes] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[barrios] ([id_barrio])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_barrios_clientes]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk_tipos_doc_clientes] FOREIGN KEY([id_tipo_doc])
REFERENCES [dbo].[tipos_doc] ([id_tipo_doc])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_tipos_doc_clientes]
GO
ALTER TABLE [dbo].[detalles_entrega]  WITH CHECK ADD  CONSTRAINT [fk_entregas_detalles_entrega] FOREIGN KEY([id_entrega])
REFERENCES [dbo].[entregas] ([id_entrega])
GO
ALTER TABLE [dbo].[detalles_entrega] CHECK CONSTRAINT [fk_entregas_detalles_entrega]
GO
ALTER TABLE [dbo].[detalles_entrega]  WITH CHECK ADD  CONSTRAINT [fk_suministros_detalles_entrega] FOREIGN KEY([id_suminitro])
REFERENCES [dbo].[suministros] ([id_suministro])
GO
ALTER TABLE [dbo].[detalles_entrega] CHECK CONSTRAINT [fk_suministros_detalles_entrega]
GO
ALTER TABLE [dbo].[detalles_factura]  WITH CHECK ADD  CONSTRAINT [fk_facturas_detalles_detalles_factura] FOREIGN KEY([nro_factura])
REFERENCES [dbo].[facturas] ([nro_factura])
GO
ALTER TABLE [dbo].[detalles_factura] CHECK CONSTRAINT [fk_facturas_detalles_detalles_factura]
GO
ALTER TABLE [dbo].[detalles_factura]  WITH CHECK ADD  CONSTRAINT [fk_suministros_detalles_factura] FOREIGN KEY([id_suministro])
REFERENCES [dbo].[suministros] ([id_suministro])
GO
ALTER TABLE [dbo].[detalles_factura] CHECK CONSTRAINT [fk_suministros_detalles_factura]
GO
ALTER TABLE [dbo].[detalles_receta]  WITH CHECK ADD  CONSTRAINT [fk_recetas_detalles_receta] FOREIGN KEY([cod_autorizacion])
REFERENCES [dbo].[recetas] ([cod_autorizacion])
GO
ALTER TABLE [dbo].[detalles_receta] CHECK CONSTRAINT [fk_recetas_detalles_receta]
GO
ALTER TABLE [dbo].[detalles_receta]  WITH CHECK ADD  CONSTRAINT [fk_suministros_detalles_receta] FOREIGN KEY([id_suministro])
REFERENCES [dbo].[suministros] ([id_suministro])
GO
ALTER TABLE [dbo].[detalles_receta] CHECK CONSTRAINT [fk_suministros_detalles_receta]
GO
ALTER TABLE [dbo].[entregas]  WITH CHECK ADD  CONSTRAINT [fk_empleados_logistica_entregas] FOREIGN KEY([legajo_emp_suc])
REFERENCES [dbo].[empleados_logistica] ([legajo_emp_log])
GO
ALTER TABLE [dbo].[entregas] CHECK CONSTRAINT [fk_empleados_logistica_entregas]
GO
ALTER TABLE [dbo].[entregas]  WITH CHECK ADD  CONSTRAINT [fk_logisticas_entregas] FOREIGN KEY([id_logistica])
REFERENCES [dbo].[logisticas] ([id_logistica])
GO
ALTER TABLE [dbo].[entregas] CHECK CONSTRAINT [fk_logisticas_entregas]
GO
ALTER TABLE [dbo].[entregas]  WITH CHECK ADD  CONSTRAINT [fk_sucursales_entregas] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursales] ([id_sucursal])
GO
ALTER TABLE [dbo].[entregas] CHECK CONSTRAINT [fk_sucursales_entregas]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [fk_clientes_facturas] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_clientes_facturas]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [fk_medios_pagos_facturas] FOREIGN KEY([id_medio_pago])
REFERENCES [dbo].[medios_pago] ([id_medio_pago])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_medios_pagos_facturas]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [fk_obras_sociales_facturas] FOREIGN KEY([id_obra_social])
REFERENCES [dbo].[obras_sociales] ([id_obra_social])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_obras_sociales_facturas]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [fk_recetas_facturas] FOREIGN KEY([cod_autorizacion])
REFERENCES [dbo].[recetas] ([cod_autorizacion])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_recetas_facturas]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [fk_sucursales_facturas] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursales] ([id_sucursal])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [fk_sucursales_facturas]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [fk_provincias_localidades] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [fk_provincias_localidades]
GO
ALTER TABLE [dbo].[login_f]  WITH CHECK ADD  CONSTRAINT [fk_login_f_empleados_suc] FOREIGN KEY([legajo_emp_suc])
REFERENCES [dbo].[empleados_suc] ([legajo_emp_suc])
GO
ALTER TABLE [dbo].[login_f] CHECK CONSTRAINT [fk_login_f_empleados_suc]
GO
ALTER TABLE [dbo].[logisticas]  WITH CHECK ADD  CONSTRAINT [fk_barrios_logisticas] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[barrios] ([id_barrio])
GO
ALTER TABLE [dbo].[logisticas] CHECK CONSTRAINT [fk_barrios_logisticas]
GO
ALTER TABLE [dbo].[logisticas]  WITH CHECK ADD  CONSTRAINT [fk_empleados_logistica_logisticas] FOREIGN KEY([legajo_emp_log])
REFERENCES [dbo].[empleados_logistica] ([legajo_emp_log])
GO
ALTER TABLE [dbo].[logisticas] CHECK CONSTRAINT [fk_empleados_logistica_logisticas]
GO
ALTER TABLE [dbo].[obras_sociales]  WITH CHECK ADD  CONSTRAINT [fk_localidades_obras_sociales] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[obras_sociales] CHECK CONSTRAINT [fk_localidades_obras_sociales]
GO
ALTER TABLE [dbo].[os_suministros]  WITH CHECK ADD  CONSTRAINT [fk_obras_sociales_os_suministros] FOREIGN KEY([id_obra_social])
REFERENCES [dbo].[obras_sociales] ([id_obra_social])
GO
ALTER TABLE [dbo].[os_suministros] CHECK CONSTRAINT [fk_obras_sociales_os_suministros]
GO
ALTER TABLE [dbo].[os_suministros]  WITH CHECK ADD  CONSTRAINT [fk_suministros_os_suministros] FOREIGN KEY([id_suministro])
REFERENCES [dbo].[suministros] ([id_suministro])
GO
ALTER TABLE [dbo].[os_suministros] CHECK CONSTRAINT [fk_suministros_os_suministros]
GO
ALTER TABLE [dbo].[recetas]  WITH CHECK ADD  CONSTRAINT [fk_clientes_recetas] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[recetas] CHECK CONSTRAINT [fk_clientes_recetas]
GO
ALTER TABLE [dbo].[stocks]  WITH CHECK ADD  CONSTRAINT [fk_suministros_stocks] FOREIGN KEY([id_suministro])
REFERENCES [dbo].[suministros] ([id_suministro])
GO
ALTER TABLE [dbo].[stocks] CHECK CONSTRAINT [fk_suministros_stocks]
GO
ALTER TABLE [dbo].[stocks]  WITH CHECK ADD  CONSTRAINT [fk_tipos_sucursales_stocks] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursales] ([id_sucursal])
GO
ALTER TABLE [dbo].[stocks] CHECK CONSTRAINT [fk_tipos_sucursales_stocks]
GO
ALTER TABLE [dbo].[sucursales]  WITH CHECK ADD  CONSTRAINT [fk_barrios_sucursales] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[barrios] ([id_barrio])
GO
ALTER TABLE [dbo].[sucursales] CHECK CONSTRAINT [fk_barrios_sucursales]
GO
ALTER TABLE [dbo].[sucursales]  WITH CHECK ADD  CONSTRAINT [fk_empleados_suc_sucursales] FOREIGN KEY([legajo_empleado_suc])
REFERENCES [dbo].[empleados_suc] ([legajo_emp_suc])
GO
ALTER TABLE [dbo].[sucursales] CHECK CONSTRAINT [fk_empleados_suc_sucursales]
GO
ALTER TABLE [dbo].[suministros]  WITH CHECK ADD  CONSTRAINT [fk_tipos_suministro_suministros] FOREIGN KEY([id_tipo_suministro])
REFERENCES [dbo].[tipos_suministro] ([id_tipo_suministro])
GO
ALTER TABLE [dbo].[suministros] CHECK CONSTRAINT [fk_tipos_suministro_suministros]
GO
/****** Object:  StoredProcedure [dbo].[PA_CONSULTAR_CLIENTES]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_CONSULTAR_CLIENTES]  
AS  
BEGIN  
   
 SELECT * FROM clientes ORDER BY id_cliente;  
END
GO
/****** Object:  StoredProcedure [dbo].[PA_CONSULTAR_FACTURA_X_ID]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_CONSULTAR_FACTURA_X_ID]   @nro int   AS  BEGIN   SELECT *   FROM facturas f   JOIN detalles_factura df ON f.nro_factura=df.nro_factura   JOIN suministros s ON s.id_suministro=df.id_suministro   WHERE f.nro_factura=@nro;  END
GO
/****** Object:  StoredProcedure [dbo].[PA_CONSULTAR_FACTURAS]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PA_CONSULTAR_FACTURAS]    @cliente int,   @facturasBaja varchar(1)  AS  BEGIN   SELECT*   FROM facturas f   JOIN clientes c ON f.id_cliente=c.id_cliente   JOIN medios_pago mp ON f.id_medio_pago=mp.id_medio_pago   JOIN obras_sociales os ON f.id_obra_social=os.id_obra_social   JOIN sucursales s ON f.id_sucursal=s.id_sucursal   WHERE f.id_cliente=@cliente AND ((@facturasBaja is null OR @facturasBaja = 'S') OR (@facturasBaja = 'N' and @facturasBaja IS  NULL))      END
GO
/****** Object:  StoredProcedure [dbo].[PA_CONSULTAR_MEDIOS_DE_PAGO]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_CONSULTAR_MEDIOS_DE_PAGO]  
AS  
BEGIN  
 
 SELECT * FROM medios_pago ORDER BY descripcion;  
END
GO
/****** Object:  StoredProcedure [dbo].[PA_CONSULTAR_OBRA_SOCIAL]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_CONSULTAR_OBRA_SOCIAL]  
AS  
BEGIN  
   
 SELECT * FROM obras_sociales ORDER BY obra_social;  
END
GO
/****** Object:  StoredProcedure [dbo].[PA_CONSULTAR_SUCURSAL]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_CONSULTAR_SUCURSAL]  
AS  
BEGIN  
   
 SELECT * FROM sucursales ORDER BY id_sucursal;  
END
GO
/****** Object:  StoredProcedure [dbo].[PA_CONSULTAR_SUMINISTROS]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_CONSULTAR_SUMINISTROS]  
AS  
BEGIN  
   
 SELECT * FROM suministros ORDER BY descripcion;  
END

GO
/****** Object:  StoredProcedure [dbo].[PA_EDITAR_FACTURA]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[PA_EDITAR_FACTURA]    @nro_factura int,   @id_detalle_ft int,    @id_suministro int,    @cantidad int,   @cobertura varchar(1)  AS  BEGIN   UPDATE  detalles_factura SET id_suministro=@id_suministro, cantidad=@cantidad,cobertura_os=@cobertura      WHERE nro_factura=@nro_factura and id_detalle_ft=@id_detalle_ft  END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTAR_DETALLES_FACTURA]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PA_INSERTAR_DETALLES_FACTURA]      @nro int,     @detalle int,      @idSuministro int,    @cobertura varchar(1),   @precio money,   @cantidad int    AS    BEGIN     INSERT INTO detalles_factura(nro_factura,id_detalle_ft,id_suministro,cobertura_os,precio,cantidad)        VALUES (@nro, @detalle, @idSuministro,@cobertura,@precio,@cantidad);          END
GO
/****** Object:  StoredProcedure [dbo].[PA_INSERTAR_FACTURA]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PA_INSERTAR_FACTURA]        @nro int,     @fecha_emision datetime,     @formaPago int,     @cliente int,      @obraSocial int,     @sucursal int         AS    BEGIN     INSERT INTO facturas(nro_factura, fecha_emision, id_medio_pago, id_cliente,id_obra_social,id_sucursal)        VALUES (@nro, @fecha_emision, @formaPago, @cliente, @obraSocial,@sucursal);        END
GO
/****** Object:  StoredProcedure [dbo].[PA_PROXIMA_FACTURA]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_PROXIMA_FACTURA]  
@next int OUTPUT  
AS  
BEGIN  
 SET @next = (SELECT MAX(nro_factura)+1  FROM facturas);  
END
GO
/****** Object:  StoredProcedure [dbo].[PA_REGISTRAR_BAJA]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[PA_REGISTRAR_BAJA]    @nro_factura int  AS  BEGIN   UPDATE facturas SET fecha_baja = GETDATE()   WHERE nro_factura = @nro_factura;     END
GO
/****** Object:  StoredProcedure [dbo].[PA_TRAER_CLIENTE]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PA_TRAER_CLIENTE] 
 @doc int
AS  
BEGIN    
 SELECT nom_cliente,ape_cliente,id_cliente  FROM clientes WHERE num_doc=@doc;  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTA_1]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--1-totales de facturación autorizados por obra social y tipo de suministrocreate procedure [dbo].[SP_CONSULTA_1]ASSELECTos.obra_social 'Obra Social',ts.tipo_suministro 'Tipo de Suministro',SUM(df.cantidad*df.precio)'Importe Total'FROM facturas fJOIN detalles_factura df ON f.nro_factura=df.nro_facturaJOIN obras_sociales os ON os.id_obra_social=f.id_obra_socialJOIN suministros s ON s.id_suministro=df.id_suministroJOIN tipos_suministro ts ON ts.id_tipo_suministro=s.id_tipo_suministroWHERE cobertura_os='S'GROUP BY os.obra_social,ts.tipo_suministroORDER BY 1,2
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTA_2]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTA_2]AS
SELECT
ob.obra_social 'Obra Social',
os.descuento 'Porcentaje de Descuento',
CONVERT(DECIMAL (10,2),SUM(df.cantidad*df.precio)) 'Importe',
CONVERT (DECIMAL (10,2),SUM(df.cantidad*df.precio)*os.descuento/100 )'Descuento',
CONVERT (DECIMAL (10,2),SUM(df.cantidad*df.precio)-(SUM(df.cantidad*df.precio)*os.descuento/100))'Reembolso'
FROM facturas f
JOIN detalles_factura df on df.nro_factura=f.nro_factura
JOIN obras_sociales ob on f.id_obra_social = ob.id_obra_social
JOIN os_suministros os on ob.id_obra_social = os.id_obra_social
WHERE cobertura_os='S'
GROUP BY ob.obra_social,os.descuento 
ORDER BY 1
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTA_3]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--3-Suministros que nunca se han vendido
CREATE PROCEDURE [dbo].[SP_CONSULTA_3]
ASSELECTs.suministro 'Suministro',ts.tipo_suministro 'Tipo de suministro'FROM suministros sJOIN tipos_suministro ts ON ts.id_tipo_suministro = s.id_tipo_suministroWHERE NOT EXISTS(SELECT df.id_suministro FROM detalles_factura dfWHERE s.id_suministro = df.id_suministro)ORDER BY 2
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTA_4]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--4-Clientes que abonaron su compra mediante cobertura con Obra Social, detallando además la fecha,factura y monto
CREATE PROCEDURE [dbo].[SP_CONSULTA_4]
ASSELECTf.nro_factura 'Factura',CONVERT(date, f.fecha_emision) 'Fecha',c.nom_cliente+' '+c.ape_cliente 'Cliente',os.obra_social 'Obra Social',SUM(de.cantidad*de.precio)'Monto'FROM facturas FJOIN detalles_factura de ON de.nro_factura = f.nro_facturaJOIN clientes c ON f.id_cliente = c.id_clienteJOIN obras_sociales os ON os.id_obra_social=f.id_obra_socialWHERE EXISTS(SELECT df.nro_factura FROM detalles_factura dfWHERE cobertura_os = 'S' and df.nro_factura = f.nro_factura)GROUP BY f.nro_factura,f.fecha_emision,c.nom_cliente+' '+c.ape_cliente,os.obra_socialorder by 3,2,1
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTA_5]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTA_5]ASselect ob.obra_social as 'Obra Social',count(distinct f.id_cliente) as 'Afiliados',cast(SUM((df.cantidad*df.precio)*os.descuento/100)as decimal (9,2)) 'Total de Descuento'from facturas f join detalles_factura df on f.nro_factura=df.nro_factura      join obras_sociales ob on ob.id_obra_social=f.id_obra_social	 join os_suministros os on os.id_suministro=df.id_suministrogroup by ob.obra_socialORDER BY 1
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTA_AÑOS_FACTURADOS]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_CONSULTA_AÑOS_FACTURADOS]
AS
select distinct YEAR(f.fecha_emision)as anio
from facturas f join detalles_factura df on f.nro_factura=df.nro_factura
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_STOCKS]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_CONSULTAR_STOCKS]
AS
select id_stock,sk.id_suministro,suministro,descripcion,stock,stock_min
from stocks sk join suministros s on sk.id_suministro=s.id_suministro


GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_SUMINISTROS]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_CONSULTAR_SUMINISTROS]
AS
SELECT id_suministro AS ID,suministro AS SIMINISTRO,venta_libre AS VENTA_LIBRE,s.id_tipo_suministro,pre_unitario as PRECIO,descripcion AS DESCRIPCION,ts.id_tipo_suministro,tipo_suministro as TIPO_SUMINISTRO 
FROM suministros s join tipos_suministro ts on s.id_tipo_suministro=ts.id_tipo_suministro  
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_TIPOS_SUMINISTRO]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[SP_CONSULTAR_TIPOS_SUMINISTRO]
  AS
  SELECT * FROM tipos_suministro
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_SUMINISTRO]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_DELETE_SUMINISTRO]
@id_suministro int
as
delete suministros
where id_suministro=@id_suministro
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_SUMINISTRO]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_INSERTAR_SUMINISTRO]
@id_suministro int,
@suministro varchar(100),
@venta_libre varchar(1),
@id_tipo_suministro int,
@precio decimal(8,2),
@descripcion varchar(100)
as
insert into suministros(id_suministro,suministro,venta_libre,id_tipo_suministro,pre_unitario,descripcion)
values (@id_suministro,@suministro,@venta_libre,@id_tipo_suministro,@precio,@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_USUARIO]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_REGISTRAR_USUARIO]
@legajo int,
@pass varchar(20)
as
insert into login_f(legajo_emp_suc,pass)
values(@legajo,@pass)
GO
/****** Object:  StoredProcedure [dbo].[SP_REPORTE_CANTIDAD_VENTAS_SUMINISTRO]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_REPORTE_CANTIDAD_VENTAS_SUMINISTRO]
AS
select df.id_suministro,suministro ,sum(cantidad)as 'Cantidad',sum(pre_unitario*cantidad)as'Monto'
from detalles_factura df join suministros s on df.id_suministro=s.id_suministro
group by df.id_suministro,suministro
GO
/****** Object:  StoredProcedure [dbo].[SP_REPORTE_FACTURACION_MES]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_REPORTE_FACTURACION_MES]
@anio int
AS
select datename(MONTH,fecha_emision) as 'MES',df.nro_factura as 'NRO_FACTURA',f.fecha_emision as 'FECHA', sum(df.precio*cantidad) AS 'TOTAL'
from facturas f join detalles_factura df on f.nro_factura=df.nro_factura
where YEAR(f.fecha_emision)=@anio
group by datename(MONTH,fecha_emision) , df.nro_factura,f.fecha_emision
order by MONTH(fecha_emision)
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_SUMINISTRO]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_UPDATE_SUMINISTRO]
@id_suministro int,
@suministro varchar(30),
@venta_libre varchar(1),
@id_tipo_suministro int,
@pre_unitario decimal(8,2),
@descripcion varchar(30)
as
update suministros
set suministro=@suministro,
    venta_libre=@venta_libre,
	id_tipo_suministro=@id_tipo_suministro,
	pre_unitario=@pre_unitario,
	descripcion=@descripcion
where id_suministro=@id_suministro
GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDAR_LOGIN]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_VALIDAR_LOGIN]
@usuario int,
@pass varchar(20)
as
select * 
from login_f l join empleados_suc es on l.legajo_emp_suc=es.legajo_emp_suc
where l.legajo_emp_suc = @usuario and pass=@pass
GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICAR_EMPLEADO]    Script Date: 09/06/2022 22:33:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_VERIFICAR_EMPLEADO]
@id_legajo int,
@nom_empleado varchar(30),
@ape_empleado varchar(30),
@email varchar(30)
AS
select * from empleados_suc 
where legajo_emp_suc=@id_legajo 
    and nom_empleado=@nom_empleado 
	and ape_empleado=@ape_empleado  
	and email=@email
GO
USE [master]
GO
ALTER DATABASE [db_farmaceutica2] SET  READ_WRITE 
GO

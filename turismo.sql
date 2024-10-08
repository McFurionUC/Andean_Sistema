USE Turismo;
GO

-- Eliminar tablas si ya existen
IF OBJECT_ID('dbo.Detalle', 'U') IS NOT NULL
    DROP TABLE dbo.Detalle;
GO

IF OBJECT_ID('dbo.Ventas', 'U') IS NOT NULL
    DROP TABLE dbo.Ventas;
GO

IF OBJECT_ID('dbo.Rutas', 'U') IS NOT NULL
    DROP TABLE dbo.Rutas;
GO

IF OBJECT_ID('dbo.Usuario', 'U') IS NOT NULL
    DROP TABLE dbo.Usuario;
GO

IF OBJECT_ID('dbo.Buses', 'U') IS NOT NULL
    DROP TABLE dbo.Buses;
GO
USE [Turismo]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 15/09/2024 10:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[BusID] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [nvarchar](10) NOT NULL,
	[Marca] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL,
	[Asientos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 15/09/2024 10:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[VentaID] [int] NOT NULL,
	[RutaID] [int] NOT NULL,
	[BusID] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 15/09/2024 10:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[RutaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Ubicacion] [nvarchar](100) NOT NULL,
	[ID_Ruta] [nvarchar](100) NOT NULL,
	[Distancia] [decimal](10, 2) NULL,
	[PRECIO_RUTA] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[RutaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/09/2024 10:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[DNI_PASAPORTE] [nvarchar](100) NOT NULL,
	[ID_Cliente] [nvarchar](100) NOT NULL,
	[Edad] [nvarchar](100) NOT NULL,
	[Teléfono] [nvarchar](15) NULL,
	[Nacionalidad] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 15/09/2024 10:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[VentaID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[FechaVenta] [date] NOT NULL,
	[HORA_VENTA] [time](7) NOT NULL,
	[DETALLE_ID] [int] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD FOREIGN KEY([BusID])
REFERENCES [dbo].[Buses] ([BusID])
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD FOREIGN KEY([RutaID])
REFERENCES [dbo].[Rutas] ([RutaID])
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD FOREIGN KEY([VentaID])
REFERENCES [dbo].[Ventas] ([VentaID])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO

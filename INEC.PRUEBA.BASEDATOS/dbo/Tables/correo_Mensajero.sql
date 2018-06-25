CREATE TABLE [dbo].[correo_Mensajero] (
    [ConMensajero] INT           IDENTITY (1, 1) NOT NULL,
    [Cedula]       VARCHAR (32)  NULL,
    [Licencia]     VARCHAR (32)  NULL,
    [Nombre]       VARCHAR (70)  NULL,
    [Photo]        IMAGE         NULL,
    [Placa]        VARCHAR (32)  NULL,
    [ConRuta]      INT           NULL,
    [CodigoPais]   INT           NULL,
    [Clave]        VARCHAR (128) NULL,
    [Usuario]      VARCHAR (40)  NULL,
    [LastLogin]    SMALLDATETIME NULL,
    [Token]        VARCHAR (128) NULL,
    PRIMARY KEY CLUSTERED ([ConMensajero] ASC)
);


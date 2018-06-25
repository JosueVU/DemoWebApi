CREATE TABLE [dbo].[correo_RutaEntrega] (
    [ConRuta]    INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]     VARCHAR (120) NOT NULL,
    [Detalle]    VARCHAR (255) NULL,
    [CodigoPais] INT           NULL,
    PRIMARY KEY CLUSTERED ([ConRuta] ASC)
);


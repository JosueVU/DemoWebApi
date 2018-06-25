CREATE TABLE [dbo].[cliente_Pais] (
    [id]          INT           NOT NULL,
    [nombre]      VARCHAR (120) NOT NULL,
    [codigoPais2] VARCHAR (20)  NULL,
    [codigoPais3] VARCHAR (20)  NULL,
    [gentilicio]  VARCHAR (255) NULL,
    [image]       IMAGE         NULL,
    [activo]      INT           DEFAULT ((0)) NULL,
    [CodigoPais]  INT           DEFAULT ((188)) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


CREATE TABLE [dbo].[cliente_Subdivision] (
    [ConSubdivision] INT           IDENTITY (83, 1) NOT NULL,
    [ConDivision]    INT           NULL,
    [CodigoPais]     INT           NOT NULL,
    [pais_id]        INT           NOT NULL,
    [division_id]    INT           NOT NULL,
    [subdivision_id] INT           NOT NULL,
    [nombre]         VARCHAR (120) NULL,
    [mensajeria]     INT           NULL,
    [ruta_id]        INT           NULL,
    [Subdivision]    INT           NULL,
    PRIMARY KEY CLUSTERED ([ConSubdivision] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_cliente_Subdivision_Pais_Division_Subdivision]
    ON [dbo].[cliente_Subdivision]([CodigoPais] ASC, [division_id] ASC, [subdivision_id] ASC);


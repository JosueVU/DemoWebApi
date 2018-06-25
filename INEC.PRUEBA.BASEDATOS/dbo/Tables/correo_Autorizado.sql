CREATE TABLE [dbo].[correo_Autorizado] (
    [IDE_CODIGO]       INT          IDENTITY (1, 1) NOT NULL,
    [TIP_AUTORIZADO]   INT          NULL,
    [TIP_RELACION]     INT          NULL,
    [COD_PERSONA]      INT          NOT NULL,
    [IDE_SJO]          VARCHAR (12) NULL,
    [DireccionDefault] BIT          NULL,
    [CodigoPais]       INT          NULL,
    PRIMARY KEY CLUSTERED ([IDE_CODIGO] ASC),
    CONSTRAINT [FKDD5145C12A04E850] FOREIGN KEY ([IDE_SJO]) REFERENCES [dbo].[cliente_Cliente] ([IDE_SJO]),
    CONSTRAINT [FKDD5145C13A9E1404] FOREIGN KEY ([COD_PERSONA]) REFERENCES [dbo].[cliente_Persona] ([id])
);


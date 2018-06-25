CREATE TABLE [dbo].[cliente_TarjetaBitacora] (
    [IDE_TARJETA_BITACORA] INT            IDENTITY (1, 1) NOT NULL,
    [FEC_BITACORA]         DATETIME       NULL,
    [COD_OPERACION]        INT            NULL,
    [IDE_SJO]              VARCHAR (12)   NULL,
    [COD_USER]             VARCHAR (45)   NULL,
    [DSC_INFO]             VARCHAR (1024) NULL,
    PRIMARY KEY CLUSTERED ([IDE_TARJETA_BITACORA] ASC),
    CONSTRAINT [FK52F8BF572A04E850] FOREIGN KEY ([IDE_SJO]) REFERENCES [dbo].[cliente_Cliente] ([IDE_SJO])
);


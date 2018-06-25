CREATE TABLE [dbo].[correo_Seguro] (
    [IDE_CODIGO]           INT           IDENTITY (1, 1) NOT NULL,
    [DSC_MENSAJE]          VARCHAR (120) NULL,
    [MON_CIF_DESDE]        FLOAT (53)    NULL,
    [MON_CIF_HASTA]        FLOAT (53)    NULL,
    [POR_SEGURO_MERCANCIA] FLOAT (53)    NULL,
    [LOG_VALOR]            TINYINT       NULL,
    [IDE_EMPRESA]          INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IDE_CODIGO] ASC),
    CONSTRAINT [FK67B28826B84AEF60] FOREIGN KEY ([IDE_EMPRESA]) REFERENCES [dbo].[correo_ParametroEmpresa] ([IDE_EMPRESA])
);


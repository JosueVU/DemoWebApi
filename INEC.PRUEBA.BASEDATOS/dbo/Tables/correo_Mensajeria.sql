CREATE TABLE [dbo].[correo_Mensajeria] (
    [IDE_CODIGO]      INT        IDENTITY (1, 1) NOT NULL,
    [CAN_DESDE]       FLOAT (53) NULL,
    [CAN_HASTA]       FLOAT (53) NULL,
    [LOG_ES_UN_VALOR] TINYINT    NULL,
    [POR_COSTO]       FLOAT (53) NULL,
    [IDE_EMPRESA]     INT        NOT NULL,
    [CodigoPais]      INT        NULL,
    PRIMARY KEY CLUSTERED ([IDE_CODIGO] ASC),
    CONSTRAINT [FK53CFEC74B84AEF60] FOREIGN KEY ([IDE_EMPRESA]) REFERENCES [dbo].[correo_ParametroEmpresa] ([IDE_EMPRESA])
);


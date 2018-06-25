CREATE TABLE [dbo].[cliente_AlianzaComercial] (
    [conAlianza]    INT            IDENTITY (1, 1) NOT NULL,
    [nomAlianza]    VARCHAR (60)   NULL,
    [MonDescuento]  FLOAT (53)     NULL,
    [ConContrato]   INT            NULL,
    [MonJetBillete] FLOAT (53)     NULL,
    [MonKiloBox]    FLOAT (53)     NULL,
    [NomBanco]      VARCHAR (120)  NULL,
    [Bines]         VARCHAR (4096) NULL,
    [CodigoPais]    INT            NULL,
    PRIMARY KEY CLUSTERED ([conAlianza] ASC),
    CONSTRAINT [FK32CDFF322CC28901] FOREIGN KEY ([ConContrato]) REFERENCES [dbo].[correo_Contrato] ([IDE_CODIGO])
);


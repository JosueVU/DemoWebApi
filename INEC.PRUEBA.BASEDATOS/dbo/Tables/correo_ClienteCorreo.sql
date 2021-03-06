﻿CREATE TABLE [dbo].[correo_ClienteCorreo] (
    [IDE_SJO]               VARCHAR (12) NOT NULL,
    [COD_TIPO_CONTRATO]     INT          NULL,
    [LOG_TARJETA_CREDITO]   TINYINT      DEFAULT ((0)) NOT NULL,
    [LOG_CARGO_MENSAJERIA]  TINYINT      NULL,
    [LOG_RECIBIDO_CONFORME] TINYINT      NULL,
    [NUM_EJECUTIVO]         INT          NULL,
    [COD_CONTRATO_ECONOMY]  INT          NULL,
    [CodigoPais]            INT          NULL,
    PRIMARY KEY CLUSTERED ([IDE_SJO] ASC),
    CONSTRAINT [FK37FE84A72A04E850] FOREIGN KEY ([IDE_SJO]) REFERENCES [dbo].[cliente_Cliente] ([IDE_SJO]),
    CONSTRAINT [FK37FE84A7328C43A3] FOREIGN KEY ([COD_TIPO_CONTRATO]) REFERENCES [dbo].[correo_Contrato] ([IDE_CODIGO]),
    CONSTRAINT [FK37FE84A748B88BA0] FOREIGN KEY ([NUM_EJECUTIVO]) REFERENCES [dbo].[correo_Ejecutivo] ([NUM_EJECUTIVO]),
    CONSTRAINT [FK37FE84A7D0EB7A65] FOREIGN KEY ([COD_CONTRATO_ECONOMY]) REFERENCES [dbo].[correo_Contrato] ([IDE_CODIGO])
);


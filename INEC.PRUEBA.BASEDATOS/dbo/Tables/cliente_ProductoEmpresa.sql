﻿CREATE TABLE [dbo].[cliente_ProductoEmpresa] (
    [COD_PRODUCTO] INT NOT NULL,
    [COD_EMPRESA]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([COD_PRODUCTO] ASC, [COD_EMPRESA] ASC),
    CONSTRAINT [FKCF2E1AA46CA7C394] FOREIGN KEY ([COD_PRODUCTO]) REFERENCES [dbo].[cliente_Producto] ([id]),
    CONSTRAINT [FKCF2E1AA4C9E8F5BE] FOREIGN KEY ([COD_EMPRESA]) REFERENCES [dbo].[cliente_Empresa] ([id])
);


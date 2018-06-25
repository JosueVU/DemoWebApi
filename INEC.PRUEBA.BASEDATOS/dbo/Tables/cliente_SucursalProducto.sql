CREATE TABLE [dbo].[cliente_SucursalProducto] (
    [sucursal_id] INT NOT NULL,
    [producto_id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([sucursal_id] ASC, [producto_id] ASC),
    CONSTRAINT [FKDED997C5214F2BA7] FOREIGN KEY ([sucursal_id]) REFERENCES [dbo].[cliente_Sucursal] ([id]),
    CONSTRAINT [FKDED997C554ADBFA7] FOREIGN KEY ([producto_id]) REFERENCES [dbo].[cliente_Producto] ([id])
);


CREATE TABLE [dbo].[cliente_ClienteProducto] (
    [producto_id] INT          NOT NULL,
    [cliente_id]  VARCHAR (12) NOT NULL,
    PRIMARY KEY CLUSTERED ([producto_id] ASC, [cliente_id] ASC),
    CONSTRAINT [FK9609811554ADBFA7] FOREIGN KEY ([producto_id]) REFERENCES [dbo].[cliente_Producto] ([id]),
    CONSTRAINT [FK960981158F33BED] FOREIGN KEY ([cliente_id]) REFERENCES [dbo].[cliente_Cliente] ([IDE_SJO])
);


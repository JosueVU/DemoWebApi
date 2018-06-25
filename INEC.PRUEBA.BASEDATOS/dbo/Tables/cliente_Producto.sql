CREATE TABLE [dbo].[cliente_Producto] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [empresa_id] INT           NULL,
    [nombre]     VARCHAR (120) NULL,
    [MultiPais]  TINYINT       CONSTRAINT [DF_cliente_Producto_MultiPais] DEFAULT ((0)) NULL,
    [CodigoPais] INT           NULL,
    CONSTRAINT [PK__cliente_Producto__59F03CDF] PRIMARY KEY CLUSTERED ([id] ASC)
);


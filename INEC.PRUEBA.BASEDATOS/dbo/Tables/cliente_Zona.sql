CREATE TABLE [dbo].[cliente_Zona] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [CodigoPais]  INT           NULL,
    [sucursal_id] NUMERIC (18)  CONSTRAINT [DF_cliente_Zona_sucursal_id] DEFAULT ((1)) NULL,
    [nombre]      VARCHAR (120) NULL,
    [descripcion] VARCHAR (250) NULL,
    [ind_ruta]    BIGINT        CONSTRAINT [DF_cliente_Zona_ind_ruta] DEFAULT ((1)) NULL,
    CONSTRAINT [PK__cliente_Zona__6561EF8B] PRIMARY KEY CLUSTERED ([id] ASC)
);


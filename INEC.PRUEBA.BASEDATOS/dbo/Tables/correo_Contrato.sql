CREATE TABLE [dbo].[correo_Contrato] (
    [IDE_CODIGO]         INT           IDENTITY (6005, 1) NOT NULL,
    [CodigoPais]         INT           NULL,
    [CodigoContrato]     INT           NULL,
    [COD_EMPRESA]        INT           NULL,
    [COD_ALIANZA]        INT           NULL,
    [TIP_CONTRATO]       INT           CONSTRAINT [DF__correo_Contrato__Tipo_Contrato] DEFAULT ((0)) NOT NULL,
    [DSC_NOMBRE]         VARCHAR (255) NULL,
    [MultiPais]          TINYINT       CONSTRAINT [DF__correo_Contrato__Multi_Pais] DEFAULT ((0)) NULL,
    [IND_CONTADO]        TINYINT       NULL,
    [IND_USA_JUMPING]    TINYINT       NULL,
    [IND_PUBLICADO]      TINYINT       CONSTRAINT [DF__correo_Contrato__IND_Publicado] DEFAULT ((0)) NULL,
    [CAN_CUPO]           FLOAT (53)    NULL,
    [CAN_PESO_MINIMO]    FLOAT (53)    NULL,
    [MON_MONTO_MENSUAL]  FLOAT (53)    NULL,
    [CAN_KILO_ADICIONAL] FLOAT (53)    NULL,
    CONSTRAINT [PK__correo_TipoContr__6EEB59C5] PRIMARY KEY CLUSTERED ([IDE_CODIGO] ASC),
    CONSTRAINT [FK_cliente_Empresa__correo_Contrato] FOREIGN KEY ([COD_EMPRESA]) REFERENCES [dbo].[cliente_Empresa] ([id]),
    CONSTRAINT [FKE4004805C9E8F5BE] FOREIGN KEY ([COD_EMPRESA]) REFERENCES [dbo].[cliente_Empresa] ([id])
);


﻿CREATE TABLE [dbo].[cliente_Cliente] (
    [IDE_SJO]                       VARCHAR (12)   NOT NULL,
    [IDE_SJO_HQS]                   INT            NULL,
    [CodigoPais]                    INT            CONSTRAINT [DF_cliente_Cliente_CodigoPais] DEFAULT ((188)) NOT NULL,
    [persona_id]                    INT            NULL,
    [apoderado_id]                  INT            NULL,
    [direccion_id]                  NUMERIC (19)   NULL,
    [direccion1_id]                 INT            NULL,
    [direccion2_id]                 INT            NULL,
    [sucursal_id]                   INT            NOT NULL,
    [zona_id]                       INT            NOT NULL,
    [ConAlianza]                    INT            NULL,
    [tipoCliente]                   INT            NULL,
    [estadoCliente]                 INT            NULL,
    [claveWeb]                      VARCHAR (255)  NULL,
    [claveWeb_temp]                 TINYINT        NULL,
    [nombre]                        VARCHAR (120)  NULL,
    [nombreCorto]                   VARCHAR (120)  NULL,
    [cedulaJuridica]                VARCHAR (40)   NULL,
    [idioma]                        VARCHAR (2)    NULL,
    [fechaIngreso]                  DATETIME       NULL,
    [historialZona]                 VARCHAR (1024) NOT NULL,
    [observaciones]                 VARCHAR (1024) NOT NULL,
    [fechaUltimaGeneracionClaveWeb] DATETIME       NULL,
    [flags]                         INT            NOT NULL,
    [forma_de_afiliacion]           TINYINT        CONSTRAINT [DF_cliente_Cliente_forma_de_afiliacion] DEFAULT ((0)) NULL,
    [IND_COBRAR_MENSAJERIA]         TINYINT        CONSTRAINT [DF__cliente_C__IND_C__6D0DFE4B] DEFAULT ((1)) NOT NULL,
    [IND_COBRAR_GUIA]               TINYINT        CONSTRAINT [DF__cliente_C__IND_C__6E022284] DEFAULT ((1)) NOT NULL,
    [comoConocioJetbox]             VARCHAR (40)   CONSTRAINT [DF__cliente_C__comoC__72C6D7A1] DEFAULT ('') NULL,
    [codigoPromo]                   VARCHAR (30)   CONSTRAINT [DF__cliente_C__codig__73BAFBDA] DEFAULT ('') NULL,
    [recomiendaCuenta]              VARCHAR (5)    NULL,
    [recomiendaCuentaFecha]         DATETIME       NULL,
    [recomiendaCuentaUsuario]       VARCHAR (45)   NULL,
    [AlianzaFechaDatos]             DATETIME       NULL,
    [AlianzaUsuario]                VARCHAR (45)   NULL,
    [EsCuentaGerencia]              TINYINT        NULL,
    [ConfeccionWH]                  TINYINT        NULL,
    [EsApoderadoContacto]           BIT            NULL,
    [ClienteContado]                INT            NULL,
    [sync]                          INT            CONSTRAINT [DF__cliente_Cl__sync__5EFFD616] DEFAULT ((0)) NULL,
    [sync_admin]                    INT            CONSTRAINT [DF_cliente_Cliente_sync_admin] DEFAULT ((0)) NULL,
    [sync_exactus]                  INT            CONSTRAINT [DF_cliente_Cliente_sync_exactus] DEFAULT ((0)) NULL,
    [sync_jbc]                      INT            CONSTRAINT [DF__cliente_C__sync___63C48B33] DEFAULT ((0)) NULL,
    [sync_rj]                       INT            CONSTRAINT [DF_cliente_Cliente_sync_rj] DEFAULT ((0)) NULL,
    [LugarAfiliacion]               VARCHAR (20)   NULL,
    [RecogeEnSucursal]              BIT            NULL,
    [sucursal_respaldo_id]          INT            NULL,
    [ecommerce_alternativo]         INT            DEFAULT ((0)) NULL,
    CONSTRAINT [PK__cliente_Cliente__41248F15] PRIMARY KEY CLUSTERED ([IDE_SJO] ASC),
    CONSTRAINT [cliente_Pais__cliente_Cliente] FOREIGN KEY ([CodigoPais]) REFERENCES [dbo].[cliente_Pais] ([id]),
    CONSTRAINT [FK33DEB095214F2BA7] FOREIGN KEY ([sucursal_id]) REFERENCES [dbo].[cliente_Sucursal] ([id]),
    CONSTRAINT [FK33DEB09586039ADE] FOREIGN KEY ([apoderado_id]) REFERENCES [dbo].[cliente_Persona] ([id]),
    CONSTRAINT [FK33DEB09593F386AD] FOREIGN KEY ([persona_id]) REFERENCES [dbo].[cliente_Persona] ([id]),
    CONSTRAINT [FK33DEB09597593927] FOREIGN KEY ([zona_id]) REFERENCES [dbo].[cliente_Zona] ([id]),
    CONSTRAINT [FK33DEB095BE83176D] FOREIGN KEY ([direccion_id]) REFERENCES [dbo].[cliente_Direccion] ([id]),
    CONSTRAINT [FK33DEB095E9ABDF4A] FOREIGN KEY ([ConAlianza]) REFERENCES [dbo].[cliente_AlianzaComercial] ([conAlianza])
);


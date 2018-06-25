﻿CREATE TABLE [dbo].[INTEGRA_CLIENTES] (
    [CLN_CODIGO]        INT           NOT NULL,
    [CLN_NOMBRE]        VARCHAR (50)  NULL,
    [CLN_TIPOID]        VARCHAR (1)   NULL,
    [CLN_IDENTIFICADOR] VARCHAR (20)  NULL,
    [CLN_DIRECCION]     VARCHAR (255) NULL,
    [CLN_TELEFONO1]     VARCHAR (20)  NULL,
    [CLN_TELEFONO2]     VARCHAR (20)  NULL,
    [CLN_FAX1]          VARCHAR (20)  NULL,
    [CLN_EMAIL1]        VARCHAR (80)  NULL,
    [CLN_EMAIL2]        VARCHAR (80)  NULL,
    [CLN_CodigoAlfa]    VARCHAR (50)  NOT NULL,
    [CLN_PlazoPago]     INT           NULL
);


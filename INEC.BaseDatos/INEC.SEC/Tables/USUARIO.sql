﻿CREATE TABLE [INEC.SEC].[USUARIO] (
    [ID_USUARIO]                 INT             IDENTITY (1, 1) NOT NULL,
    [NOMBRE_USUARIO]             VARCHAR (100)   NULL,
    [APELLIDO1_USUARIO]          VARCHAR (100)   NULL,
    [APELLIDO2_USUARIO]          VARCHAR (100)   NULL,
    [FECHA_NACIMIENTO_USUARIO]   DATETIME        NULL,
    [CODIGO_USUARIO]             VARCHAR (10)    NULL,
    [FOTO_USUARIO]               VARBINARY (MAX) NULL,
    [CREACION_USUARIO]           VARCHAR (10)    NULL,
    [FECHA_CREACION_USUARIO]     DATETIME        NULL,
    [MODIFICACION_USUARIO]       VARCHAR (10)    NULL,
    [MODIFICACION_FECHA_USUARIO] DATETIME        NULL,
    CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED ([ID_USUARIO] ASC)
);




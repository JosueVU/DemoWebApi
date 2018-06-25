﻿CREATE TABLE [dbo].[cliente_mercadeo_1] (
    [sjo]                 VARCHAR (12)   NULL,
    [sucursal]            VARCHAR (120)  NULL,
    [zona]                VARCHAR (120)  NULL,
    [tipo_cliente]        INT            NULL,
    [nombre]              VARCHAR (120)  NULL,
    [primer_apellido]     VARCHAR (120)  NULL,
    [segundo_apellido]    VARCHAR (120)  NULL,
    [fecha_ingreso]       DATETIME       NULL,
    [estado]              INT            NULL,
    [idioma]              VARCHAR (2)    NULL,
    [persona_id]          INT            NOT NULL,
    [tipo_identificacion] INT            NULL,
    [identificacion]      VARCHAR (90)   NULL,
    [tipo_persona]        VARCHAR (7)    NOT NULL,
    [fecha_nacimiento]    DATETIME       NULL,
    [sexo]                INT            NULL,
    [nacionalidad]        VARCHAR (255)  NULL,
    [estado_civil]        INT            NULL,
    [profesion]           VARCHAR (120)  NULL,
    [pais]                INT            NULL,
    [provincia]           INT            NULL,
    [canton]              INT            NULL,
    [direccion]           VARCHAR (1024) NULL,
    [celular]             VARCHAR (255)  NULL,
    [telefono_1]          VARCHAR (45)   NULL,
    [telefono_2]          VARCHAR (45)   NULL,
    [telefono_3]          VARCHAR (45)   NULL,
    [telefono_4]          VARCHAR (45)   NULL,
    [ttelefono_1]         INT            NULL,
    [ttelefono_2]         INT            NULL,
    [ttelefono_3]         INT            NULL,
    [ttelefono_4]         INT            NULL,
    [email_uno]           VARCHAR (90)   NULL,
    [email_dos]           VARCHAR (90)   NULL,
    [parentezco]          VARCHAR (1)    NOT NULL,
    [tramite_de]          VARCHAR (1)    NOT NULL,
    [departamento]        VARCHAR (1)    NOT NULL,
    [razon_social]        VARCHAR (1)    NOT NULL,
    [nombre_corto]        VARCHAR (1)    NOT NULL,
    [cedula_juridica]     VARCHAR (1)    NOT NULL,
    [comoConocioJetbox]   VARCHAR (40)   NULL,
    [codigoPromo]         VARCHAR (30)   NULL,
    [conAlianza]          INT            NULL,
    [nomAlianza]          VARCHAR (60)   NULL
);


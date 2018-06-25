CREATE TABLE [dbo].[seguridad_Configuracion] (
    [id]                               INT          NOT NULL,
    [cantidadDiasEntreCambioDeClave]   INT          NOT NULL,
    [cantidadDiasInactividadPermitido] INT          NOT NULL,
    [largoMaximoClave]                 INT          NOT NULL,
    [largoMinimoClave]                 INT          NOT NULL,
    [clientTimeOut]                    INT          NOT NULL,
    [serverTimeOut]                    INT          NOT NULL,
    [servidorEmail]                    VARCHAR (90) NULL,
    [userEmail]                        VARCHAR (90) NULL,
    [claveEmail]                       VARCHAR (90) NULL,
    [aplicacion_id]                    INT          NULL,
    [cantidadIntentosPassword]         INT          DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


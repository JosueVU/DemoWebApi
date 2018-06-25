CREATE TABLE [dbo].[seguridad_Usuario] (
    [usuario]                VARCHAR (45)  NOT NULL,
    [CodigoPais]             INT           NULL,
    [profile_id]             INT           NOT NULL,
    [estadoUsuario]          INT           NOT NULL,
    [flags]                  INT           NOT NULL,
    [nombre]                 VARCHAR (90)  NOT NULL,
    [identificacion]         VARCHAR (255) NOT NULL,
    [departamento]           VARCHAR (90)  NOT NULL,
    [telefono]               VARCHAR (45)  NOT NULL,
    [tipoTelefono]           INT           NULL,
    [email]                  VARCHAR (255) NOT NULL,
    [token]                  VARCHAR (255) NULL,
    [password]               VARCHAR (255) NOT NULL,
    [fechaCaducidadPassword] DATETIME      NULL,
    [fechaUltimoAcceso]      DATETIME      NULL,
    [fechaUltimoCambioClave] DATETIME      NULL,
    CONSTRAINT [PK__seguridad_Usuari__7C4554E3] PRIMARY KEY CLUSTERED ([usuario] ASC)
);


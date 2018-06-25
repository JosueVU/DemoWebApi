CREATE TABLE [dbo].[seguridad_UsuarioPhoto] (
    [usuario] VARCHAR (45) NOT NULL,
    [photo]   IMAGE        NULL,
    PRIMARY KEY CLUSTERED ([usuario] ASC)
);


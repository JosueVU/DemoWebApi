CREATE TABLE [dbo].[seguridad_Profile] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [CodigoPais]  INT            CONSTRAINT [DF__seguridad__Codig__023EF0B2] DEFAULT ((188)) NULL,
    [descripcion] VARCHAR (255)  NULL,
    [data]        VARCHAR (2048) NULL,
    [sucursales]  VARCHAR (2048) NULL,
    CONSTRAINT [PK__seguridad_Profil__7A5D0C71] PRIMARY KEY CLUSTERED ([id] ASC)
);


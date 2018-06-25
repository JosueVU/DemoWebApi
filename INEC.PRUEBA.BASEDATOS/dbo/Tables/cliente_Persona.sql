CREATE TABLE [dbo].[cliente_Persona] (
    [id]                 INT           IDENTITY (1, 1) NOT NULL,
    [nombre]             VARCHAR (120) NULL,
    [identificacion]     VARCHAR (90)  NULL,
    [tipoIdentificacion] INT           NULL,
    [primerApellido]     VARCHAR (120) NULL,
    [segundoApellido]    VARCHAR (120) NULL,
    [fechaNacimiento]    DATETIME      NULL,
    [estadoCivil]        INT           NULL,
    [sexo]               INT           NULL,
    [direccion_id]       NUMERIC (19)  NULL,
    [profesion_id]       INT           NULL,
    [nacionalidad_id]    INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKD822FA471E0DE541] FOREIGN KEY ([nacionalidad_id]) REFERENCES [dbo].[cliente_Pais] ([id]),
    CONSTRAINT [FKD822FA4729B4ADCD] FOREIGN KEY ([profesion_id]) REFERENCES [dbo].[cliente_Profesion] ([id]),
    CONSTRAINT [FKD822FA47BE83176D] FOREIGN KEY ([direccion_id]) REFERENCES [dbo].[cliente_Direccion] ([id])
);


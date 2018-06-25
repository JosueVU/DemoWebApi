CREATE TABLE [dbo].[cliente_Contacto] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [departamento]    VARCHAR (90)  NULL,
    [puesto]          VARCHAR (120) NULL,
    [nota]            VARCHAR (220) NULL,
    [persona_id]      INT           NOT NULL,
    [cliente_IDE_SJO] VARCHAR (12)  NULL,
    [CodigoPais]      INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKEFFF891493F386AD] FOREIGN KEY ([persona_id]) REFERENCES [dbo].[cliente_Persona] ([id]),
    CONSTRAINT [FKEFFF8914C75F7B0B] FOREIGN KEY ([cliente_IDE_SJO]) REFERENCES [dbo].[cliente_Cliente] ([IDE_SJO])
);


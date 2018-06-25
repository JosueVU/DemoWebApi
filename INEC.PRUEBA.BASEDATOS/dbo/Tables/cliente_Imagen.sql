CREATE TABLE [dbo].[cliente_Imagen] (
    [id]              NUMERIC (19)  IDENTITY (1, 1) NOT NULL,
    [nota]            VARCHAR (255) NULL,
    [tipo]            INT           NULL,
    [image]           IMAGE         NULL,
    [cliente_IDE_SJO] VARCHAR (12)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK24BA1878C75F7B0B] FOREIGN KEY ([cliente_IDE_SJO]) REFERENCES [dbo].[cliente_Cliente] ([IDE_SJO])
);


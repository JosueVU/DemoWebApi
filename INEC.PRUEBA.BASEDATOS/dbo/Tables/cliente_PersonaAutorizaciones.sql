﻿CREATE TABLE [dbo].[cliente_PersonaAutorizaciones] (
    [COD_PERSONA]      INT NOT NULL,
    [COD_AUTORIZACION] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([COD_PERSONA] ASC, [COD_AUTORIZACION] ASC),
    CONSTRAINT [FK6157D267304C19CC] FOREIGN KEY ([COD_AUTORIZACION]) REFERENCES [dbo].[cliente_Autorizaciones] ([IDE_CODIGO]),
    CONSTRAINT [FK6157D2673A9E1404] FOREIGN KEY ([COD_PERSONA]) REFERENCES [dbo].[cliente_Persona] ([id])
);


CREATE TABLE [dbo].[cliente_Reporte] (
    [id]         INT            IDENTITY (1, 1) NOT NULL,
    [CodigoPais] INT            CONSTRAINT [DF__cliente_R__Codig__1645E95F] DEFAULT ((188)) NULL,
    [tipo]       VARCHAR (10)   NOT NULL,
    [nombre]     VARCHAR (120)  NOT NULL,
    [contenido]  VARCHAR (4086) NULL,
    CONSTRAINT [PK__cliente___3213E83FD47308AE] PRIMARY KEY CLUSTERED ([id] ASC)
);


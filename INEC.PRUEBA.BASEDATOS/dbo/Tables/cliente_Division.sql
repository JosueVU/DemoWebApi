CREATE TABLE [dbo].[cliente_Division] (
    [ConDivision] INT           CONSTRAINT [DF__cliente_D__ConDi__086BFFFD] DEFAULT ((0)) NULL,
    [CodigoPais]  INT           NULL,
    [pais_id]     INT           NOT NULL,
    [division_id] INT           NOT NULL,
    [nombre]      VARCHAR (120) NOT NULL,
    CONSTRAINT [PK__cliente_Division__48C5B0DD] PRIMARY KEY CLUSTERED ([division_id] ASC, [pais_id] ASC),
    CONSTRAINT [FK278F59726E340847] FOREIGN KEY ([pais_id]) REFERENCES [dbo].[cliente_Pais] ([id]),
    CONSTRAINT [cliente_Division_ix1] UNIQUE NONCLUSTERED ([pais_id] ASC, [division_id] ASC)
);


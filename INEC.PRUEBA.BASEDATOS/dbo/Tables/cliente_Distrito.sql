CREATE TABLE [dbo].[cliente_Distrito] (
    [ConDistrito]    INT           IDENTITY (1, 1) NOT NULL,
    [ConSubDivision] INT           NOT NULL,
    [nombre]         VARCHAR (120) NULL,
    PRIMARY KEY CLUSTERED ([ConDistrito] ASC)
);


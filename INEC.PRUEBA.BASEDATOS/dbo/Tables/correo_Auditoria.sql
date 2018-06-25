CREATE TABLE [dbo].[correo_Auditoria] (
    [ConAuditoria] NUMERIC (19)   IDENTITY (1, 1) NOT NULL,
    [Cliente]      VARCHAR (12)   NULL,
    [DireccionIP]  VARCHAR (70)   NULL,
    [Duracion]     INT            NOT NULL,
    [Fecha]        DATETIME       NOT NULL,
    [JsonData]     VARCHAR (4096) NULL,
    [Origen]       VARCHAR (250)  NULL,
    [Usuario]      VARCHAR (45)   NULL,
    [CodigoPais]   INT            NULL,
    PRIMARY KEY CLUSTERED ([ConAuditoria] ASC)
);


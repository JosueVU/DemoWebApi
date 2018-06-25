CREATE TABLE [dbo].[menu_MenuItem] (
    [ConMenuItem]      INT          IDENTITY (1, 1) NOT NULL,
    [ConMenuItemPadre] INT          NULL,
    [DescMenuItem]     VARCHAR (90) NULL,
    [CodigoMenu]       VARCHAR (32) NULL,
    PRIMARY KEY CLUSTERED ([ConMenuItem] ASC)
);



CREATE PROCEDURE [dbo].[comparaTarjeta] @idesjo varchar(12)
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Compara Tarjetas para: ' + @idesjo;

    SELECT
        IDE_SJO,
        COD_BANCO,
        DSC_INFO
    FROM clientes.dbo.cliente_Tarjeta
    WHERE IDE_SJO = @idesjo;

    SELECT
        IDE_SJO,
        COD_BANCO,
        DSC_INFO
    FROM ClientesWeb.dbo.cliente_Tarjeta
    WHERE IDE_SJO = @idesjo;
  END


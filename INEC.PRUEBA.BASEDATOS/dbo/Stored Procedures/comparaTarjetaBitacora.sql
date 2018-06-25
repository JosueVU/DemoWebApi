
CREATE PROCEDURE [dbo].[comparaTarjetaBitacora] @idesjo varchar(12)
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Compara Tarjetas Bitacoras para: ' + @idesjo;

    SELECT
        IDE_SJO,
        FEC_BITACORA,
        COD_OPERACION,
        COD_USER,
        DSC_INFO
    FROM clientes.dbo.cliente_TarjetaBitacora
    WHERE IDE_SJO = @idesjo;

    SELECT
        IDE_SJO,
        FEC_BITACORA,
        COD_OPERACION,
        COD_USER,
        DSC_INFO
    FROM ClientesWeb.dbo.cliente_TarjetaBitacora
    WHERE IDE_SJO = @idesjo;
  END


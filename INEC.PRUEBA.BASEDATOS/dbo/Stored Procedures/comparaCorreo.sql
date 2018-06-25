
CREATE PROCEDURE [dbo].[comparaCorreo] @idesjo varchar(12)
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Compara Correo para: ' + @idesjo;

    DECLARE @numEjecutivo int,
            @webNumEjecutivo int;

    SELECT
        COD_TIPO_CONTRATO,
        LOG_TARJETA_CREDITO,
        LOG_CARGO_MENSAJERIA,
        LOG_RECIBIDO_CONFORME,
        NUM_EJECUTIVO,
        COD_CONTRATO_ECONOMY
    FROM clientes.dbo.correo_ClienteCorreo
    WHERE IDE_SJO = @idesjo;

    SELECT
        COD_TIPO_CONTRATO,
        LOG_TARJETA_CREDITO,
        LOG_CARGO_MENSAJERIA,
        LOG_RECIBIDO_CONFORME,
        NUM_EJECUTIVO,
        COD_CONTRATO_ECONOMY
    FROM ClientesWeb.dbo.correo_ClienteCorreo
    WHERE IDE_SJO = @idesjo;

    SELECT
        @numEjecutivo = NUM_EJECUTIVO
    FROM clientes.dbo.correo_ClienteCorreo
    WHERE IDE_SJO = @idesjo;

    SELECT
        @webNumEjecutivo = NUM_EJECUTIVO
    FROM ClientesWeb.dbo.correo_ClienteCorreo
    WHERE IDE_SJO = @idesjo;

    EXEC comparaEjecutivo @numEjecutivo,
                            @webNumEjecutivo;
  END


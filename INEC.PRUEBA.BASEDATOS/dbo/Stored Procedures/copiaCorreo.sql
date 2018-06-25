
CREATE PROCEDURE [dbo].[copiaCorreo] @idesjo varchar(12)
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Correo para: ' + @idesjo;

    DECLARE @COD_TIPO_CONTRATO int,
            @LOG_TARJETA_CREDITO tinyint,
            @LOG_CARGO_MENSAJERIA tinyint,
            @LOG_RECIBIDO_CONFORME tinyint,
            @numEjecutivo int,
            @outNumEjecutivo int,
            @COD_CONTRATO_ECONOMY int;
    SELECT
        @COD_TIPO_CONTRATO = COD_TIPO_CONTRATO,
        @LOG_TARJETA_CREDITO = LOG_TARJETA_CREDITO,
        @LOG_CARGO_MENSAJERIA = LOG_CARGO_MENSAJERIA,
        @LOG_RECIBIDO_CONFORME = LOG_RECIBIDO_CONFORME,
        @numEjecutivo = NUM_EJECUTIVO,
        @COD_CONTRATO_ECONOMY = COD_CONTRATO_ECONOMY
    FROM clientes.dbo.correo_ClienteCorreo
    WHERE IDE_SJO = @idesjo;

    IF @@ROWCOUNT > 0
      BEGIN
        SELECT
            @outNumEjecutivo = NUM_EJECUTIVO
        FROM ClientesWeb.dbo.correo_ClienteCorreo
        WHERE IDE_SJO = @idesjo;

        IF @numEjecutivo IS NOT NULL
          BEGIN
            EXEC copiaEjecutivo @numEjecutivo,
                                @outNumEjecutivo OUTPUT;
          END

        SELECT
          IDE_SJO
        FROM ClientesWeb.dbo.correo_ClienteCorreo
        WHERE IDE_SJO = @idesjo;
        IF @@ROWCOUNT > 0
          BEGIN
            PRINT 'Actualizando Correo para Cliente: ' + CONVERT(varchar, @idesjo);
            UPDATE ClientesWeb.dbo.correo_ClienteCorreo
            SET COD_TIPO_CONTRATO = @COD_TIPO_CONTRATO,
              LOG_TARJETA_CREDITO = @LOG_TARJETA_CREDITO,
              LOG_CARGO_MENSAJERIA = @LOG_CARGO_MENSAJERIA,
              LOG_RECIBIDO_CONFORME = @LOG_RECIBIDO_CONFORME,
              NUM_EJECUTIVO = @outNumEjecutivo,
              COD_CONTRATO_ECONOMY = @COD_CONTRATO_ECONOMY
            WHERE IDE_SJO = @idesjo;
          END
        ELSE
          BEGIN
            INSERT INTO ClientesWeb.dbo.correo_ClienteCorreo (IDE_SJO, COD_TIPO_CONTRATO, LOG_TARJETA_CREDITO, LOG_CARGO_MENSAJERIA, LOG_RECIBIDO_CONFORME, NUM_EJECUTIVO, COD_CONTRATO_ECONOMY)
            VALUES (@idesjo, @COD_TIPO_CONTRATO, @LOG_TARJETA_CREDITO, @LOG_CARGO_MENSAJERIA, @LOG_RECIBIDO_CONFORME, @outNumEjecutivo, @COD_CONTRATO_ECONOMY);
            PRINT 'Nuevo Correo para Cliente: ' + CONVERT(varchar, @idesjo);
          END
      END
  END


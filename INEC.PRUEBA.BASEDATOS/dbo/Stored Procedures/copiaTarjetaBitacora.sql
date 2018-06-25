
CREATE PROCEDURE [dbo].[copiaTarjetaBitacora] @idesjo varchar(12),
                                              @tarjetaBitacoraId int,
                                              @outTarjetaBitacoraId int OUTPUT
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @FEC_BITACORA datetime,
            @COD_OPERACION int,
            @COD_USER varchar(45),
            @DSC_INFO varchar(1024)
    SELECT
        @FEC_BITACORA = FEC_BITACORA,
        @COD_OPERACION = COD_OPERACION,
        @COD_USER = COD_USER,
        @DSC_INFO = DSC_INFO
    FROM clientes.dbo.cliente_TarjetaBitacora
    WHERE IDE_TARJETA_BITACORA = @tarjetaBitacoraId;

    IF @outTarjetaBitacoraId IS NOT NULL
      BEGIN
        PRINT 'Actualizando Tarjeta Bitacora: ' + CONVERT(varchar, @outTarjetaBitacoraId);
        UPDATE ClientesWeb.dbo.cliente_TarjetaBitacora
        SET FEC_BITACORA = @FEC_BITACORA,
          COD_OPERACION = @COD_OPERACION,
          DSC_INFO = @DSC_INFO--, COD_USER = @COD_USER
        WHERE IDE_TARJETA_BITACORA = @outTarjetaBitacoraId;
      END
    ELSE
      BEGIN
        INSERT INTO ClientesWeb.dbo.cliente_TarjetaBitacora (FEC_BITACORA, COD_OPERACION, IDE_SJO, COD_USER, DSC_INFO)
        VALUES (@FEC_BITACORA, @COD_OPERACION, @idesjo, @COD_USER, @DSC_INFO);
        SET @outTarjetaBitacoraId = @@IDENTITY;
        PRINT 'Nueva Tarjeta Bitacora: ' + CONVERT(varchar, @outTarjetaBitacoraId);
      END
  END


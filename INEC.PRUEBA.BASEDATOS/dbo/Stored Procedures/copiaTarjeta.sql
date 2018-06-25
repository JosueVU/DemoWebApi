
CREATE PROCEDURE [dbo].[copiaTarjeta] @idesjo varchar(12),
                                      @tarjetaId int,
                                      @outTarjetaId int OUTPUT
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @COD_BANCO int,
            @DSC_INFO varchar(120);
    SELECT
        @COD_BANCO = COD_BANCO,
        @DSC_INFO = DSC_INFO
    FROM clientes.dbo.cliente_Tarjeta
    WHERE IDE_TARJETA = @tarjetaId;

    IF @outTarjetaId IS NOT NULL
      BEGIN
        PRINT 'Actualizando Tarjeta: ' + CONVERT(varchar, @outTarjetaId);
        UPDATE ClientesWeb.dbo.cliente_Tarjeta
        SET COD_BANCO = @COD_BANCO,
          DSC_INFO = @DSC_INFO
        WHERE IDE_TARJETA = @outTarjetaId;
      END
    ELSE
      BEGIN
        INSERT INTO ClientesWeb.dbo.cliente_Tarjeta (COD_BANCO, IDE_SJO, DSC_INFO)
        VALUES (@COD_BANCO, @idesjo, @DSC_INFO);
        SET @outTarjetaId = @@IDENTITY;
        PRINT 'Nueva Tarjeta: ' + CONVERT(varchar, @outTarjetaId);
      END
  END


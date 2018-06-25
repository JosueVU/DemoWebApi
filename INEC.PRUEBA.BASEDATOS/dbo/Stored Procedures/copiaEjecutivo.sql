
CREATE PROCEDURE [dbo].[copiaEjecutivo] @numEjecutivo int,
                                        @outNumEjecutivo int OUTPUT
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @NUM_EJECUTIVO int,
            @COD_PERSONA int,
            @COD_EMPRESA int,
            @personaId int;
    SELECT
        @COD_PERSONA = COD_PERSONA,
        @COD_EMPRESA = COD_EMPRESA
    FROM clientes.dbo.correo_Ejecutivo
    WHERE NUM_EJECUTIVO = @numEjecutivo;

    SELECT
        @personaId = id
    FROM ClientesWeb.dbo.cliente_Persona
    WHERE id = @COD_PERSONA;

    -- Persona
    IF @COD_PERSONA IS NOT NULL
      BEGIN
        EXEC copiaPersona @COD_PERSONA,
                          @personaId OUTPUT;
      END

    IF @outNumEjecutivo IS NOT NULL
      BEGIN
        PRINT 'Actualizando Ejecutivo: ' + CONVERT(varchar, @outNumEjecutivo);
        UPDATE ClientesWeb.dbo.correo_Ejecutivo
        SET COD_PERSONA = @personaId,
          COD_EMPRESA = @COD_EMPRESA
        WHERE NUM_EJECUTIVO = @outNumEjecutivo;
      END
    ELSE
      BEGIN
        SELECT
            @outNumEjecutivo = NUM_EJECUTIVO
        FROM ClientesWeb.dbo.correo_Ejecutivo
        WHERE NUM_EJECUTIVO = @numEjecutivo;

        IF @outNumEjecutivo IS NOT NULL
          BEGIN
            PRINT 'Actualizando Ejecutivo: ' + CONVERT(varchar, @outNumEjecutivo);
            UPDATE ClientesWeb.dbo.correo_Ejecutivo
            SET COD_PERSONA = @personaId,
              COD_EMPRESA = @COD_EMPRESA
            WHERE NUM_EJECUTIVO = @outNumEjecutivo;
          END
        ELSE
          BEGIN
            INSERT INTO ClientesWeb.dbo.correo_Ejecutivo (NUM_EJECUTIVO, COD_PERSONA, COD_EMPRESA)
            VALUES (@numEjecutivo, @personaId, @COD_EMPRESA);
            SET @outNumEjecutivo = @numEjecutivo;
            PRINT 'Nuevo Ejecutivo: ' + CONVERT(varchar, @outNumEjecutivo);
          END
      END
  END


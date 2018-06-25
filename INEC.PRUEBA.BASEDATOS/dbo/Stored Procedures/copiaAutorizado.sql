
CREATE PROCEDURE [dbo].[copiaAutorizado] @ideCodigo int,
                                         @outIdeCodigo int OUTPUT
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @COD_PERSONA int,
            @TIP_AUTORIZADO int,
            @TIP_RELACION int,
            @DireccionDefault bit,
            @idesjo varchar(12),
            @personaId int;
    SELECT
        @idesjo = IDE_SJO,
        @COD_PERSONA = COD_PERSONA,
        @TIP_AUTORIZADO = TIP_AUTORIZADO,
        @TIP_RELACION = TIP_RELACION,
        @DireccionDefault = DireccionDefault
    FROM clientes.dbo.correo_Autorizado
    WHERE IDE_CODIGO = @ideCodigo;

    SELECT
        @personaId = COD_PERSONA
    FROM ClientesWeb.dbo.correo_Autorizado
    WHERE COD_PERSONA = @COD_PERSONA;

    -- Persona
    IF @COD_PERSONA IS NOT NULL
      BEGIN
        EXEC copiaPersona @COD_PERSONA,
                          @personaId OUTPUT;
      END

    IF @outIdeCodigo IS NOT NULL
      BEGIN
        PRINT 'Actualizando Autorizado: ' + CONVERT(varchar, @outIdeCodigo);
        UPDATE ClientesWeb.dbo.correo_Autorizado
        SET TIP_AUTORIZADO = @TIP_AUTORIZADO,
          TIP_RELACION = @TIP_RELACION,
          COD_PERSONA = @personaId,
          DireccionDefault = @DireccionDefault
        WHERE IDE_CODIGO = @outIdeCodigo;
      END
    ELSE
      BEGIN
        INSERT INTO ClientesWeb.dbo.correo_Autorizado (TIP_AUTORIZADO, TIP_RELACION, COD_PERSONA, IDE_SJO, DireccionDefault)
        VALUES (@TIP_AUTORIZADO, @TIP_RELACION, @personaId, @idesjo, @DireccionDefault);
        SET @outIdeCodigo = @@IDENTITY;
        PRINT 'Nuevo Autorizado: ' + CONVERT(varchar, @outIdeCodigo);
      END
  END



CREATE PROCEDURE [dbo].[comparaAutorizado] @ideCodigo int,
                                         @webIdeCodigo int
AS
  BEGIN
    SET NOCOUNT ON;

    IF @webIdeCodigo IS NULL
      BEGIN
        SET @webIdeCodigo = @ideCodigo;
      END

    PRINT 'Compara Autorizado: ' + convert(varchar, @ideCodigo) + ' / ' + convert(varchar, isNull(@webIdeCodigo, 0));

    DECLARE @personaId int,
            @webPersonaId int;

    SELECT IDE_CODIGO, TIP_AUTORIZADO, TIP_RELACION, COD_PERSONA, IDE_SJO, DireccionDefault
    FROM clientes.dbo.correo_Autorizado
    WHERE IDE_CODIGO = @ideCodigo;

    SELECT IDE_CODIGO, TIP_AUTORIZADO, TIP_RELACION, COD_PERSONA, IDE_SJO, DireccionDefault
    FROM ClientesWeb.dbo.correo_Autorizado
    WHERE IDE_CODIGO = @webIdeCodigo;

    SELECT @personaId = COD_PERSONA
    FROM clientes.dbo.correo_Autorizado
    WHERE IDE_CODIGO = @ideCodigo;

    SELECT @webPersonaId = COD_PERSONA
    FROM ClientesWeb.dbo.correo_Autorizado
    WHERE IDE_CODIGO = @webIdeCodigo;

    -- Persona
    EXEC comparaPersona @personaId, @webPersonaId;
  END


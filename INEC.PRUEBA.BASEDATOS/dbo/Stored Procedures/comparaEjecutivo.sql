
CREATE PROCEDURE [dbo].[comparaEjecutivo] @numEjecutivo int,
                                        @webNumEjecutivo int
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Compara Ejecutivo: ' + convert(varchar, @numEjecutivo) + ' / ' + convert(varchar, isNull(@webNumEjecutivo, 0));

    DECLARE @personaId int,
            @webPersonaId int;

    SELECT
        NUM_EJECUTIVO,
        COD_PERSONA,
        COD_EMPRESA
    FROM clientes.dbo.correo_Ejecutivo
    WHERE NUM_EJECUTIVO = @numEjecutivo;

    SELECT
        NUM_EJECUTIVO,
        COD_PERSONA,
        COD_EMPRESA
    FROM ClientesWeb.dbo.correo_Ejecutivo
    WHERE NUM_EJECUTIVO = @webNumEjecutivo;

    SELECT
        @personaId = COD_PERSONA
    FROM clientes.dbo.correo_Ejecutivo
    WHERE NUM_EJECUTIVO = @numEjecutivo;

    SELECT
        @webPersonaId = COD_PERSONA
    FROM ClientesWeb.dbo.correo_Ejecutivo
    WHERE NUM_EJECUTIVO = @webNumEjecutivo;

    -- Persona
    EXEC comparaPersona @personaId,
                          @webPersonaId;
  END


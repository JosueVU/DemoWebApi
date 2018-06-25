
CREATE PROCEDURE [dbo].[comparaPersona] @personaId int,
                                      @webPersonaId int
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Compara Persona: ' + CONVERT(varchar, @personaId) + ' / ' + CONVERT(varchar, isnull(@webPersonaId, 0));

    DECLARE @direccionId numeric,
            @webDireccionId numeric;

    SELECT id, nombre, identificacion, tipoIdentificacion, primerApellido, segundoApellido, fechaNacimiento, estadoCivil, sexo, direccion_id, profesion_id, nacionalidad_id
    FROM clientes.dbo.cliente_Persona
    WHERE id = @personaId;

    SELECT id, nombre, identificacion, tipoIdentificacion, primerApellido, segundoApellido, fechaNacimiento, estadoCivil, sexo, direccion_id, profesion_id, nacionalidad_id
    FROM ClientesWeb.dbo.cliente_Persona
    WHERE id = @webPersonaId;

    SELECT @direccionId = direccion_id
    FROM clientes.dbo.cliente_Persona
    WHERE id = @personaId;

    SELECT @webDireccionId = direccion_id
    FROM ClientesWeb.dbo.cliente_Persona
    WHERE id = @webPersonaId;

    EXEC comparaDireccion @direccionId,
                          @webDireccionId;

    PRINT 'Compara Autorizaciones de Persona: ' + CONVERT(varchar, @personaId) + ' / ' + CONVERT(varchar, isnull(@webPersonaId, 0));

    SELECT COD_PERSONA, COD_AUTORIZACION
    FROM clientes.dbo.cliente_PersonaAutorizaciones
    WHERE COD_PERSONA = @personaId;

    SELECT COD_PERSONA, COD_AUTORIZACION
    FROM ClientesWeb.dbo.cliente_PersonaAutorizaciones
    WHERE COD_PERSONA = @webPersonaId;

    PRINT 'Compara Preferencias de Persona: ' + CONVERT(varchar, @personaId) + ' / ' + CONVERT(varchar, isnull(@webPersonaId, 0));

    SELECT COD_PERSONA, COD_PREFERENCIA
    FROM clientes.dbo.cliente_PersonaPreferencias
    WHERE COD_PERSONA = @personaId;

    SELECT COD_PERSONA, COD_PREFERENCIA
    FROM ClientesWeb.dbo.cliente_PersonaPreferencias
    WHERE COD_PERSONA = @webPersonaId;
  END


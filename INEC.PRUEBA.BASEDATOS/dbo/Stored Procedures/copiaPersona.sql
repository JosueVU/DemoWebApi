
CREATE PROCEDURE [dbo].[copiaPersona] @personaId int,
                                     @direccionClienteId int = NULL OUTPUT,
                                     @outPersonaId int = NULL OUTPUT
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @nombre varchar(120),
            @identificacion varchar(90),
            @tipoIdentificacion int,
            @primerApellido varchar(120),
            @segundoApellido varchar(120),
            @fechaNacimiento datetime,
            @estadoCivil int,
            @sexo int,
            @direccion_id numeric,
            @direccionId numeric,
            @profesion_id int,
            @nacionalidad_id int;
    SELECT
        @nombre = nombre,
        @identificacion = identificacion,
        @tipoIdentificacion = tipoIdentificacion,
        @primerApellido = primerApellido,
        @segundoApellido = segundoApellido,
        @fechaNacimiento = fechaNacimiento,
        @estadoCivil = estadoCivil,
        @sexo = sexo,
        @direccion_id = direccion_id,
        @profesion_id = profesion_id,
        @nacionalidad_id = nacionalidad_id
    FROM clientes.dbo.cliente_Persona
    WHERE id = @personaId;

    SELECT
        @direccionId = COALESCE(@direccionClienteId, direccion_id) -- SI @direccionClienteId no es NULL tomamos ese valor
    FROM ClientesWeb.dbo.cliente_Persona
    WHERE id = @personaId;

    IF @direccion_id IS NOT NULL
      BEGIN
        EXEC copiaDireccion @direccion_id,
                            @direccionId OUTPUT;
      END

    IF @outPersonaId IS NOT NULL
      BEGIN
        PRINT 'Actualizando Persona: ' + CONVERT(varchar, @outPersonaId);
        UPDATE ClientesWeb.dbo.cliente_Persona
        SET nombre = @nombre,
          identificacion = @identificacion,
          tipoIdentificacion = @tipoIdentificacion,
          primerApellido = @primerApellido,
          segundoApellido = @segundoApellido,
          fechaNacimiento = @fechaNacimiento,
          estadoCivil = @estadoCivil,
          sexo = @sexo,
          direccion_id = @direccionId,
          profesion_id = @profesion_id,
          nacionalidad_id = nacionalidad_id
        WHERE id = @outPersonaId;
      END
    ELSE
      BEGIN
        INSERT INTO ClientesWeb.dbo.cliente_Persona (nombre, identificacion, tipoIdentificacion, primerApellido, segundoApellido, fechaNacimiento, estadoCivil, sexo, direccion_id, profesion_id, nacionalidad_id)
        VALUES (@nombre, @identificacion, @tipoIdentificacion, @primerApellido, @segundoApellido, @fechaNacimiento, @estadoCivil, @sexo, @direccionId, @profesion_id, @nacionalidad_id);
        SET @outPersonaId = @@IDENTITY;
        PRINT 'Nueva Persona: ' + CONVERT(varchar, @outPersonaId);
      END

    PRINT 'Autorizaciones de Persona: ' + CONVERT(varchar, @personaId);

    DELETE FROM ClientesWeb.dbo.cliente_PersonaAutorizaciones
    WHERE COD_PERSONA = @outPersonaId;
    INSERT INTO ClientesWeb.dbo.cliente_PersonaAutorizaciones (COD_PERSONA, COD_AUTORIZACION)
      SELECT
        @outPersonaId,
        COD_AUTORIZACION
      FROM clientes.dbo.cliente_PersonaAutorizaciones
      WHERE COD_PERSONA = @personaId;

    PRINT 'Preferencias de Persona: ' + CONVERT(varchar, @personaId);

    DELETE FROM ClientesWeb.dbo.cliente_PersonaPreferencias
    WHERE COD_PERSONA = @outPersonaId;
    INSERT INTO ClientesWeb.dbo.cliente_PersonaPreferencias (COD_PERSONA, COD_PREFERENCIA)
      SELECT
        @outPersonaId,
        COD_PREFERENCIA
      FROM clientes.dbo.cliente_PersonaPreferencias
      WHERE COD_PERSONA = @personaId;
  END


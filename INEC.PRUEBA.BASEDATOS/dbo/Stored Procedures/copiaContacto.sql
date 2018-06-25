
CREATE PROCEDURE [dbo].[copiaContacto] @contactoId int,
                                       @outContactoId int OUTPUT
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @departamento varchar(90),
            @puesto varchar(120),
            @nota varchar(220),
            @persona_id int,
            @personaId int,
            @idesjo varchar(12);
    SELECT
        @departamento = departamento,
        @puesto = puesto,
        @nota = nota,
        @persona_id = persona_id,
        @idesjo = cliente_IDE_SJO
    FROM clientes.dbo.cliente_Contacto
    WHERE id = @contactoId;

    SELECT
        @personaId = persona_id
    FROM ClientesWeb.dbo.cliente_Contacto
    WHERE persona_id = @persona_id;

    IF @persona_id IS NOT NULL
      BEGIN
        EXEC copiaPersona @persona_id,
                          @personaId OUTPUT;
      END

    IF @outContactoId IS NOT NULL
      BEGIN
        PRINT 'Actualizando Contacto: ' + CONVERT(varchar, @outContactoId);
        UPDATE ClientesWeb.dbo.cliente_Contacto
        SET departamento = @departamento,
          puesto = @puesto,
          nota = @nota,
          persona_id = @personaId
        WHERE id = @outContactoId;
      END
    ELSE
      BEGIN
        INSERT INTO ClientesWeb.dbo.cliente_Contacto (departamento, puesto, nota, persona_id, cliente_IDE_SJO)
        VALUES (@departamento, @puesto, @nota, @personaId, @idesjo);
        SET @outContactoId = @@IDENTITY;
        PRINT 'Nuevo Contacto: ' + CONVERT(varchar, @outContactoId);
      END
  END


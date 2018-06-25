
CREATE PROCEDURE [dbo].[comparaContacto] @contactoId int,
                                       @webContactoId int
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Compara Contacto: ' + convert(varchar, @contactoId) + ' / ' + convert(varchar, isNull(@webContactoId, 0));

    DECLARE @personaId int,
            @webPersonaId varchar(12);

    SELECT id, departamento, puesto, nota, persona_id, cliente_IDE_SJO
    FROM clientes.dbo.cliente_Contacto
    WHERE id = @contactoId;

    SELECT id, departamento, puesto, nota, persona_id, cliente_IDE_SJO
    FROM ClientesWeb.dbo.cliente_Contacto
    WHERE id = @webContactoId;

    SELECT @personaId = persona_id
    FROM clientes.dbo.cliente_Contacto
    WHERE id = @contactoId;

    SELECT @webPersonaId = persona_id
    FROM ClientesWeb.dbo.cliente_Contacto
    WHERE id = @webContactoId;

    EXEC comparaPersona @personaId,
                          @webPersonaId;
  END


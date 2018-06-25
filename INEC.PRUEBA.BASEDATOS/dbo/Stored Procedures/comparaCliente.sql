
CREATE PROCEDURE [dbo].[comparaCliente] @idesjo varchar(12)
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT ''
    PRINT 'Compara Cliente: ' + @idesjo;

    DECLARE @persona_id int,
            @apoderado_id int,
            @direccion_id int,
            @personaId int,
            @apoderadoId int,
            @direccionId int;
    SELECT
        @persona_id = persona_id,
        @apoderado_id = apoderado_id,
        @direccion_id = direccion_id
    FROM clientes.dbo.cliente_Cliente
    WHERE IDE_SJO = @idesjo;

    SELECT
        @personaId = persona_id,
        @apoderadoId = apoderado_id,
        @direccionId = direccion_id
    FROM ClientesWeb.dbo.cliente_Cliente
    WHERE IDE_SJO = @idesjo;

    SELECT
        nombre,
        tipoCliente,
        idioma,
        nombreCorto,
        estadoCliente,
        fechaIngreso,
        cedulaJuridica,
        historialZona,
        observaciones,
        claveWeb,
        fechaUltimaGeneracionClaveWeb,
        flags,
        sucursal_id,
        zona_id,
        @personaId,
        @direccionId,
        @apoderadoId,
        IDE_SJO_HQS,
        forma_de_afiliacion,
        claveWeb_temp,
        IND_COBRAR_MENSAJERIA,
        IND_COBRAR_GUIA,
        comoConocioJetbox,
        codigoPromo,
        ConAlianza,
        recomiendaCuenta,
        recomiendaCuentaFecha,
        recomiendaCuentaUsuario,
        sync_admin,
        sync_exactus,
        sync_rj,
        sync_jbc,
        AlianzaFechaDatos,
        AlianzaUsuario,
        EsCuentaGerencia,
        ConfeccionWH,
        direccion1_id,
        direccion2_id,
        sync
    FROM clientes.dbo.cliente_Cliente
    WHERE IDE_SJO = @idesjo;

    SELECT
        nombre,
        tipoCliente,
        idioma,
        nombreCorto,
        estadoCliente,
        fechaIngreso,
        cedulaJuridica,
        historialZona,
        observaciones,
        claveWeb,
        fechaUltimaGeneracionClaveWeb,
        flags,
        sucursal_id,
        zona_id,
        @personaId,
        @direccionId,
        @apoderadoId,
        IDE_SJO_HQS,
        forma_de_afiliacion,
        claveWeb_temp,
        IND_COBRAR_MENSAJERIA,
        IND_COBRAR_GUIA,
        comoConocioJetbox,
        codigoPromo,
        ConAlianza,
        recomiendaCuenta,
        recomiendaCuentaFecha,
        recomiendaCuentaUsuario,
        sync_admin,
        sync_exactus,
        sync_rj,
        sync_jbc,
        AlianzaFechaDatos,
        AlianzaUsuario,
        EsCuentaGerencia,
        ConfeccionWH,
        direccion1_id,
        direccion2_id,
        sync
    FROM ClientesWeb.dbo.cliente_Cliente
    WHERE IDE_SJO = @idesjo;

    -- Persona
    IF @persona_id IS NOT NULL
      BEGIN
        EXEC comparaPersona @persona_id,
                              @personaId;
      END
    -- Apoderado
    IF @apoderado_id IS NOT NULL
      BEGIN
        EXEC comparaPersona @apoderado_id,
                              @apoderadoId;
      END
    -- Direccion
    IF @direccion_id IS NOT NULL
      BEGIN
        EXEC comparaDireccion @direccion_id,
                                @direccionId;
      END

    -- Cliente Correo
    EXEC comparaCorreo @idesjo;

    -- Correo Autorizado
    DECLARE @correoAutorizadosTmp TABLE (
                                  ideCodigo int NOT NULL
                                  );
    DECLARE @correoAutorizadosTmp2 TABLE (
                                  ideCodigo int NOT NULL
                                  );
    DECLARE @ideCodigo int,
            @webIdeCodigo int;

    INSERT INTO @correoAutorizadosTmp (ideCodigo)
      SELECT
        ide_codigo
      FROM clientes.dbo.correo_Autorizado
      WHERE IDE_SJO = @idesjo
      ORDER BY ide_codigo;

    INSERT INTO @correoAutorizadosTmp2 (ideCodigo)
      SELECT
        ide_codigo
      FROM ClientesWeb.dbo.correo_Autorizado
      WHERE IDE_SJO = @idesjo
      ORDER BY ide_codigo;

    SET ROWCOUNT 1;
    WHILE ((SELECT
              COUNT(*)
            FROM @correoAutorizadosTmp)
           > 0)
      BEGIN
        SELECT TOP 1
            @ideCodigo = ideCodigo
        FROM @correoAutorizadosTmp;

        SELECT TOP 1
            @webIdeCodigo = ideCodigo
        FROM @correoAutorizadosTmp2;

        EXEC comparaAutorizado @ideCodigo,
                                 @webIdeCodigo;

        DELETE FROM @correoAutorizadosTmp
        WHERE ideCodigo = @ideCodigo;

        DELETE FROM @correoAutorizadosTmp2
        WHERE ideCodigo = @webIdeCodigo;
      END
    SET ROWCOUNT 0;

    DELETE FROM @correoAutorizadosTmp2;

    -- Contactos
    DECLARE @contactosTmp TABLE (
                          contactoId int NOT NULL
                          );
    DECLARE @contactosTmp2 TABLE (
                          contactoId int NOT NULL
                          );
    DECLARE @contactoId int,
            @webContactoId int;

    INSERT INTO @contactosTmp (contactoId)
      SELECT
        id
      FROM clientes.dbo.cliente_Contacto
      WHERE cliente_IDE_SJO = @idesjo
      ORDER BY id;

    INSERT INTO @contactosTmp2 (contactoId)
      SELECT
        id
      FROM ClientesWeb.dbo.cliente_Contacto
      WHERE cliente_IDE_SJO = @idesjo
      ORDER BY id;

    SET ROWCOUNT 1;
    WHILE ((SELECT
              COUNT(*)
            FROM @contactosTmp)
           > 0)
      BEGIN
        SELECT
          TOP 1
            @contactoId = contactoId
        FROM @contactosTmp;

        SELECT
          TOP 1
            @webContactoId = contactoId
        FROM @contactosTmp2;

        EXEC comparaContacto @contactoId,
                           @webContactoId;

        DELETE FROM @contactosTmp
        WHERE contactoId = @contactoId;

        DELETE FROM @contactosTmp2
        WHERE contactoId = @webContactoId;
      END
    SET ROWCOUNT 0;

    DELETE FROM @contactosTmp2;

    -- Imagen
    EXEC comparaImagen @idesjo;

    -- Tarjeta
    EXEC comparaTarjeta @idesjo;

    -- Tarjeta Bitacora
    EXEC comparaTarjetaBitacora @idesjo;
  END


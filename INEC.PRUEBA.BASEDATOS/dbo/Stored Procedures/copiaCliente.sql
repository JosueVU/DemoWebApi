
CREATE PROCEDURE [dbo].[copiaCliente] @idesjo varchar(12)
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT ''
    PRINT 'Copiando Cliente: ' + @idesjo;

    DECLARE @persona_id int,
            @apoderado_id int,
            @direccion_id int,
            @personaId int,
            @apoderadoId int,
            @direccionId int,
			@nullDireccionId int = NULL;
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


    -- Primero pasamos la Direccion
    IF @direccion_id IS NOT NULL
      BEGIN
        EXEC copiaDireccion @direccion_id,
                            @direccionId OUTPUT;
      END


    -- Persona
    IF @persona_id IS NOT NULL
      BEGIN
        EXEC copiaPersona @persona_id,
		                  @direccion_id OUTPUT,
                          @personaId OUTPUT;
      END
    -- Apoderado
    IF @apoderado_id IS NOT NULL
      BEGIN
        EXEC copiaPersona @apoderado_id,
                          @nullDireccionId OUTPUT,
                          @apoderadoId OUTPUT;
      END

    -- Cliente
    DECLARE @nombre varchar(120),
            @tipoCliente int,
            @idioma varchar(2),
            @nombreCorto varchar(120),
            @estadoCliente int,
            @fechaIngreso datetime,
            @cedulaJuridica varchar(40),
            @historialZona varchar(1024),
            @observaciones varchar(1024),
            @claveWeb varchar(255),
            @fechaUltimaGeneracionClaveWeb datetime,
            @flags int,
            @sucursal_id int,
            @zona_id int,
            @IDE_SJO_HQS int,
            @forma_de_afiliacion tinyint,
            @claveWeb_temp tinyint,
            @IND_COBRAR_MENSAJERIA tinyint,
            @IND_COBRAR_GUIA tinyint,
            @comoConocioJetbox varchar(40),
            @codigoPromo varchar(30),
            @ConAlianza int,
            @recomiendaCuenta varchar(5),
            @recomiendaCuentaFecha datetime,
            @recomiendaCuentaUsuario varchar(45),
            @sync_admin int,
            @sync_exactus int,
            @sync_rj int,
            @sync_jbc int,
            @AlianzaFechaDatos datetime,
            @AlianzaUsuario varchar(45),
            @EsCuentaGerencia tinyint,
            @ConfeccionWH tinyint,
            @direccion1_id int,
            @direccion2_id int,
            @sync int;
    SELECT
        @nombre = nombre,
        @tipoCliente = tipoCliente,
        @idioma = idioma,
        @nombreCorto = nombreCorto,
        @estadoCliente = estadoCliente,
        @fechaIngreso = fechaIngreso,
        @cedulaJuridica = cedulaJuridica,
        @historialZona = historialZona,
        @observaciones = observaciones,
        @claveWeb = claveWeb,
        @fechaUltimaGeneracionClaveWeb = fechaUltimaGeneracionClaveWeb,
        @flags = flags,
        @sucursal_id = sucursal_id,
        @zona_id = zona_id,
        @persona_id = @personaId,
        @direccion_id = @direccionId,
        @apoderado_id = @apoderadoId,
        @IDE_SJO_HQS = IDE_SJO_HQS,
        @forma_de_afiliacion = forma_de_afiliacion,
        @claveWeb_temp = claveWeb_temp,
        @IND_COBRAR_MENSAJERIA = IND_COBRAR_MENSAJERIA,
        @IND_COBRAR_GUIA = IND_COBRAR_GUIA,
        @comoConocioJetbox = comoConocioJetbox,
        @codigoPromo = codigoPromo,
        @ConAlianza = ConAlianza,
        @recomiendaCuenta = recomiendaCuenta,
        @recomiendaCuentaFecha = recomiendaCuentaFecha,
        @recomiendaCuentaUsuario = recomiendaCuentaUsuario,
        @sync_admin = sync_admin,
        @sync_exactus = sync_exactus,
        @sync_rj = sync_rj,
        @sync_jbc = sync_jbc,
        @AlianzaFechaDatos = AlianzaFechaDatos,
        @AlianzaUsuario = AlianzaUsuario,
        @EsCuentaGerencia = EsCuentaGerencia,
        @ConfeccionWH = ConfeccionWH,
        @direccion1_id = direccion1_id,
        @direccion2_id = direccion2_id,
        @sync = sync
    FROM clientes.dbo.cliente_Cliente
    WHERE IDE_SJO = @idesjo;

    SELECT
      ide_sjo
    FROM ClientesWeb.dbo.cliente_Cliente
    WHERE ide_sjo = @idesjo;
    IF @@ROWCOUNT > 0
      BEGIN
        PRINT 'Actualizando Cliente: ' + @idesjo;
        UPDATE ClientesWeb.dbo.cliente_Cliente
        SET nombre = @nombre,
          tipoCliente = @tipoCliente,
          idioma = @idioma,
          nombreCorto = @nombreCorto,
          estadoCliente = @estadoCliente,
          fechaIngreso = @fechaIngreso,
          cedulaJuridica = @cedulaJuridica,
          historialZona = @historialZona,
          observaciones = @observaciones,
          claveWeb = @claveWeb,
          fechaUltimaGeneracionClaveWeb = @fechaUltimaGeneracionClaveWeb,
          flags = @flags,
          sucursal_id = @sucursal_id,
          zona_id = @zona_id,
          direccion_id = @direccionId,
          apoderado_id = @apoderadoId,
          persona_id = @personaId,
          IDE_SJO_HQS = @IDE_SJO_HQS,
          forma_de_afiliacion = @forma_de_afiliacion,
          claveWeb_temp = @claveWeb_temp,
          IND_COBRAR_MENSAJERIA = @IND_COBRAR_MENSAJERIA,
          IND_COBRAR_GUIA = @IND_COBRAR_GUIA,
          comoConocioJetbox = @comoConocioJetbox,
          codigoPromo = @codigoPromo,
          ConAlianza = @ConAlianza,
          recomiendaCuenta = @recomiendaCuenta,
          recomiendaCuentaFecha = @recomiendaCuentaFecha,
          recomiendaCuentaUsuario = @recomiendaCuentaUsuario,
          sync_admin = @sync_admin,
          sync_exactus = @sync_exactus,
          sync_rj = @sync_rj,
          sync_jbc = @sync_jbc,
          AlianzaFechaDatos = @AlianzaFechaDatos,
          AlianzaUsuario = @AlianzaUsuario,
          EsCuentaGerencia = @EsCuentaGerencia,
          ConfeccionWH = @ConfeccionWH,
          direccion1_id = @direccion1_id,
          direccion2_id = @direccion2_id,
          sync = @sync
        WHERE IDE_SJO = @idesjo;
        PRINT 'Cliente actualizado: ' + @idesjo;
      END
    ELSE
      BEGIN
        INSERT INTO ClientesWeb.dbo.cliente_Cliente (IDE_SJO, nombre, tipoCliente, idioma, nombreCorto, estadoCliente, fechaIngreso, cedulaJuridica, historialZona, observaciones, claveWeb, fechaUltimaGeneracionClaveWeb, flags, sucursal_id, zona_id, direccion_id, apoderado_id, persona_id, IDE_SJO_HQS, forma_de_afiliacion, claveWeb_temp, IND_COBRAR_MENSAJERIA, IND_COBRAR_GUIA, comoConocioJetbox, codigoPromo, ConAlianza, recomiendaCuenta, recomiendaCuentaFecha, recomiendaCuentaUsuario, sync_admin, sync_exactus, sync_rj, sync_jbc, AlianzaFechaDatos, AlianzaUsuario, EsCuentaGerencia, ConfeccionWH, direccion1_id, direccion2_id, sync)
        VALUES (@idesjo, @nombre, @tipoCliente, @idioma, @nombreCorto, @estadoCliente, @fechaIngreso, @cedulaJuridica, @historialZona, @observaciones, @claveWeb, @fechaUltimaGeneracionClaveWeb, @flags, @sucursal_id, @zona_id, @direccionId, @apoderadoId, @personaId, @IDE_SJO_HQS, @forma_de_afiliacion, @claveWeb_temp, @IND_COBRAR_MENSAJERIA, @IND_COBRAR_GUIA, @comoConocioJetbox, @codigoPromo, @ConAlianza, @recomiendaCuenta, @recomiendaCuentaFecha, @recomiendaCuentaUsuario, @sync_admin, @sync_exactus, @sync_rj, @sync_jbc, @AlianzaFechaDatos, @AlianzaUsuario, @EsCuentaGerencia, @ConfeccionWH, @direccion1_id, @direccion2_id, @sync)
        PRINT 'Nuevo Cliente: ' + @idesjo;
      END

    -- Cliente Correo
    EXEC copiaCorreo @idesjo;

    -- Correo Autorizado
    DECLARE @correoAutorizadosTmp TABLE (
                                  ideCodigo int NOT NULL
                                  );
    DECLARE @correoAutorizadosTmp2 TABLE (
                                  ideCodigo int NOT NULL
                                  );
    DECLARE @ideCodigo int,
            @outIdeCodigo int;

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
            @outIdeCodigo = ideCodigo
        FROM @correoAutorizadosTmp2;

        EXEC copiaAutorizado @ideCodigo,
                             @outIdeCodigo OUTPUT;

        DELETE FROM @correoAutorizadosTmp
        WHERE ideCodigo = @ideCodigo;

        DELETE FROM @correoAutorizadosTmp2
        WHERE ideCodigo = @outIdeCodigo;
      END
    SET ROWCOUNT 0;

    DELETE FROM ClientesWeb.dbo.correo_Autorizado
    WHERE ide_codigo IN (SELECT
                           ideCodigo
                         FROM @correoAutorizadosTmp2);
    DELETE FROM @correoAutorizadosTmp2;

    -- Contactos
    DECLARE @contactosTmp TABLE (
                          contactoId int NOT NULL
                          );
    DECLARE @contactosTmp2 TABLE (
                          contactoId int NOT NULL
                          );
    DECLARE @contactoId int,
            @outContactoId int;

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
            @outContactoId = contactoId
        FROM @contactosTmp2;

        EXEC copiaContacto @contactoId,
                           @outContactoId OUTPUT;

        DELETE FROM @contactosTmp
        WHERE contactoId = @contactoId;

        DELETE FROM @contactosTmp2
        WHERE contactoId = @outContactoId;
      END
    SET ROWCOUNT 0;

    DELETE FROM ClientesWeb.dbo.cliente_Contacto
    WHERE id IN (SELECT
                   contactoId
                 FROM @contactosTmp2);
    DELETE FROM @contactosTmp2;

    -- Imagen
    PRINT 'Imagenes para Cliente: ' + @idesjo;
    DELETE FROM ClientesWeb.dbo.cliente_Imagen
    WHERE CLIENTE_IDE_SJO = @idesjo;
    INSERT INTO ClientesWeb.dbo.cliente_Imagen (nota, tipo, image, CLIENTE_IDE_SJO)
      SELECT
        nota,
        tipo,
        image,
        @idesjo
      FROM clientes.dbo.cliente_Imagen
      WHERE cliente_IDE_SJO = @idesjo
      ORDER BY id;

    /*DECLARE @imagenesTmp TABLE (imagenId int not null);
    INSERT INTO @imagenesTmp (imagenId)
    SELECT id FROM clientes.dbo.cliente_Imagen WHERE cliente_IDE_SJO = @idesjo ORDER BY id;

    DECLARE @imagenId numeric(19, 0);
    SET ROWCOUNT 1;
    WHILE((SELECT COUNT(*) FROM @imagenesTmp) > 0)
    BEGIN
      SELECT @imagenId = imagenId FROM @imagenesTmp;
      EXEC copiaImagen @idesjo, @imagenId;
      DELETE FROM @imagenesTmp WHERE imagenId = @imagenId;
    END
    SET ROWCOUNT 0;*/

    -- Tarjeta
    DELETE webTAR
    FROM ClientesWeb.dbo.cliente_Tarjeta webTAR
    WHERE webTAR.IDE_SJO = @idesjo;

    INSERT INTO ClientesWeb.dbo.cliente_Tarjeta (IDE_SJO, COD_BANCO, DSC_INFO)
      SELECT IDE_SJO, COD_BANCO, DSC_INFO
      FROM clientes.dbo.cliente_Tarjeta oldTAR
      WHERE oldTAR.IDE_SJO = @idesjo;

    -- Tarjeta Bitacora
    DELETE webBIT
    FROM ClientesWeb.dbo.cliente_TarjetaBitacora webBIT
    WHERE webBIT.IDE_SJO = @idesjo;

    INSERT INTO ClientesWeb.dbo.cliente_TarjetaBitacora (FEC_BITACORA, COD_OPERACION, IDE_SJO, COD_USER, DSC_INFO)
      SELECT FEC_BITACORA, COD_OPERACION, IDE_SJO, COD_USER, DSC_INFO
      FROM clientes.dbo.cliente_TarjetaBitacora oldTAR
      WHERE oldTAR.IDE_SJO = @idesjo;

    -- registrar copias
    INSERT INTO ClientesWeb.dbo.cliente_Copiado (ide_sjo, fecha_copia)
    VALUES (@idesjo, GETDATE());

    -- Banderas de sync
    UPDATE clientes.dbo.cliente_Cliente
    SET sync_admin = 1,
      sync_exactus = 1,
      sync_rj = 1,
      sync_jbc = 1
    WHERE IDE_SJO = @idesjo;
  END


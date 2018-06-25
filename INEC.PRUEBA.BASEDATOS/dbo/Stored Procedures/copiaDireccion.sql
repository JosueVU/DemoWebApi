
CREATE PROCEDURE [dbo].[copiaDireccion] @direccionId int,
                                        @outDireccionId int OUTPUT
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @descripcion varchar(1024),
            @telefono1 varchar(45),
            @telefono2 varchar(45),
            @telefono3 varchar(45),
            @telefono4 varchar(45),
            @tipoTelefono1 int,
            @tipoTelefono2 int,
            @tipoTelefono3 int,
            @tipoTelefono4 int,
            @celular varchar(255),
            @email1 varchar(90),
            @email2 varchar(90),
            @division_id int,
            @subdivision_id int,
            @pais_id int,
            @ConSubdivision int,
            @ImagenEntrega varchar(16),
            @HorarioEntrega varchar(40),
            @Localizador varchar(255),
            @Nombre varchar(40),
            @autorizado_id int,
            @latitud varchar(12),
            @longitud varchar(12);

    IF EXISTS ( SELECT 1 FROM clientes.dbo.cliente_Direccion WHERE id = @direccionId )
      BEGIN
        SELECT
            @descripcion = descripcion,
            @telefono1 = telefono1,
            @telefono2 = telefono2,
            @telefono3 = telefono3,
            @telefono4 = telefono4,
            @tipoTelefono1 = tipoTelefono1,
            @tipoTelefono2 = tipoTelefono2,
            @tipoTelefono3 = tipoTelefono3,
            @tipoTelefono4 = tipoTelefono4,
            @celular = celular,
            @email1 = email1,
            @email2 = email2,
            @division_id = division_id,
            @subdivision_id = subdivision_id,
            @pais_id = pais_id,
            @ConSubdivision = ConSubdivision,
            @ImagenEntrega = ImagenEntrega,
            @HorarioEntrega = HorarioEntrega,
            @Localizador = Localizador,
            @Nombre = Nombre,
            @autorizado_id = autorizado_id,
            @latitud = latitud,
            @longitud = longitud
        FROM clientes.dbo.cliente_Direccion
        WHERE id = @direccionId;

        IF @outDireccionId IS NOT NULL
          BEGIN
            PRINT 'Actualizando Direccion: ' + CONVERT(varchar, @outDireccionId);
            UPDATE ClientesWeb.dbo.cliente_Direccion
            SET descripcion = @descripcion,
              telefono1 = @telefono1,
              telefono2 = @telefono2,
              telefono3 = @telefono3,
              telefono4 = @telefono4,
              tipoTelefono1 = @tipoTelefono1,
              tipoTelefono2 = @tipoTelefono2,
              tipoTelefono3 = @tipoTelefono3,
              tipoTelefono4 = @tipoTelefono4,
              celular = @celular,
              email1 = @email1,
              email2 = @email2,
              division_id = @division_id,
              subdivision_id = @subdivision_id,
              pais_id = @pais_id,
              ConSubdivision = @ConSubdivision,
              ImagenEntrega = @ImagenEntrega,
              HorarioEntrega = @HorarioEntrega,
              Localizador = @Localizador,
              Nombre = @Nombre,
              autorizado_id = @autorizado_id,
              latitud = @latitud,
              longitud = @longitud
            WHERE id = @outDireccionId;
          END
        ELSE
          BEGIN
            INSERT INTO ClientesWeb.dbo.cliente_Direccion (descripcion, telefono1, telefono2, telefono3, telefono4, tipoTelefono1, tipoTelefono2, tipoTelefono3, tipoTelefono4, celular, email1, email2, division_id, subdivision_id, pais_id, ConSubdivision, ImagenEntrega, HorarioEntrega, Localizador, Nombre, autorizado_id, latitud, longitud)
            VALUES (@descripcion, @telefono1, @telefono2, @telefono3, @telefono4, @tipoTelefono1, @tipoTelefono2, @tipoTelefono3, @tipoTelefono4, @celular, @email1, @email2, @division_id, @subdivision_id, @pais_id, @ConSubdivision, @ImagenEntrega, @HorarioEntrega, @Localizador, @Nombre, @autorizado_id, @latitud, @longitud);
            SET @outDireccionId = @@IDENTITY;
            PRINT 'Nueva Direccion: ' + CONVERT(varchar, @outDireccionId);
          END
        END
      ELSE
        BEGIN
          SET @outDireccionId = NULL;
        END
  END


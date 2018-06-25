
CREATE PROCEDURE [dbo].[comparaDireccion] @direccionId int,
                                        @webDireccionId int
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Compara Direccion: ' + CONVERT(varchar, @direccionId) + ' / ' + CONVERT(varchar, isnull(@webDireccionId, 0));

    SELECT
        descripcion,
        telefono1,
        telefono2,
        telefono3,
        telefono4,
        tipoTelefono1,
        tipoTelefono2,
        tipoTelefono3,
        tipoTelefono4,
        celular,
        email1,
        email2,
        division_id,
        subdivision_id,
        pais_id,
        ConSubdivision,
        ImagenEntrega,
        HorarioEntrega,
        Localizador,
        Nombre,
        autorizado_id,
        latitud,
        longitud
    FROM clientes.dbo.cliente_Direccion
    WHERE id = @direccionId;

    SELECT
        descripcion,
        telefono1,
        telefono2,
        telefono3,
        telefono4,
        tipoTelefono1,
        tipoTelefono2,
        tipoTelefono3,
        tipoTelefono4,
        celular,
        email1,
        email2,
        division_id,
        subdivision_id,
        pais_id,
        ConSubdivision,
        ImagenEntrega,
        HorarioEntrega,
        Localizador,
        Nombre,
        autorizado_id,
        latitud,
        longitud
    FROM ClientesWeb.dbo.cliente_Direccion
    WHERE id = @webDireccionId;
  END



CREATE PROCEDURE [dbo].[copiaImagen] @idesjo varchar(12),
                                     @imagenId numeric(19, 0)
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @nota varchar(255),
            @tipo int,
            @img varbinary;
    SELECT
        @nota = nota,
        @tipo = tipo,
        @img = image
    FROM clientes.dbo.cliente_Imagen
    WHERE id = @imagenId
          AND CLIENTE_IDE_SJO = @idesjo;

    SELECT
      id
    FROM ClientesWeb.dbo.cliente_Imagen
    WHERE id = @imagenId
          AND CLIENTE_IDE_SJO = @idesjo;
    IF @@ROWCOUNT > 0
      BEGIN
        PRINT 'Actualizando Imagen: ' + CONVERT(varchar, @imagenId);
        UPDATE ClientesWeb.dbo.cliente_Imagen
        SET nota = @nota,
          tipo = @tipo,
          image = @img
        WHERE id = @imagenId;
      END
    ELSE
      BEGIN
        INSERT INTO ClientesWeb.dbo.cliente_Imagen (nota, tipo, image, CLIENTE_IDE_SJO)
        VALUES (@nota, @tipo, @img, @idesjo);
        PRINT 'Nueva Imagen: ' + CONVERT(varchar, @@IDENTITY);
      END
  END



CREATE PROCEDURE [dbo].[comparaImagen] @idesjo varchar(12)
AS
  BEGIN
    SET NOCOUNT ON;

    PRINT 'Compara Imagenes para: ' + @idesjo;

    SELECT
        nota,
        tipo
    FROM clientes.dbo.cliente_Imagen
    WHERE CLIENTE_IDE_SJO = @idesjo;

    SELECT
        nota,
        tipo
    FROM ClientesWeb.dbo.cliente_Imagen
    WHERE CLIENTE_IDE_SJO = @idesjo;
  END


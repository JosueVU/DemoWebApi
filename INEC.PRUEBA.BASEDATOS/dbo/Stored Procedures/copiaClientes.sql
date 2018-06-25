
CREATE PROCEDURE [dbo].[copiaClientes]
AS
  BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('ClientesWeb.dbo.cliente_Copiado', 'U') IS NULL
      BEGIN
        CREATE TABLE ClientesWeb.dbo.cliente_Copiado (
          ide_sjo varchar(12) NOT NULL,
          fecha_copia datetime,
          fecha_copia_tarjeta datetime
        );
      END

    DECLARE @empresas TABLE (
                      id int
                      );
    INSERT INTO @empresas
      SELECT
        10;

    DECLARE @clientesTmp TABLE (
                      ide_sjo varchar(12) NOT NULL
                      );
    INSERT INTO @clientesTmp (ide_sjo)
      SELECT
        cc.ide_sjo
      FROM clientes.dbo.cliente_Cliente AS cc,
        clientes.dbo.cliente_Sucursal AS cs
      WHERE cc.ide_sjo != ''
            AND cc.sync_jbc = 0
            AND cc.sucursal_id = cs.id
            AND cs.empresa_id IN (SELECT
                                    id
                                  FROM @empresas)
      ORDER BY cc.ide_sjo;

    DECLARE @idesjo varchar(12);
    SET ROWCOUNT 1;
    WHILE ((SELECT
              COUNT(*)
            FROM @clientesTmp)
           > 0)
      BEGIN
        SELECT
            @idesjo = ide_sjo
        FROM @clientesTmp;
        EXEC copiaCliente @idesjo;
        DELETE FROM @clientesTmp
        WHERE ide_sjo = @idesjo;
      END
    SET ROWCOUNT 0;
  END


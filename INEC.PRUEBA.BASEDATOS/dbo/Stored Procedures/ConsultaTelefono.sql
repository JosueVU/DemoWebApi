
CREATE PROCEDURE [dbo].[ConsultaTelefono] ( @psTelefono VARCHAR(32) )
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @viLen INT = LEN(@psTelefono)

    SELECT 'PRIMARIO' Origen,
           CLI.IDE_SJO Codigo,
           CLI.nombre Nombre,
			CASE @psTelefono
			   WHEN RIGHT(DIR.celular, @viLen)   THEN DIR.celular
			   WHEN RIGHT(DIR.telefono1, @viLen) THEN DIR.telefono1
			   WHEN RIGHT(DIR.telefono2, @viLen) THEN DIR.telefono2
			   WHEN RIGHT(DIR.telefono3, @viLen) THEN DIR.telefono3
			   WHEN RIGHT(DIR.telefono4, @viLen) THEN DIR.telefono4
			   ELSE 'NOT FOUND' 
			END Telefono
      INTO #table_Temp1
      FROM dbo.cliente_Cliente CLI
           INNER JOIN dbo.cliente_Direccion DIR ON CLI.direccion_id = DIR.id
     WHERE RIGHT(DIR.celular, @viLen) = @psTelefono
        OR RIGHT(DIR.telefono4, @viLen) = @psTelefono
        OR RIGHT(DIR.telefono3, @viLen) = @psTelefono
        OR RIGHT(DIR.telefono2, @viLen) = @psTelefono
        OR RIGHT(DIR.telefono1, @viLen) = @psTelefono

   IF EXISTS ( SELECT * FROM #table_Temp1 )
   BEGIN
      SELECT Origen, Codigo, Nombre, RIGHT(REPLACE(Telefono, '-', ''), 8) FROM #table_Temp1
      RETURN 
   END

    SELECT 'SECUNDARIO' Origen,
        CLI.IDE_SJO Codigo,
        CLI.nombre Nombre,
		CASE @psTelefono
			WHEN RIGHT(DIR1.celular, @viLen)   THEN DIR1.celular
            WHEN RIGHT(DIR2.celular, @viLen)   THEN DIR2.celular
			WHEN RIGHT(DIR1.telefono1, @viLen) THEN DIR1.telefono1
			WHEN RIGHT(DIR2.telefono1, @viLen) THEN DIR2.telefono1
			WHEN RIGHT(DIR1.telefono2, @viLen) THEN DIR1.telefono2
			WHEN RIGHT(DIR2.telefono2, @viLen) THEN DIR2.telefono2
			WHEN RIGHT(DIR1.telefono3, @viLen) THEN DIR1.telefono3
			WHEN RIGHT(DIR2.telefono3, @viLen) THEN DIR2.telefono3
			WHEN RIGHT(DIR1.telefono4, @viLen) THEN DIR1.telefono4
			WHEN RIGHT(DIR2.telefono4, @viLen) THEN DIR2.telefono4
			ELSE 'NOT FOUND' 
		END Telefono
		INTO #table_Temp2
    FROM dbo.cliente_Cliente CLI
        LEFT JOIN dbo.cliente_Direccion DIR2 ON CLI.direccion_id = DIR2.id
        LEFT JOIN dbo.cliente_Persona PER    ON CLI.persona_id   = PER.id
        LEFT JOIN dbo.cliente_Direccion DIR1 ON PER.direccion_id = DIR1.id
    WHERE RIGHT(DIR2.telefono1, @viLen) = @psTelefono
        OR RIGHT(DIR2.telefono2, @viLen) = @psTelefono
        OR RIGHT(DIR2.telefono3, @viLen) = @psTelefono
        OR RIGHT(DIR2.telefono4, @viLen) = @psTelefono
        OR RIGHT(DIR1.telefono1, @viLen) = @psTelefono
        OR RIGHT(DIR1.telefono2, @viLen) = @psTelefono
        OR RIGHT(DIR1.telefono3, @viLen) = @psTelefono
        OR RIGHT(DIR1.telefono4, @viLen) = @psTelefono
        OR RIGHT(DIR1.celular, @viLen) = @psTelefono
        OR RIGHT(DIR2.celular, @viLen) = @psTelefono

   IF EXISTS ( SELECT * FROM #table_Temp2 )
   BEGIN
      SELECT Origen, Codigo, Nombre, RIGHT(REPLACE(Telefono, '-', ''), 8) FROM #table_Temp2
      RETURN 
   END


    SET @psTelefono = LEFT(@psTelefono, @viLen -4) + '-' + RIGHT(@psTelefono, 4)
	SET @viLen = @viLen +1

    SELECT 'PRIMARIO' Origen,
            CLI.IDE_SJO Codigo,
            CLI.nombre Nombre,
            CASE @psTelefono
                WHEN RIGHT(DIR.celular, @viLen)   THEN DIR.celular
                WHEN RIGHT(DIR.telefono1, @viLen) THEN DIR.telefono1
                WHEN RIGHT(DIR.telefono2, @viLen) THEN DIR.telefono2
                WHEN RIGHT(DIR.telefono3, @viLen) THEN DIR.telefono3
                WHEN RIGHT(DIR.telefono4, @viLen) THEN DIR.telefono4
                ELSE 'NOT FOUND' 
            END Telefono
        INTO #table_Temp3
        FROM dbo.cliente_Cliente CLI
            INNER JOIN dbo.cliente_Direccion DIR ON CLI.direccion_id = DIR.id
        WHERE RIGHT(DIR.celular, @viLen) = @psTelefono
        OR RIGHT(DIR.telefono4, @viLen) = @psTelefono
        OR RIGHT(DIR.telefono3, @viLen) = @psTelefono
        OR RIGHT(DIR.telefono2, @viLen) = @psTelefono
        OR RIGHT(DIR.telefono1, @viLen) = @psTelefono

   IF EXISTS ( SELECT * FROM #table_Temp3 )
   BEGIN
      SELECT Origen, Codigo, Nombre, RIGHT(REPLACE(Telefono, '-', ''), 8) FROM #table_Temp3
      RETURN 
   END

    SELECT 'SECUNDARIO' Origen,
        CLI.IDE_SJO Codigo,
        CLI.nombre Nombre,
        CASE @psTelefono
            WHEN RIGHT(DIR1.celular, @viLen)   THEN DIR1.celular
            WHEN RIGHT(DIR2.celular, @viLen)   THEN DIR2.celular
            WHEN RIGHT(DIR1.telefono1, @viLen) THEN DIR1.telefono1
            WHEN RIGHT(DIR2.telefono1, @viLen) THEN DIR2.telefono1
            WHEN RIGHT(DIR1.telefono2, @viLen) THEN DIR1.telefono2
            WHEN RIGHT(DIR2.telefono2, @viLen) THEN DIR2.telefono2
            WHEN RIGHT(DIR1.telefono3, @viLen) THEN DIR1.telefono3
            WHEN RIGHT(DIR2.telefono3, @viLen) THEN DIR2.telefono3
            WHEN RIGHT(DIR1.telefono4, @viLen) THEN DIR1.telefono4
            WHEN RIGHT(DIR2.telefono4, @viLen) THEN DIR2.telefono4
            ELSE 'NOT FOUND' 
        END Telefono
		INTO #table_Temp4
    FROM dbo.cliente_Cliente CLI
        LEFT JOIN dbo.cliente_Direccion DIR2 ON CLI.direccion_id = DIR2.id
        LEFT JOIN dbo.cliente_Persona PER    ON CLI.persona_id   = PER.id
        LEFT JOIN dbo.cliente_Direccion DIR1 ON PER.direccion_id = DIR1.id
    WHERE RIGHT(DIR2.telefono1, @viLen) = @psTelefono
        OR RIGHT(DIR2.telefono2, @viLen) = @psTelefono
        OR RIGHT(DIR2.telefono3, @viLen) = @psTelefono
        OR RIGHT(DIR2.telefono4, @viLen) = @psTelefono
        OR RIGHT(DIR1.telefono1, @viLen) = @psTelefono
        OR RIGHT(DIR1.telefono2, @viLen) = @psTelefono
        OR RIGHT(DIR1.telefono3, @viLen) = @psTelefono
        OR RIGHT(DIR1.telefono4, @viLen) = @psTelefono
        OR RIGHT(DIR1.celular, @viLen) = @psTelefono
        OR RIGHT(DIR2.celular, @viLen) = @psTelefono

   IF EXISTS ( SELECT * FROM #table_Temp3 )
   BEGIN
      SELECT Origen, Codigo, Nombre, RIGHT(REPLACE(Telefono, '-', ''), 8) FROM #table_Temp3
      RETURN 
   END
	 
	SELECT 'NO EXISTE' Origen, 'NO EXISTE' Codigo, 'NO EXISTE' Nombre, @psTelefono Telefono

END


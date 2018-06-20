

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [INEC.SEC].[USP_USUARIO_INSERTAR_MASIVO]
	@usuario [INEC.SEC].USUARIO_TIPO  READONLY 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	insert into [INEC.SEC].USUARIO
	select [NOMBRE_USUARIO]
           ,[APELLIDO1_USUARIO]
           ,[APELLIDO2_USUARIO]
           ,[FECHA_NACIMIENTO_USUARIO]
           ,[CODIGO_USUARIO]
           ,[FOTO_USUARIO]
           ,[CREACION_USUARIO]
           ,[FECHA_CREACION_USUARIO]
           ,[MODIFICACION_USUARIO]
           ,[MODIFICACION_FECHA_USUARIO]
	from @usuario

	select 1

		
END
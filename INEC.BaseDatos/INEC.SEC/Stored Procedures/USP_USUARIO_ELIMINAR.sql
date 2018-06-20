-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [INEC.SEC].[USP_USUARIO_ELIMINAR]
	@ID_USUARIO int = NULL,
	@NOMBRE_USUARIO [varchar](100) = NULL,
	@APELLIDO1_USUARIO [varchar](100) = NULL,
	@APELLIDO2_USUARIO [varchar](100) = NULL,
	@FECHA_NACIMIENTO_USUARIO [date] = NULL,
	@CODIGO_USUARIO [varchar](10) = NULL,
	@FOTO_USUARIO [varbinary](max) =NULL,
	@CREACION_USUARIO [varchar](10) = NULL,
	@FECHA_CREACION_USUARIO [datetime] = NULL,
	@MODIFICACION_USUARIO [varchar](10) =NULL,
	@MODIFICACION_FECHA_USUARIO [datetime] =NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM [INEC.SEC].USUARIO
	WHERE (ID_USUARIO = @ID_USUARIO)

	select 1
END

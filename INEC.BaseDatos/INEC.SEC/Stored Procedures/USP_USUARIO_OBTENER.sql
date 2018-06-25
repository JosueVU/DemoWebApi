-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [INEC.SEC].[USP_USUARIO_OBTENER]
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

		SELECT a.[ID_USUARIO]
		  ,[NOMBRE_USUARIO]
		  ,[APELLIDO1_USUARIO]
		  ,[APELLIDO2_USUARIO]
		  ,[FECHA_NACIMIENTO_USUARIO]
		  ,[CODIGO_USUARIO]
		  ,[FOTO_USUARIO]
		  ,[CREACION_USUARIO]
		  ,[FECHA_CREACION_USUARIO]
		  ,[MODIFICACION_USUARIO]
		  ,[MODIFICACION_FECHA_USUARIO]
		  ,b.ID_DIRECCION
		  ,b.DESCRIPCION_DIRECCION
	  FROM [INEC.SEC].[USUARIO] A WITH(NOLOCK) 
	  left join [INEC.SEC].[DIRECCION] B WITH(NOLOCK) 
	  on A.ID_USUARIO = b.ID_USUARIO
	  WHERE (@ID_USUARIO IS NULL OR a.ID_USUARIO = @ID_USUARIO)
END

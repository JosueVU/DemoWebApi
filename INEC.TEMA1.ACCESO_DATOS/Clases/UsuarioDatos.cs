using Dapper;
using INEC.TEMA1.ACCESO_DATOS.Interfaz;
using INEC.TEMA1.COMUN;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using INEC.TEMA1.ACCESO_DATOS;
using System;

namespace INEC.TEMA1.ACCESO_DATOS.Clases
{
    public class UsuarioDatos : IUsuarioDatos
    {
        public UsuarioDatos()
        {

        }

        public List<USUARIO> ObtenerUsuarios()
        {
            using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionINEC"].ConnectionString))
            {
                return db.Query<USUARIO,DIRECCION,USUARIO>(
                "[INEC.SEC].[USP_USUARIO_OBTENER]",
                (A,B) => 
                {
                    A.DIRECCIONs.Add(B);
                    return A;
                },
                splitOn: "ID_DIRECCION",
                param: new
                {

                },

                commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public USUARIO ObtenerUsuario(USUARIO usuario)
        {
            using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionINEC"].ConnectionString))
            {
                return db.Query<USUARIO,DIRECCION,USUARIO>(
                "[INEC.SEC].[USP_USUARIO_OBTENER]",
                (A, B) =>
                {
                    A.DIRECCIONs.Add(B);
                    return A;
                },
                splitOn: "ID_DIRECCION",
                param: new
                {
                    usuario.ID_USUARIO
                },

                commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
        }

        public bool GuardaUsuario(USUARIO usuario)
        {
            using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionINEC"].ConnectionString))
            {
                var ObtenerResultado = db.ExecuteScalar(
                 "[INEC.SEC].[USP_USUARIO_INSERTAR]",
                 param: new
                 {
                     usuario.NOMBRE_USUARIO,
                     usuario.APELLIDO1_USUARIO,
                     usuario.APELLIDO2_USUARIO,
                     usuario.FECHA_NACIMIENTO_USUARIO,
                     usuario.CODIGO_USUARIO,
                     usuario.FOTO_USUARIO,
                     usuario.CREACION_USUARIO,
                     usuario.FECHA_CREACION_USUARIO,
                     usuario.MODIFICACION_USUARIO,
                     usuario.MODIFICACION_FECHA_USUARIO
                 },
                 commandType: CommandType.StoredProcedure);

                if (Convert.ToBoolean(ObtenerResultado) == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public bool GuardaUsuarioMasivo(List<USUARIO> usuario)
        {
            using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionINEC"].ConnectionString))
            {
                var ObtenerResultado = db.ExecuteScalar(
                "[INEC.SEC].[USP_USUARIO_INSERTAR_MASIVO]",
                param: new
                {
                    usuario = usuario.ToDataTable<USUARIO>()
                },

                commandType: CommandType.StoredProcedure);

                if (Convert.ToBoolean(ObtenerResultado) == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public bool ActualizaUsuario(USUARIO usuario)
        {
            using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionINEC"].ConnectionString))
            {
                var ObtenerResultado = db.ExecuteScalar(
                "[INEC.SEC].[USP_USUARIO_INSERTAR]",
                param: new
                {
                    usuario.ID_USUARIO,
                    usuario.NOMBRE_USUARIO,
                    usuario.APELLIDO1_USUARIO,
                    usuario.APELLIDO2_USUARIO,
                    usuario.FECHA_NACIMIENTO_USUARIO,
                    usuario.CODIGO_USUARIO,
                    usuario.FOTO_USUARIO,
                    usuario.CREACION_USUARIO,
                    usuario.FECHA_CREACION_USUARIO,
                    usuario.MODIFICACION_USUARIO,
                    usuario.MODIFICACION_FECHA_USUARIO
                },

                commandType: CommandType.StoredProcedure);

                if (Convert.ToBoolean(ObtenerResultado) == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public bool EliminaUsuario(USUARIO usuario)
        {
            using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionINEC"].ConnectionString))
            {
                var ObtenerResultado = db.ExecuteScalar(
                "[INEC.SEC].[USP_USUARIO_ELIMINAR]",
                param: new
                {
                    usuario.ID_USUARIO,
                },

                commandType: CommandType.StoredProcedure);

                if (Convert.ToBoolean(ObtenerResultado) == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}

using INEC.TEMA1.ACCESO_DATOS.Clases;
using INEC.TEMA1.ACCESO_DATOS.Interfaz;
using INEC.TEMA1.COMUN;
using INEC.TEMA1.LOGICA.Interfaz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INEC.TEMA1.LOGICA.Clases
{
    public class UsuarioLogica: IUsuarioLogica
    {
        private IUsuarioDatos datos = null;
        public UsuarioLogica()
        {
            datos = new UsuarioDatos();
        }

        public List<USUARIO> ObtenerUsuarios()
        {
            return datos.ObtenerUsuarios();
        }

        public USUARIO ObtenerUsuario(USUARIO usuario)
        {
            return datos.ObtenerUsuario(usuario);
        }

        public bool GuardaUsuario(USUARIO usuario)
        {
            return datos.GuardaUsuario(usuario);
        }

        public bool GuardaUsuarioMasivo(List<USUARIO> usuario)
        {
            try
            {
                return datos.GuardaUsuarioMasivo(usuario);
            }
            catch (Exception ex)
            {
                return false;
            }
            
        }

        public bool ActualizaUsuario(USUARIO usuario)
        {
            return datos.ActualizaUsuario(usuario);
        }

        public bool EliminaUsuario(USUARIO usuario)
        {
            return datos.EliminaUsuario(usuario);
        }
    }
}

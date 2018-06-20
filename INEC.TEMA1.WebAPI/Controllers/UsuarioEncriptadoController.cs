using INEC.TEMA1.COMUN;
using INEC.TEMA1.ENCRIPTACION;
using INEC.TEMA1.LOGICA.Clases;
using INEC.TEMA1.LOGICA.Interfaz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace INEC.TEMA1.WebAPI.Controllers
{
    public class UsuarioEncriptadoController : ApiController
    {
        private IUsuarioLogica logica = null;
        public USUARIO usuario { get; set; }
        private INEC_ENCRIPTA encripta = null;
        private string respuestaDescriptada = null;

        public UsuarioEncriptadoController()
        {
            usuario = new USUARIO();
            logica = new UsuarioLogica();
            encripta = new INEC_ENCRIPTA();
        }
        // GET: /Usuario
        public List<USUARIO> Get(string encriptado)
        {
            respuestaDescriptada = encripta.Desencripta(encriptado);
            return logica.ObtenerUsuarios();
        }

        //// GET: api/Usuario/5
        //public USUARIO Get(string encriptado)
        //{
        //    usuario.ID_USUARIO = id;
        //    return logica.ObtenerUsuario(usuario);
        //}

        // POST: api/Usuario
        public void Post(string encriptado)
        {
            logica.GuardaUsuario(usuario);
        }

        // PUT: api/Usuario/5
        public void Put(string encriptado)
        {
            logica.ActualizaUsuario(usuario);
        }

        // DELETE: api/Usuario/5
        public void Delete(string encriptado)
        {
            //usuario.ID_USUARIO = id;
            logica.EliminaUsuario(usuario);
        }
    }
}

using INEC.TEMA1.COMUN;
using INEC.TEMA1.LOGICA.Clases;
using INEC.TEMA1.LOGICA.Interfaz;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace INEC.TEMA1.WebAPI.Controllers
{
    public class UsuarioImagenController : ApiController
    {
        private IUsuarioLogica logica = null;
        public USUARIO usuario { get; set; }
        public List<USUARIO> listaUsuario { get; set; }

        public UsuarioImagenController()
        {
            usuario = new USUARIO();
            logica = new UsuarioLogica();
        }
        // GET: api/Usuario
        public HttpResponseMessage Get()
        {
            HttpResponseMessage result = null;
            result = Request.CreateResponse(HttpStatusCode.OK, logica.ObtenerUsuarios());
            return result;
        }

        // GET: api/Usuario/5
        public HttpResponseMessage Get(int id)
        {
            HttpResponseMessage result = null;
            usuario.ID_USUARIO = id;
            result = Request.CreateResponse(HttpStatusCode.OK, logica.ObtenerUsuario(usuario));
            return result;
        }

        // POST: api/Usuario
        [HttpPost]
        public HttpResponseMessage AgregarUsuario()
        {
            HttpResponseMessage result = null;
            try
            {
                var request = HttpContext.Current.Request;
                
                for (int i = 0; i < request.Form.Count; i++)
                {
                    var httpPostedFile = HttpContext.Current.Request.Files["FOTO_USUARIO_"+i];
                    using (Stream fs = httpPostedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            usuario.FOTO_USUARIO = br.ReadBytes((Int32)fs.Length);
                        }
                    }
                }
                
                if (request.Files.Count == 0)
                {
                    result = Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                usuario.FECHA_CREACION_USUARIO = DateTime.Now;
                usuario.FECHA_NACIMIENTO_USUARIO = DateTime.Now;
                var resultado = logica.GuardaUsuario(usuario);

                result = Request.CreateResponse(HttpStatusCode.OK, resultado);
            }
            catch (Exception ex)
            {
                result = Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }

            return result;
        }

        [HttpPost]
        public HttpResponseMessage AgregarUsuariosMasivos()
        {
            HttpResponseMessage result = null;
            listaUsuario = new List<USUARIO>();
            try
            {
                var request = HttpContext.Current.Request;

                for (int i = 0; i < request.Form.Count; i++)
                {
                    usuario = new USUARIO();
                    var httpPostedFile = HttpContext.Current.Request.Files["FOTO_USUARIO_" + i];
                    using (Stream fs = httpPostedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            usuario.FOTO_USUARIO = br.ReadBytes((Int32)fs.Length);
                            usuario.FECHA_CREACION_USUARIO = DateTime.Now;
                            usuario.FECHA_NACIMIENTO_USUARIO = DateTime.Now;
                        }
                    }
                    listaUsuario.Add(usuario);
                }

                if (request.Files.Count == 0)
                {
                    result = Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                
                var resultado =logica.GuardaUsuarioMasivo(listaUsuario);

                result = Request.CreateResponse(HttpStatusCode.OK, resultado);
            }
            catch (Exception ex)
            {
                result = Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }

            return result;
        }

        [HttpPost]
        public HttpResponseMessage ActualizarUsuario()
        {
            HttpResponseMessage result = null;
            try
            {
                var request = HttpContext.Current.Request;

                for (int i = 0; i < request.Form.Count; i++)
                {
                    var httpPostedFile = HttpContext.Current.Request.Files["FOTO_USUARIO_" + i];
                    using (Stream fs = httpPostedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            usuario.FOTO_USUARIO = br.ReadBytes((Int32)fs.Length);
                        }
                    }
                }

                if (request.Files.Count == 0)
                {
                    result = Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                usuario.FECHA_CREACION_USUARIO = DateTime.Now;
                usuario.FECHA_NACIMIENTO_USUARIO = DateTime.Now;
                var resultado = logica.GuardaUsuario(usuario);

                result = Request.CreateResponse(HttpStatusCode.OK, resultado);
            }
            catch (Exception ex)
            {
                result = Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }

            return result;
        }

        [HttpPost]
        public HttpResponseMessage EliminarUsuario()
        {
            HttpResponseMessage result = null;
            try
            {
                var request = HttpContext.Current.Request;

                for (int i = 0; i < request.Form.Count; i++)
                {
                    var httpPostedFile = HttpContext.Current.Request.Files["FOTO_USUARIO_" + i];
                    using (Stream fs = httpPostedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            usuario.FOTO_USUARIO = br.ReadBytes((Int32)fs.Length);
                        }
                    }
                }

                if (request.Files.Count == 0)
                {
                    result = Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                usuario.FECHA_CREACION_USUARIO = DateTime.Now;
                usuario.FECHA_NACIMIENTO_USUARIO = DateTime.Now;
                var resultado = logica.GuardaUsuario(usuario);

                result = Request.CreateResponse(HttpStatusCode.OK, resultado);
            }
            catch (Exception ex)
            {
                result = Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }

            return result;
        }
    }
}

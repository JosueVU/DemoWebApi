using INEC.TEMA1.COMUN;
using INEC.TEMA1.LOGICA.Clases;
using INEC.TEMA1.LOGICA.Interfaz;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace INEC.TEMA1.WebAPI.Controllers
{
    public class UsuarioEscritorioController : ApiController
    {
        private IUsuarioLogica logica = null;
        public USUARIO usuario { get; set; }
        public List<USUARIO> listaUsuario { get; set; }
        public ApiResponse<List<USUARIO>> apiResponse = null;
        public ApiResponse<USUARIO> apiResponseModel = null;
        public ApiResponse<bool> apiResponseModelCrear = null;
        public UsuarioEscritorioController()
        {
            usuario = new USUARIO();
            logica = new UsuarioLogica();
            apiResponse = new ApiResponse<List<USUARIO>>();
            apiResponseModel = new ApiResponse<USUARIO>();
            apiResponseModelCrear = new ApiResponse<bool>();
        }
        // GET: api/Usuario
        [HttpGet]
        public IHttpActionResult Get()
        {
            HttpResponseMessage result = null;
            var modelo = logica.ObtenerUsuarios();
            apiResponse.Model = modelo;
            apiResponse.StatusIsSuccessful = true;
            apiResponse.ResponseCode = HttpStatusCode.OK;
            result = Request.CreateResponse(HttpStatusCode.OK, apiResponse);
            return ResponseMessage(result);
        }

        // GET: api/Usuario/5
        [HttpGet]
        public IHttpActionResult Get(int id)
        {
            HttpResponseMessage result = null;
            usuario.ID_USUARIO = id;
            var modelo = logica.ObtenerUsuario(usuario);
            apiResponseModel.Model = modelo;
            apiResponseModel.StatusIsSuccessful = true;
            apiResponseModel.ResponseCode = HttpStatusCode.OK;
            result = Request.CreateResponse(HttpStatusCode.OK, apiResponseModel);
            return ResponseMessage(result);
        }

        [HttpPost]
        public IHttpActionResult AgregarUsuario(ApiRequest<USUARIO> request)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var result = logica.GuardaUsuario(request.Model);
                apiResponseModelCrear.Model = result;
                apiResponseModelCrear.StatusIsSuccessful = true;
                apiResponseModelCrear.ResponseCode = HttpStatusCode.OK;
                return ResponseMessage(Request.CreateResponse(apiResponseModelCrear.ResponseCode, apiResponseModelCrear));
            }
            catch (Exception exception)
            {
                apiResponseModelCrear.Model = false;
                apiResponseModelCrear.StatusIsSuccessful = false;
                apiResponseModelCrear.ResponseCode = HttpStatusCode.InternalServerError;
                return ResponseMessage(Request.CreateResponse(apiResponseModelCrear.ResponseCode, apiResponseModelCrear));
            }
            
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

                var resultado = logica.GuardaUsuarioMasivo(listaUsuario);

                result = Request.CreateResponse(HttpStatusCode.OK, resultado);
            }
            catch (Exception ex)
            {
                result = Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }

            return result;
        }

        [HttpPost]
        public IHttpActionResult ActualizarUsuario(ApiRequest<USUARIO> request)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var result = logica.ActualizaUsuario(request.Model);
                apiResponseModelCrear.Model = result;
                apiResponseModelCrear.StatusIsSuccessful = true;
                apiResponseModelCrear.ResponseCode = HttpStatusCode.OK;
                return ResponseMessage(Request.CreateResponse(apiResponseModelCrear.ResponseCode, apiResponseModelCrear));
            }
            catch (Exception exception)
            {
                apiResponseModelCrear.Model = false;
                apiResponseModelCrear.StatusIsSuccessful = false;
                apiResponseModelCrear.ResponseCode = HttpStatusCode.InternalServerError;
                return ResponseMessage(Request.CreateResponse(apiResponseModelCrear.ResponseCode, apiResponseModelCrear));
            }

        }

        [HttpPost]
        public IHttpActionResult EliminaUsuario(ApiRequest<USUARIO> request)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var result = logica.EliminaUsuario(request.Model);
                apiResponseModelCrear.Model = result;
                apiResponseModelCrear.StatusIsSuccessful = true;
                apiResponseModelCrear.ResponseCode = HttpStatusCode.OK;
                return ResponseMessage(Request.CreateResponse(apiResponseModelCrear.ResponseCode, apiResponseModelCrear));
            }
            catch (Exception exception)
            {
                apiResponseModelCrear.Model = false;
                apiResponseModelCrear.StatusIsSuccessful = false;
                apiResponseModelCrear.ResponseCode = HttpStatusCode.InternalServerError;
                return ResponseMessage(Request.CreateResponse(apiResponseModelCrear.ResponseCode, apiResponseModelCrear));
            }

        }
    }
}

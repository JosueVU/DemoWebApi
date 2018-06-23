using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using INEC.TEMA1.COMUN;
using System.Web.Http.Controllers;
using INEC.TEMA1.WebAPI.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Http;

namespace INEC.TEMA.PRUEBA_UNITARIA
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public async Task MetodoTodoUsuarios()
        {
            /*UsuarioController controller = new UsuarioController();
            controller.Request = new HttpRequestMessage();
            controller.Configuration = new HttpConfiguration();
            var result =controller.Get();
            var registerResponse = await result.Content.ReadAsAsync<List<USUARIO>>(); 
            Assert.IsTrue(registerResponse.Count >= 0);*/
        }

        [TestMethod]
        public async Task MetodoUnicoUsuario()
        {
            UsuarioController controller = new UsuarioController();
            controller.Request = new HttpRequestMessage();
            controller.Configuration = new HttpConfiguration();
            USUARIO usuario = new USUARIO();
            usuario.ID_USUARIO = 1;
            var result = controller.Get(1);
            var registerResponse = await result.Content.ReadAsAsync<USUARIO>();
            Assert.IsTrue(registerResponse.ID_USUARIO == 1);
        }

        [TestMethod]
        public async Task MetodoIngresarUsuario()
        {
            var controllerContext = new HttpControllerContext();
            controllerContext.Request = new HttpRequestMessage();
            controllerContext.RequestContext = new HttpRequestContext();
            controllerContext.Configuration = new HttpConfiguration();
            controllerContext.Request.Headers.Add("Accept", "application/xml");

            UsuarioController controller = new UsuarioController();
            controller.ControllerContext = controllerContext;

            USUARIO usuario = new USUARIO();
            usuario.NOMBRE_USUARIO = "Prueba";
            usuario.APELLIDO1_USUARIO = "001";
            usuario.APELLIDO2_USUARIO = "001";
            usuario.FECHA_NACIMIENTO_USUARIO =DateTime.Now;
            usuario.CODIGO_USUARIO = "001";
            //usuario.FOTO_USUARIO = File.ReadAllBytes(HttpContext.Current.Server.MapPath("~/Image/JetBox1.png"));
            usuario.FECHA_CREACION_USUARIO = DateTime.Now;
            usuario.CREACION_USUARIO = "001";
            var Resultado = controller.AgregarUsuario();
            var registerResponse = await Resultado.Content.ReadAsAsync<bool>();
            Assert.IsTrue(registerResponse == true);
        }

        [TestMethod]
        public void MetodoActualizarUsuario()
        {
        }

        [TestMethod]
        public void MetodoEliminarUsuario()
        {
        }
    }
}

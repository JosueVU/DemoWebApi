using INEC.TEMA1.COMUN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INEC.TEMA1.Proxy
{
    public class UsuarioProxy: ClientBase,IUsuarioProxy
    {
        private const string RegisterUriSeleccionaTodos = "api/UsuarioEscritorio";
        private const string RegisterUriSeleccionaUno = "api/UsuarioEscritorio/get";
        private const string RegisterUriActualiza = "api/UsuarioEscritorio/ActualizarUsuario";
        private const string RegisterUriInserta = "api/UsuarioEscritorio/AgregarUsuario";
        private const string RegisterUriElimina = "api/UsuarioEscritorio/EliminaUsuario";

        public UsuarioProxy(IApiProxy apiProxy) : base(apiProxy)
        {
        }

        public async Task<ApiResponse<List<USUARIO>>> ObtenerUsuarios()
        {
            var response = await ApiProxy.GetEncodedContentWithContext<USUARIO>(RegisterUriSeleccionaTodos, null);
            var registerResponse = await CreateJsonResponse<ApiResponse<List<USUARIO>>, List<USUARIO>>(response);
            return registerResponse;
        }

        public async Task<ApiResponse<USUARIO>> ObtenerUsuario(USUARIO model)
        {
            var response = await ApiProxy.GetEncodedContentWithContext<USUARIO>(RegisterUriSeleccionaUno, model);
            var registerResponse = await CreateJsonResponse<ApiResponse<USUARIO>, USUARIO>(response);
            return registerResponse;
        }

        public async Task<ApiResponse<bool>> GuardaUsuario(USUARIO model)
        {
            var response = await ApiProxy.PostJsonEncodedContentWithContext(RegisterUriInserta, model);
            var registerResponse = await CreateJsonResponse<ApiResponse<bool>, bool>(response);
            return registerResponse;
        }

        public async Task<ApiResponse<bool>> ActualizaUsuario(USUARIO model)
        {
            var response = await ApiProxy.PostJsonEncodedContentWithContext(RegisterUriActualiza, model);
            var registerResponse = await CreateJsonResponse<ApiResponse<bool>, bool>(response);
            return registerResponse;
        }

        public async Task<ApiResponse<bool>> EliminaUsuario(USUARIO model)
        {
            var response = await ApiProxy.PostJsonEncodedContentWithContext(RegisterUriElimina, model);
            var registerResponse = await CreateJsonResponse<ApiResponse<bool>, bool>(response);
            return registerResponse;
        }
    }
}

using INEC.TEMA1.COMUN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INEC.TEMA1.Proxy
{
    interface IUsuarioProxy
    {
        Task<ApiResponse<List<USUARIO>>> ObtenerUsuarios();
        Task<ApiResponse<USUARIO>> ObtenerUsuario(USUARIO viewModel);
        Task<ApiResponse<bool>> GuardaUsuario(USUARIO viewModel);
        Task<ApiResponse<bool>> ActualizaUsuario(USUARIO usuario);
        Task<ApiResponse<bool>> EliminaUsuario(USUARIO usuario);
    }
}

﻿using INEC.TEMA1.COMUN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INEC.TEMA1.ACCESO_DATOS.Interfaz
{
    public interface IUsuarioDatos
    {
        List<USUARIO> ObtenerUsuarios();
        USUARIO ObtenerUsuario(USUARIO usuario);
        bool GuardaUsuario(USUARIO usuario);
        bool GuardaUsuarioMasivo(List<USUARIO> usuario);
        bool ActualizaUsuario(USUARIO usuario);
        bool EliminaUsuario(USUARIO usuario);
    }
}

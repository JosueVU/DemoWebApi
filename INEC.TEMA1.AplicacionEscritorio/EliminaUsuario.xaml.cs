using INEC.TEMA1.COMUN;
using INEC.TEMA1.Proxy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace INEC.TEMA1.AplicacionEscritorio
{
    /// <summary>
    /// Interaction logic for EliminaUsuario.xaml
    /// </summary>
    public partial class EliminaUsuario : Window
    {
        private UsuarioProxy usuarioProxy = null;
        private USUARIO uSUARIO = null;
        private List<USUARIO> usuarioLista = null;
        private readonly ITokenContainer tokenContainer;

        public EliminaUsuario()
        {
            InitializeComponent();
            tokenContainer = new TokenContainer();
            var apiClient = new ApiProxy(HttpClientInstance.InstanceCommon, tokenContainer);
            usuarioProxy = new UsuarioProxy(apiClient);
            buttonID.Click += ButtonID_Click;
            buscar.Click += ButtonIDBsucar_Click;
            uSUARIO = new USUARIO();
            buscarId.Text = "";
            usuarioLista = new List<USUARIO>();
        }

        private async void ButtonID_Click(object sender, RoutedEventArgs e)
        {
            uSUARIO.ID_USUARIO = Convert.ToInt32(buscarId.Text);
            uSUARIO.NOMBRE_USUARIO = Nombre.Text;
            uSUARIO.APELLIDO1_USUARIO = Apellido1.Text;
            uSUARIO.APELLIDO2_USUARIO = Apellido2.Text;
            uSUARIO.CODIGO_USUARIO = CodigoUsuario.Text;
            uSUARIO.FECHA_NACIMIENTO_USUARIO = Convert.ToDateTime(fechaNacimiento.Text);
            uSUARIO.FECHA_CREACION_USUARIO = DateTime.Now;
            //uSUARIO.FOTO_USUARIO = Nombre.Text;
            var lista = await usuarioProxy.EliminaUsuario(uSUARIO);
            if (lista.StatusIsSuccessful)
            {
                if (lista.Model)
                {
                    MessageBox.Show("Se elimino con exito");
                }
                else
                {
                    MessageBox.Show("Error al eliminar usuarios");
                }

            }
            else
            {
                MessageBox.Show("Error al eliminar usuarios");
            }
        }

        private async void ButtonIDBsucar_Click(object sender, RoutedEventArgs e)
        {
            uSUARIO.ID_USUARIO = Convert.ToInt32(buscarId.Text);
            var lista = await usuarioProxy.ObtenerUsuario(uSUARIO);
            if (lista.StatusIsSuccessful)
            {
                Nombre.Text = lista.Model.NOMBRE_USUARIO;
                Apellido1.Text = lista.Model.APELLIDO1_USUARIO;
                Apellido2.Text = lista.Model.APELLIDO2_USUARIO;
                fechaNacimiento.Text = lista.Model.FECHA_NACIMIENTO_USUARIO.Value.ToLongDateString();
                CodigoUsuario.Text = lista.Model.CODIGO_USUARIO;
            }
            else
            {
                MessageBox.Show("Error al cargar usuarios");
            }
        }
    }
}

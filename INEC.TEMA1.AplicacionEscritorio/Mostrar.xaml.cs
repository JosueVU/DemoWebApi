using CSP.Common.Model.Class;
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
    /// Interaction logic for Mostrar.xaml
    /// </summary>
    public partial class Mostrar : Window
    {
        private UsuarioProxy usuarioProxy = null;
        private readonly ITokenContainer tokenContainer;
        public Mostrar()
        {
            InitializeComponent();
            tokenContainer = new TokenContainer();
            var apiClient = new ApiProxy(HttpClientInstance.InstanceCommon, tokenContainer);
            usuarioProxy = new UsuarioProxy(apiClient);
            ObtenerUsuario();
        }

        public async void ObtenerUsuario()
        {
            var lista = await usuarioProxy.ObtenerUsuarios();
            if (lista.StatusIsSuccessful)
            {
                datagrid1.ItemsSource = null;
                datagrid1.ItemsSource = lista.Model;
            }
            else
            {
                MessageBox.Show("Error al cargar usuarios");
            }
        }
    }
}

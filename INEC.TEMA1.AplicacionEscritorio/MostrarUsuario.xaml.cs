using INEC.TEMA1.COMUN;
using INEC.TEMA1.Proxy;
using System.Windows;
using System;
using System.Collections.Generic;

namespace INEC.TEMA1.AplicacionEscritorio
{
    /// <summary>
    /// Interaction logic for MostrarUsuario.xaml
    /// </summary>
    public partial class MostrarUsuario : Window
    {
        private UsuarioProxy usuarioProxy = null;
        private USUARIO uSUARIO = null;
        private List<USUARIO> usuarioLista = null;
        private readonly ITokenContainer tokenContainer;

        public MostrarUsuario()
        {
            InitializeComponent();
            tokenContainer = new TokenContainer();
            var apiClient = new ApiProxy(HttpClientInstance.InstanceCommon, tokenContainer);
            usuarioProxy = new UsuarioProxy(apiClient);
            buttonID.Click += ButtonID_Click;
            uSUARIO = new USUARIO();
            textBoxID.Text = "";
            usuarioLista = new List<USUARIO>();
        }

        private async void ButtonID_Click(object sender, RoutedEventArgs e)
        {
            uSUARIO.ID_USUARIO = Convert.ToInt32(textBoxID.Text);
            var lista = await usuarioProxy.ObtenerUsuario(uSUARIO);
            if (lista.StatusIsSuccessful)
            {
                usuarioLista.Clear();
                usuarioLista.Add(lista.Model);
                datagrid1.ItemsSource = null;
                datagrid1.ItemsSource = usuarioLista;
                
            }
            else
            {
                MessageBox.Show("Error al cargar usuarios");
            }
        }
    }
}

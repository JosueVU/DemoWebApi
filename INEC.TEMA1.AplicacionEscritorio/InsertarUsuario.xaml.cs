using INEC.TEMA1.COMUN;
using INEC.TEMA1.Proxy;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
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
    /// Interaction logic for InsertarUsuario.xaml
    /// </summary>
    public partial class InsertarUsuario : Window
    {
        private UsuarioProxy usuarioProxy = null;
        private USUARIO uSUARIO = null;
        private List<USUARIO> usuarioLista = null;
        private readonly ITokenContainer tokenContainer;

        public InsertarUsuario()
        {
            InitializeComponent();
            tokenContainer = new TokenContainer();
            var apiClient = new ApiProxy(HttpClientInstance.InstanceCommon, tokenContainer);
            usuarioProxy = new UsuarioProxy(apiClient);
            buttonID.Click += ButtonID_Click;
            loadImage.Click += ButtonLoad_Click;
            uSUARIO = new USUARIO();
            
            usuarioLista = new List<USUARIO>();
        }

        private async void ButtonID_Click(object sender, RoutedEventArgs e)
        {
            uSUARIO.NOMBRE_USUARIO = Nombre.Text;
            uSUARIO.APELLIDO1_USUARIO = Apellido1.Text;
            uSUARIO.APELLIDO2_USUARIO = Apellido2.Text;
            uSUARIO.CODIGO_USUARIO = CodigoUsuario.Text;
            uSUARIO.FECHA_NACIMIENTO_USUARIO = Convert.ToDateTime(fechaNacimiento.Text);
            uSUARIO.FECHA_CREACION_USUARIO = DateTime.Now;
           
            //uSUARIO.FOTO_USUARIO = Nombre.Text;
            var lista = await usuarioProxy.GuardaUsuario(uSUARIO);
            if (lista.StatusIsSuccessful)
            {
                /*usuarioLista.Clear();
                usuarioLista.Add(lista.Model);
                datagrid.ItemsSource = null;
                datagrid.ItemsSource = usuarioLista;*/
                if (lista.Model)
                {
                    MessageBox.Show("Se creo con exito");
                }
                else {
                    MessageBox.Show("Error al crear usuarios");
                }
                

            }
            else
            {
                MessageBox.Show("Error al cargar usuarios");
            }
        }

        private void ButtonLoad_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            op.Title = "Select a picture";
            op.Filter = "All supported graphics|*.jpg;*.jpeg;*.png|" +
              "JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|" +
              "Portable Network Graphic (*.png)|*.png";
            if (op.ShowDialog() == true)
            {
                JpegBitmapEncoder encoder = new JpegBitmapEncoder();
                encoder.Frames.Add(BitmapFrame.Create(new BitmapImage(new Uri(op.FileName))));
                using (MemoryStream ms = new MemoryStream())
                {
                    encoder.Save(ms);
                    uSUARIO.FOTO_USUARIO = ms.ToArray();
                }
            }
        }
    }


}

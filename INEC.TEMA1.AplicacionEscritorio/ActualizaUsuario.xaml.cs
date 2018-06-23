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
    /// Interaction logic for ActualizaUsuario.xaml
    /// </summary>
    public partial class ActualizaUsuario : Window
    {
        private UsuarioProxy usuarioProxy = null;
        private USUARIO uSUARIO = null;
        private List<USUARIO> usuarioLista = null;
        private readonly ITokenContainer tokenContainer;

        public ActualizaUsuario()
        {
            InitializeComponent();
            tokenContainer = new TokenContainer();
            var apiClient = new ApiProxy(HttpClientInstance.InstanceCommon, tokenContainer);
            usuarioProxy = new UsuarioProxy(apiClient);
            buttonID.Click += ButtonID_Click;
            buscar.Click += ButtonIDBsucar_Click;
            loadImage.Click += ButtonLoad_Click;
            uSUARIO = new USUARIO();
            buscarId.Text = "";
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
            var lista = await usuarioProxy.ActualizaUsuario(uSUARIO);
            if (lista.StatusIsSuccessful)
            {
                if (lista.Model)
                {
                    MessageBox.Show("Se actualizo con exito");
                }
                else
                {
                    MessageBox.Show("Error al actualizar usuarios");
                }

            }
            else
            {
                MessageBox.Show("Error al actualizar usuarios");
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
                BitmapImage biImg = new BitmapImage();
                MemoryStream ms = new MemoryStream(lista.Model.FOTO_USUARIO);
                biImg.BeginInit();
                biImg.StreamSource = ms;
                biImg.EndInit();
                ImageSource imgSrc = biImg as ImageSource;
                image.Source = biImg;
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

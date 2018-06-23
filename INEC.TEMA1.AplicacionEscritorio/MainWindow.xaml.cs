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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace INEC.TEMA1.AplicacionEscritorio
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        

        public MainWindow()
        {
            InitializeComponent();
            MenuItem menuUsuarioMostrar = new MenuItem();

            menuUsuarioMostrar.Header = "Mostrar Usuarios";
            menuUsuarioMostrar.Click += mnuNew_Click;
            menuUsuarioMostrar.Height = 25;

            this.menu1.Items.Add(menuUsuarioMostrar);

            MenuItem menuUsuariosMostrar = new MenuItem();
            menuUsuariosMostrar.Click += mnuNew_Click1;
            menuUsuariosMostrar.Header = "Mostrar Usuario";

            menuUsuariosMostrar.Height = 25;

            this.menu1.Items.Add(menuUsuariosMostrar);

            MenuItem menuUsuariosInsertar = new MenuItem();
            
            menuUsuariosInsertar.Header = "Insertar Usuarios";

            menuUsuariosInsertar.Height = 25;

            menuUsuariosInsertar.Click += mnuNew_Click2;

            this.menu1.Items.Add(menuUsuariosInsertar);

            MenuItem menuUsuariosActualizar = new MenuItem();
            menuUsuariosActualizar.Click += mnuNew_Click3;
            menuUsuariosActualizar.Header = "Actualizar Usuarios";

            menuUsuariosActualizar.Height = 25;

            this.menu1.Items.Add(menuUsuariosActualizar);

            MenuItem menuUsuariosEliminar = new MenuItem();
            menuUsuariosEliminar.Click += mnuNew_Click4;
            menuUsuariosEliminar.Header = "Eliminar Usuarios";

            menuUsuariosEliminar.Height = 25;

            this.menu1.Items.Add(menuUsuariosEliminar);

        }

        private void mnuNew_Click(object sender, RoutedEventArgs e)
        {
            Mostrar win2 = new Mostrar();
            win2.Show();
        }

        private void mnuNew_Click1(object sender, RoutedEventArgs e)
        {
            MostrarUsuario win2 = new MostrarUsuario();
            win2.Show();
        }

        private void mnuNew_Click2(object sender, RoutedEventArgs e)
        {
            InsertarUsuario win2 = new InsertarUsuario();
            win2.Show();
        }

        private void mnuNew_Click3(object sender, RoutedEventArgs e)
        {
            ActualizaUsuario win2 = new ActualizaUsuario();
            win2.Show();
        }

        private void mnuNew_Click4(object sender, RoutedEventArgs e)
        {
            EliminaUsuario win2 = new EliminaUsuario();
            win2.Show();
        }
    }
}

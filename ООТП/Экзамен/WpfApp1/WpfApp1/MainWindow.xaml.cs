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

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        static Style BaseStyle = new Style();

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Style tbStyle1 = (Style)tb1.FindResource("ColorStyleYellow");
            BaseStyle = tbStyle1;
            tb1.Style = tbStyle1;
            tb2.Style = tbStyle1;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Style tbStyle1 = (Style)tb1.FindResource("ColorStyleBlack");
            BaseStyle = tbStyle1;
            tb1.Style = tbStyle1;
            tb2.Style = tbStyle1;
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            Style tbStyle1 = new Style();
            tbStyle1.BasedOn = BaseStyle;
            tbStyle1.TargetType = typeof(TextBox);
            tbStyle1.Setters.Add(new Setter { Property = Control.FontFamilyProperty, Value = new FontFamily("Verdana") }); ;
            tb1.Style = tbStyle1;
            tb2.Style = tbStyle1;
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            Style tbStyle1 = new Style();
            tbStyle1.BasedOn = BaseStyle;
            tbStyle1.TargetType = typeof(TextBox);
            tbStyle1.Setters.Add(new Setter { Property = Control.FontFamilyProperty, Value = new FontFamily("Broadway") }); ;
            tb1.Style = tbStyle1;
            tb2.Style = tbStyle1;
        }
    }
}

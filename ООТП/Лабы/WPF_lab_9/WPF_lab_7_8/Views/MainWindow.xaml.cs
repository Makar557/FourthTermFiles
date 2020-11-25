using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using WPF_lab_7_8.Models;

namespace WPF_lab_7_8
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        AppHistory history;
        public ObservableCollection<TODOEl> tasks;


        public MainWindow()
        {
            InitializeComponent();

            //history = new AppHistory(tasks.ToList());

        }

        private void Button5_Click(object sender, RoutedEventArgs e)
        {
            TB.Text = TB.Text + "sender: " + sender.ToString() + "\n";
            TB.Text = TB.Text + "source: " + e.Source.ToString() + "\n\n";
        }
    }
}

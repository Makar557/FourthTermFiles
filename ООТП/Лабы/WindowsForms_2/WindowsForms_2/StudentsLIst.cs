using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;
using System.Xml;
using System.IO;

namespace WindowsForms_2
{
    public partial class StudentsList : Form
    {
        List<Student> list;
        public StudentsList(List<Student> _students)
        {
            InitializeComponent();
            list = _students;
        }

        private void Outrut_Button_Click(object sender, EventArgs e)
        {
            ListBox.Items.Clear();
            if (list.Count() != 0)
            {
                foreach(Student st in list)
                {
                    ListBox.Items.Add(st.lastName);

                }

            }
            else
            {
                ListBox.Items.Add("Список пуст.");
            }
        }

        private void OutputData_Button_Click(object sender, EventArgs e)
        {
            OutputData_Label.Text = "";

            if (ListBox.SelectedItem!=null)
            {
                string a = ListBox.SelectedItem.ToString();

                if (a != null && a.Length != 0)
                {
                    foreach (Student st in list)
                    {
                        if (st.lastName == a)
                            OutputData_Label.Text += st.ToString();


                    }
                }
            }


        }
    }
}

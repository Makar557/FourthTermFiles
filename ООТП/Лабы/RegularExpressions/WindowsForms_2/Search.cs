using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using System.IO;
using System.Xml.Serialization;
using System.ComponentModel.DataAnnotations;


namespace WindowsForms_2
{
    public partial class Search : Form
    {
        List<Student> list;
        List<Student> _searchResult;
        string _regexString = "";

        public Search(List<Student> _students)
        {
            InitializeComponent();
            list = _students;
            _searchResult = new List<Student>();
            foreach (Student st in list)
            {
                ComboBox.Items.Add(st.lastName);
            }
        }

        private void Search_Button_Click(object sender, EventArgs e)
        {
            if(ComboBox.SelectedItem != null)
            {
                SearchResult_Label.Text = "";

                if (ComboBox.SelectedItem != null)
                {
                    string a = ComboBox.SelectedItem.ToString();

                    if (a != null && a.Length != 0)
                    {
                        foreach (Student st in list)
                        {
                            if (st.lastName == a)
                                SearchResult_Label.Text += st.ToString();
                        }
                    }
                }
            }
        }

        private void Specialty_Button_Click(object sender, EventArgs e)
        {
            _regexString = @"\w{4}";

            if (Regex.IsMatch(Specialty_TextBox.Text, _regexString))
            {
                if (Specialty_TextBox.Text != "")
                {
                    _searchResult.Clear();
                    ListBox.Items.Clear();
                    SearchResult_Label.Text = "";
                    Course_TextBox.Text = "";
                    AverageMark_TextBox.Text = "";

                    foreach (Student st in list)
                    {
                        if (st.specialty.ToLower().Contains(Specialty_TextBox.Text.ToLower()))
                        {
                            ListBox.Items.Add(st.lastName);
                            _searchResult.Add(st);
                        }

                    }
                    if (ListBox.Items.Count == 0)
                    {
                        MessageBox.Show("Совпадений не найдено.");
                    }
                }
                else
                {
                    MessageBox.Show("Введите строку.");
                }
            }
            else
            {
                MessageBox.Show("Введите корректное значение.");
            }

        }


        private void Course_Button_Click(object sender, EventArgs e)
        {
            _regexString = @"[1-4]{1}";

            if (Regex.IsMatch(Course_TextBox.Text, _regexString))
            {

                if (Course_TextBox.Text != "")
                {
                    _searchResult.Clear();
                    ListBox.Items.Clear();
                    SearchResult_Label.Text = "";
                    Specialty_TextBox.Text = "";
                    AverageMark_TextBox.Text = "";

                    foreach (Student st in list)
                    {
                        if (st.course == Convert.ToInt32(Course_TextBox.Text))
                        {
                            ListBox.Items.Add(st.lastName);
                            _searchResult.Add(st);
                        }

                    }
                    if (ListBox.Items.Count == 0)
                    {
                        MessageBox.Show("Совпадений не найдено.");
                    }
                }
                else
                {
                    MessageBox.Show("Введите строку.");
                }
            }
            else
            {
                MessageBox.Show("Введите корректное значение.");
            }

        }
        private void AverageMark_Button_Click(object sender, EventArgs e)
        {
            _regexString = @"[2-9]{1}";

            if (Regex.IsMatch(AverageMark_TextBox.Text, _regexString))
            {
                if (AverageMark_TextBox.Text != "")
                {
                    _searchResult.Clear();
                    ListBox.Items.Clear();
                    SearchResult_Label.Text = "";
                    Specialty_TextBox.Text = "";
                    Course_TextBox.Text = "";

                    foreach (Student st in list)
                    {
                        if (st.averageMark >= Convert.ToInt32(AverageMark_TextBox.Text))
                        {
                            ListBox.Items.Add(st.lastName);
                            _searchResult.Add(st);
                        }

                    }
                    if (ListBox.Items.Count == 0)
                    {
                        MessageBox.Show("Совпадений не найдено.");
                    }
                }
                else
                {
                    MessageBox.Show("Введите строку.");
                }
            }
            else
            {
                MessageBox.Show("Введите корректное значение.");
            }

        }

        private void ListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ListBox.SelectedItem != null)
            {
                foreach (Student st in list)
                {
                    if (st.lastName.ToLower().Contains(ListBox.SelectedItem.ToString().ToLower()))
                    {
                        SearchResult_Label.Text = $"{st.ToString()}";
                    }

                }
            }            
        }

        private void Specialty_RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            _searchResult.Clear();
                var orderedResult = from el in list
                                    orderby el.specialty
                                    select el;

                ListBox.Items.Clear();
                foreach (Student st in orderedResult)
                { 
                    ListBox.Items.Add(st.lastName);
                    _searchResult.Add(st);

                }
                   
        }

        private void Course_RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            _searchResult.Clear();
            var orderedResult = from el in list
                                orderby el.course
                                select el;

            ListBox.Items.Clear();
            foreach (Student st in orderedResult)
            {
                ListBox.Items.Add(st.lastName);
                _searchResult.Add(st);
            }
                
        }

        private void AVG_RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            _searchResult.Clear();
            var orderedResult = from el in list
                                orderby el.averageMark
                                select el;

            ListBox.Items.Clear();
            foreach (Student st in orderedResult)
            {
                ListBox.Items.Add(st.lastName);
                _searchResult.Add(st);
            }
        }

        private void Save_Button_Click(object sender, EventArgs e)
        {
            using (FileStream fs = new FileStream(@"search_results.xml", FileMode.Create))
            {
                XmlSerializer formatter = new XmlSerializer(typeof(List<Student>));
                formatter.Serialize(fs, _searchResult);
            }

            MessageBox.Show("Saved!");
        }
    }
}

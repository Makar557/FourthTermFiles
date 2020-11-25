using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;
using System.Xml.Serialization;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {

        ListOfButtons lob;

        int[] arr;
        Random random = new Random();

        public Form1()
        {
            InitializeComponent();

            lob = new ListOfButtons();

            arr = new int[10];
            for(int i=0; i<10; i++)
            {
                arr[i] = random.Next(0, 10);
            }
            for (int i = 0; i < 10; i++)
            {
                listView1.Items.Add(Convert.ToString(i));
            }
            for (int i = 0; i < 10; i++)
            {
                listView2.Items.Add(Convert.ToString(arr[i]));
            }
        }


        // для номера телефона
        private void button1_Click(object sender, EventArgs e)
        {
            if (!Regex.IsMatch(textBox1.Text, @"^\+37529\d{7}") && !Regex.IsMatch(textBox1.Text, @"^\+37533\d{7}"))
            {
                textBox1.Text = "";
                MessageBox.Show("Введите корректный номер оператора МТС.");
            }
            else
            {
                MessageBox.Show("Ура!");
            }
        }




        // для листа кнопок
        private void Add_Click(object sender, EventArgs e)
        {
            Button button = new Button();
            button.Location = new Point(Convert.ToInt32(x.Text), Convert.ToInt32(y.Text));
            button.Height = Convert.ToInt32(h.Text);
            button.Width = Convert.ToInt32(w.Text);
            button.Text = name.Text;
            this.Controls.Add(button);

            listBox1.Items.Add(id.Text + "  " + name.Text);
            lob.list.Add(new Buttons(Convert.ToInt32(id.Text), name.Text, Convert.ToInt32(x.Text), Convert.ToInt32(y.Text), Convert.ToInt32(h.Text), Convert.ToInt32(w.Text)));

            XmlSerializer xmlSerializer = new XmlSerializer(lob.GetType());
            using (FileStream fstream = new FileStream("xml.xml", FileMode.OpenOrCreate))
            {
                xmlSerializer.Serialize(fstream, lob);
            }
        }



        /// поиск в массиве
        private void Find_Click(object sender, EventArgs e)
        {
            Value.Text = arr.Max().ToString();
            for (int i = 0; i < 10; i++)
            {
                if (arr[i] == arr.Max())
                {
                    idValue.Text = i.ToString();
                    return;
                }
            }

        }
    }

    [Serializable]
    public class Buttons
    {
        public int id;
        public string name;
        public int x;
        public int y;
        public int h;
        public int w;
        Buttons()
        {

        }
        public Buttons(int id, string n, int x, int y, int h, int w)
        {
            this.id = id;
            this.name = n;
            this.x = x;
            this.y = y;
            this.h = h;
            this.w = w;
        }
    }

    [Serializable]
    public class ListOfButtons
    {
        public ListOfButtons()
        {

        }
        public List<Buttons> list = new List<Buttons>();
    }

}


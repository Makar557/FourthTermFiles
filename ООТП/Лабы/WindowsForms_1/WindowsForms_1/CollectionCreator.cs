using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms_1
{
    public partial class CollectionCreator : Form
    {
        static public Random rand;
        public static List<Cyrcle> cyrcles;
        short counterOfElements = 0;

        public class Cyrcle : IComparable<Cyrcle>
        {
            public int radius { get; set; }
            public Cyrcle()
            {
                radius = rand.Next(0, 200);
            }

            public override string ToString()
            {
                return $"Радиус круга: {radius}";
            }
            public int CompareTo(Cyrcle _cyrcle)
            {
                return this.radius.CompareTo(_cyrcle.radius);
            }
        }



        public CollectionCreator()
        {
            InitializeComponent();
            cyrcles = new List<Cyrcle>();
            rand = new Random();
        }

        private void buttonGeneration_Click(object sender, EventArgs e)
        {
            cyrcles.Clear();
            if ((int)NumericUpDown.Value > 0)
            {
                int counter = (int)NumericUpDown.Value;
                while (counter != 0)
                {
                    cyrcles.Add(new Cyrcle());
                    counter--;
                }

                AddElemsToOutputCollection();
                RequestLabel.Text = $"Сгенерированно {cyrcles.Count} элемента(ов).";
            }
            else
                RequestLabel.Text = "Коллекция пуста.";
        }

        private void AddElemsToOutputCollection()
        {
            ListBox1.Items.Clear();
            ListBox1.Items.AddRange(cyrcles.ToArray());
        }


        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            cyrcles.Clear();
        }

        private void buttonClear_Click(object sender, EventArgs e)
        {
            if (cyrcles.Count == 0)
            {
                RequestLabel.Text = "Коллекция пуста.";
                cyrcles.Clear();
                ListBox1.Items.Clear();
            }
            else
            {
                cyrcles.Clear();
                ListBox1.Items.Clear();
                RequestLabel.Text = "Коллекция очищена.";
            }

        }

        private void buttonAscSort_Click(object sender, EventArgs e)
        {
            if(cyrcles.Count==0)
            {
                RequestLabel.Text = "Коллекция пуста.";
            }
            else if(cyrcles.Count==1)
            {
                RequestLabel.Text = "В коллекции 1 элемент.";
            }
            else
            {
                cyrcles.Sort();
                AddElemsToOutputCollection();
                RequestLabel.Text = "Сортировка по возрастанию выполнена успехно.";
            }

        }

        private void buttonDescSort_Click(object sender, EventArgs e)
        {
            if (cyrcles.Count == 0)
            {
                RequestLabel.Text = "Коллекция пуста.";
            }
            else if (cyrcles.Count == 1)
            {
                RequestLabel.Text = "В коллекции 1 элемент.";
            }
            else
            {
                cyrcles = cyrcles.OrderByDescending(c => c.radius).ToList();
                AddElemsToOutputCollection();
                RequestLabel.Text = "Сортировка по умолчанию выполнена успехно.";
            }
        }

        private void buttonMinValue_Click(object sender, EventArgs e)
        {
            if (cyrcles.Count == 0)
            {
                RequestLabel.Text = "Коллекция пуста.";
            }
            else if (cyrcles.Count == 1)
            {
                RequestLabel.Text = "В коллекции 1 элемент.";
            }
            else
            {
                RequestLabel.Text = $"Мин. радиус: {cyrcles.Min(c=>c.radius)}";
            }
        }

        private void buttonMaxValue_Click(object sender, EventArgs e)
        {
            if (cyrcles.Count == 0)
            {
                RequestLabel.Text = "Коллекция пуста.";
            }
            else if (cyrcles.Count == 1)
            {
                RequestLabel.Text = "В коллекции 1 элемент.";
            }
            else
            {
                RequestLabel.Text = $"Макс. радиус: {cyrcles.Max(c => c.radius)}";
            }
        }

        private void buttonAvgValue_Click(object sender, EventArgs e)
        {
            if (cyrcles.Count == 0)
            {
                RequestLabel.Text = "Коллекция пуста.";
            }
            else if (cyrcles.Count == 1)
            {
                RequestLabel.Text = "В коллекции 1 элемент.";
            }
            else
            {
                RequestLabel.Text = $"Ср. значение: {cyrcles.Average(c => c.radius)}";
            }
        }
    }
}

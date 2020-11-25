using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;
using System.Xml;
using System.IO;


namespace WindowsForms_2
{
    public partial class Students : Form
    {
        internal List<Student> studentsList;
        public Students()
        {
            InitializeComponent();
            studentsList = new List<Student>();

            XmlSerializer xmlFormat = new XmlSerializer(studentsList.GetType());
            using (FileStream fstream = new FileStream(@"D:\Университет\4sem\ООТП\Лабы\WindowsForms_2\Students.xml", FileMode.Open))
            {
                studentsList = (List<Student>)xmlFormat.Deserialize(fstream);
            }

            AverageMark_TrackBar.ValueChanged += AverageMark_TrackBar_ValueChanged;

            DateOfBirth_DateTimePicker.Value = DateOfBirth_DateTimePicker.MinDate;
        }

        private void AverageMark_TrackBar_ValueChanged(object sender, EventArgs e)
        {
            AverageMarkFinal_Label.Text = "";
            AverageMarkFinal_Label.Text = AverageMark_TrackBar.Value.ToString();
        }

        private void OpenForm_Button_Click(object sender, EventArgs e)
        {
                Thread StudentListThread = new Thread(() => Application.Run(new StudentsList(studentsList)));
                StudentListThread.Start();
                StudentListThread.Join();
        }

        private void SaveForm_Button_Click(object sender, EventArgs e)
        {
            if (LastName_MaskedTextBox.Text.Length==0)
            {
                MessageBox.Show("Введите фамилию.");
                return;
            }
            if (FirstName_MaskedTextBox.Text.Length == 0)
            {
                MessageBox.Show("Введите имя.");
                return;
            }
            if (TrirdName_MaskedTextBox.Text.Length == 0)
            {
                MessageBox.Show("Введите отчество.");
                return;
            }
            if (Age_MaskedTextBox.Text.Length == 0)
            {
                MessageBox.Show("Введите возраст.");
                return;
            }
            if (DateOfBirth_DateTimePicker.Value == DateOfBirth_DateTimePicker.MinDate)
            {
                MessageBox.Show("Выберите дату.");
                return;
            }
            if (AverageMarkFinal_Label.Text.Length == 0)
            {
                MessageBox.Show("Выберите средний балл.");
                return;
            }
            if (City_MaskedTextBox.Text.Length == 0)
            {
                MessageBox.Show("Введите город.");
                return;
            }
            if (Index_MaskedTextBox.Text.Length == 0)
            {
                MessageBox.Show("Введите индекс.");
                return;
            }
            if (Street_MaskedTextBox.Text.Length == 0)
            {
                MessageBox.Show("Введите улицу.");
                return;
            }
            if (House_MaskedTextBox.Text.Length == 0)
            {
                MessageBox.Show("Введите номер дома.");
                return;
            }
            if (Apartment_MaskedTextBox.Text.Length == 0)
            {
                MessageBox.Show("Введите номер квартиры.");
                return;
            }
            if(IfWork_CheckBox.Checked)
            {
                if (Company_MaskedTextBox.Text.Length == 0)
                {
                    MessageBox.Show("Введите название компании.");
                    return;
                }
                if (Position_MaskedTextBox.Text.Length == 0)
                {
                    MessageBox.Show("Введите свою должность.");
                    return;
                }
                if (Experience_MaskedTextBox.Text.Length == 0)
                {
                    MessageBox.Show("Введите свой стаж работы.");
                    return;
                }
            }

            int course = 0;
            string specialty = "";
            string sex = "";
            
            if (FirstCourse_RadioButton.Checked) course = Convert.ToInt32(FirstCourse_RadioButton.Text);
            if (SecondCourse_RadioButton.Checked) course = Convert.ToInt32(SecondCourse_RadioButton.Text);
            if (ThirdCourse_RadioButton.Checked) course = Convert.ToInt32(ThirdCourse_RadioButton.Text);
            if (FourthCourse_RadioButton4.Checked) course = Convert.ToInt32(FourthCourse_RadioButton4.Text);

            if(course==0)
            {
                MessageBox.Show("Выберите курс.");
                return;
            }

            if (ITSSpecialty_RadioButton.Checked) specialty = ITSSpecialty_RadioButton.Text;
            if (ISTSpecialty_RadioButton.Checked) specialty = ISTSpecialty_RadioButton.Text;
            if (DEWPSpecialty_RadioButton.Checked) specialty = DEWPSpecialty_RadioButton.Text;
            if (MISSSpecialty_RadioButton.Checked) specialty = MISSSpecialty_RadioButton.Text;

            if (specialty.Length == 0)
            {
                MessageBox.Show("Выберите специальность.");
                return;
            }

            if (Male_RadioButton.Checked) sex = "мужской";
            if (Female_RadioButton.Checked) sex = "женский";

            if (sex.Length == 0)
            {
                MessageBox.Show("Выберите пол.");
                return;
            }

            if(IfWork_CheckBox.Checked)
            {

                studentsList.Add(new Student(LastName_MaskedTextBox.Text, FirstName_MaskedTextBox.Text,
                    TrirdName_MaskedTextBox.Text, Convert.ToInt32(Age_MaskedTextBox.Text), DateOfBirth_DateTimePicker.Value,
                    AverageMark_TrackBar.Value, course, specialty, sex, new Adress(City_MaskedTextBox.Text,
                    Convert.ToInt32(Index_MaskedTextBox.Text), Street_MaskedTextBox.Text,
                    Convert.ToInt32(House_MaskedTextBox.Text), Convert.ToInt32(Apartment_MaskedTextBox.Text)),
                    new Work(Company_MaskedTextBox.Text, Position_MaskedTextBox.Text, Convert.ToInt32(Experience_MaskedTextBox.Text))));


            }
            else
            {
                studentsList.Add(new Student(LastName_MaskedTextBox.Text, FirstName_MaskedTextBox.Text,
                    TrirdName_MaskedTextBox.Text, Convert.ToInt32(Age_MaskedTextBox.Text), DateOfBirth_DateTimePicker.Value,
                    AverageMark_TrackBar.Value, course, specialty, sex, new Adress(City_MaskedTextBox.Text,
                    Convert.ToInt32(Index_MaskedTextBox.Text), Street_MaskedTextBox.Text,
                    Convert.ToInt32(House_MaskedTextBox.Text), Convert.ToInt32(Apartment_MaskedTextBox.Text)),
                    new Work("---", "---", 0)));
            }

            XmlSerializer xmlFormat = new XmlSerializer(studentsList.GetType());
            using (FileStream fstream = new FileStream(@"D:\Университет\4sem\ООТП\Лабы\WindowsForms_2\Students.xml", FileMode.OpenOrCreate))
            {
                xmlFormat.Serialize(fstream, studentsList);
            }
        }
    }
}

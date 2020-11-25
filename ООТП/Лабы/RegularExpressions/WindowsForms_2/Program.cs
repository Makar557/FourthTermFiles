using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms_2
{
    public class IndexAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value != null)
            {
                int Index = Convert.ToInt32( value.ToString());
                if (!Index.ToString().StartsWith("0"))
                    return true;
                else
                    this.ErrorMessage = "Индекс не может начинаться с 0.";
            }
            return false;
        }
    }





    [Serializable]
    public class Student
    {
        public Student()
        {
            lastName = "";
            firstName = "";
            thirdName = "";
            age = 0;
            dateTime = new DateTime();
            averageMark = 0;
            course = 0;
            sex = "";
            specialty = "";
            adress = new Adress();
            work = new Work();
        }
        public Student(string _lastName, string _firstName, string _thirdName,
        int _age, DateTime _dateTime, int _averageMark, int _course, string _sex,
        string _specialty, Adress _adress, Work _work)
        {
            lastName = _lastName;
            firstName = _firstName;
            thirdName = _thirdName;
            age = _age;
            dateTime = _dateTime;
            averageMark = _averageMark;
            course = _course;
            sex = _sex;
            specialty = _specialty;
            adress = _adress;
            work = _work;
        }

        public string lastName;            
        public string firstName;
        public string thirdName;
        public int age;
        public DateTime dateTime;
        public int averageMark;
        public int course;
        public string sex;
        public string specialty;
        public Adress adress;
        public Work work;

        public override string ToString()
        {
            string a;
            a = $"Фамилия: {lastName}\r\nИмя: {firstName}\r\nОтчество: {thirdName}\r\nВозраст: {age}\r\nДата рождения: {dateTime}\r\n";
            a += $"Средняя оценка: {averageMark}\r\nКурс: {course}\r\nСпециальность: {specialty}\r\nПол: {sex}";
            a += adress.ToString();
            a += work.ToString();
            return a;
        }

    }
    [Serializable]
    public class Adress
    {
        public Adress()
        {
            city = "";
            index = 0;
            street = "";
            house = 0;
            apartment = 0;
        }
        public Adress(string _city, int _index, string _street, int _house, int _appartment)
        {
            city = _city;
            index = _index;
            street = _street;
            house = _house;
            apartment = _appartment;
        }
        public string city;
        int index;

        [Index]
        public int Index
        {
            get => index;
            set => index = value;
        }
        public string street;
        public int house;
        public int apartment;
        public override string ToString()
        {
            string a = $"\r\nГород: {city}\r\nИндекс: {index}\r\nУлица: {street}\r\nНомер дома: {house}\r\nНомер квартиры: {apartment}";
            return a;
        }
    }
    [Serializable]
    public class Work
    {
        public Work()
        {
            company = "";
            position = "";
            experience = 0;
        }
        public Work(string _company, string _position, int _experience)
        {
            company = _company;
            position = _position;
            experience = _experience;
        }
        public string company;
        public string position;
        public int experience;

        public override string ToString()
        {
            string a = $"\r\nКомпания: {company}\r\nДолжность: {position}\r\nСтаж: {experience}";
            return a;
        }
    }

    static class Program
    {
        /// <summary>
        /// Главная точка входа для приложения.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Students());
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.IO;
using System.Xml.Serialization;

namespace WPF_lab_7_8.Models
{
    [Serializable]
    public class TODOEl : INotifyPropertyChanged
    {
        public TODOEl()
        {
            ShortName = "";
            Discription = "";
            Category = "";
            Date = DateTime.Today;
            Priority = "";
            Periodicity = "";
            Complited = false;
        }
        public TODOEl(TODOEl value)
        {
            ShortName = value.shortName;
            Discription = value.discription;
            Category = value.category;
            Priority = value.priority;
            Periodicity = value.periodicity;
            Complited = false;
            Date = new DateTime(value.date.Ticks);
            Index = value.index;
        }

        int index = 0;
        public int Index { get { return index; } set { index = value; OnPropertyChanged(); } }

        string shortName;
        public string ShortName { get { return shortName; } set { shortName = value; OnPropertyChanged(); } }

        string discription;
        public string Discription { get { return discription; } set { discription = value; OnPropertyChanged(); } }

        string category;
        public string Category { get { return category; } set { category = value; OnPropertyChanged(); } }

        DateTime date;
        public DateTime Date { get { return date; } set { date = value; OnPropertyChanged(); } }

        string dateToString;
        public string DateToString { get { return date.ToShortDateString(); } set { dateToString = value; OnPropertyChanged(); } }

        string priority;
        public string Priority { get { return priority; } set { priority = value; OnPropertyChanged(nameof(Priority)); } }

        string periodicity;
        public string Periodicity { get { return periodicity; } set { periodicity = value; OnPropertyChanged(nameof(Periodicity)); } }

        bool complited;
        public bool Complited { get { return complited; } set { complited = value; OnPropertyChanged(nameof(Complited)); } }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName]string property = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(property));
        }
    }
}

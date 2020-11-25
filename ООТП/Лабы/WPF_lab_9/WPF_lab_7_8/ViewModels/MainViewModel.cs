using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using WPF_lab_7_8.Models;
using System.IO;
using System.Xml.Serialization;
using System.Collections.ObjectModel;
using System.Globalization;

namespace WPF_lab_7_8.ViewModels
{
    // OnPropertyChanged();
    class MainViewModel : INotifyPropertyChanged
    {

        AppHistory history;



        public MainViewModel()
        {

            AddTaskWidth = 0;
            ChangeTaskWidth = 0;
            FilterWidth = 0;
            TemplEl = new TODOEl();
            TemplElForADD = new TODOEl();
            TemplElForEDIT = new TODOEl();
            TemplElForFILTER = new TODOEl();
            TODOElementsList = new ObservableCollection<TODOEl>();


            XmlSerializer xmlFormat = new XmlSerializer(todoElementsList.GetType());
            using (FileStream fstream = new FileStream(@"TODOElementsList.xml", FileMode.Open))
            {
                todoElementsList = (ObservableCollection<TODOEl>)xmlFormat.Deserialize(fstream);
            }

            history = new AppHistory(TODOElementsList.ToList());

        }

        TODOEl templEl;
        public TODOEl TemplEl { get { return templEl; } set { templEl = value; OnPropertyChanged(); } }

        TODOEl templElForADD;   
        public TODOEl TemplElForADD { get { return templElForADD; } set { templElForADD = value; OnPropertyChanged(); } }

        TODOEl templElForEDIT;
        public TODOEl TemplElForEDIT { get { return templElForEDIT; } set { templElForEDIT = value; OnPropertyChanged(); } }

        TODOEl templElForFILTER;
        public TODOEl TemplElForFILTER { get { return templElForFILTER; } set { templElForFILTER = value; OnPropertyChanged(); } }

        ObservableCollection<TODOEl> todoElementsList;
        public ObservableCollection<TODOEl> TODOElementsList { get { return todoElementsList; } set { todoElementsList = value; OnPropertyChanged(); } }

        //////   появление и скрытие окон     ////////////////////////////////////////////////////////////////////////////////////////////////////

        double addTaskWidth;  //для окна добавления
        public double AddTaskWidth { get { return addTaskWidth; }  set { addTaskWidth = value; OnPropertyChanged(); } }

        double changeTaskWidth;  //для окна изменения
        public double ChangeTaskWidth { get { return changeTaskWidth; } set { changeTaskWidth = value; OnPropertyChanged(); } }

        double filterWidth;  //для окна фильтра
        public double FilterWidth { get { return filterWidth; } set { filterWidth = value; OnPropertyChanged(); } }

        ///  чекбоксы для фильтра      //////////////////////////////////////////////////////////////////////////////////////////////////
        
        bool shortNameCheck;
        public bool ShortNameCheck { get { return shortNameCheck; } set { shortNameCheck = value; OnPropertyChanged(); } }

        bool categoryCheck;
        public bool CategoryCheck { get { return categoryCheck; } set { categoryCheck = value; OnPropertyChanged(); } }

        bool dateCheck;
        public bool DateCheck { get { return dateCheck; } set { dateCheck = value; OnPropertyChanged(); } }

        bool priorityCheck;
        public bool PriorityCheck { get { return priorityCheck; } set { priorityCheck = value; OnPropertyChanged(); } }

        bool periodicityCheck;
        public bool PeriodicityCheck { get { return periodicityCheck; } set { periodicityCheck = value; OnPropertyChanged(); } }

        ///////  обработчики кнопок ///////////////////////////////////////////////////////////////////////////////////////////

        public ICommand AddTaskWindow //открыть добавление таска
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    ChangeTaskWidth = 0;
                    FilterWidth = 0;
                    switch (AddTaskWidth)
                    {
                        case 0:
                            { AddTaskWidth = 250; } break;
                        case 250:
                            { AddTaskWidth = 0; } break;
                    }
                });
            }
        }  

        public ICommand AddTask //добавление таска
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    if (TemplElForADD.ShortName.Length == 0)
                    {
                        MessageBox.Show("Введите название.");
                        return;
                    }
                    if (TemplElForADD.Discription.Length == 0)
                    {
                        MessageBox.Show("Введите описание.");
                        return;
                    }
                    if (TemplElForADD.Category.Length == 0)
                    {
                        MessageBox.Show("Выберите категорию.");
                        return;
                    }
                    if (TemplElForADD.Priority.Length == 0)
                    {
                        MessageBox.Show("Выберите приоритет.");
                        return;
                    }
                    if (TemplElForADD.Periodicity.Length == 0)
                    {
                        MessageBox.Show("Выберите периодичность.");
                        return;
                    }

                    TemplElForADD.Index = TODOElementsList.Count();
                    TODOElementsList.Add(new TODOEl(TemplElForADD));
                    SerializeTasks();
                    AddTaskWidth = 0;
                    MessageBox.Show("Задание добавлено.");
                    ClearTemplElForADD();
                    ClearTemplEl();
                    history.AddState(TODOElementsList.ToList());
                });
            }
        }
        void ClearTemplEl()
        {
            TemplEl.ShortName = "";
            TemplEl.Discription = "";
            TemplEl.Category = "";
            TemplEl.Priority = "";
            TemplEl.DateToString = "";
            TemplEl.Periodicity = "";
        }
        void ClearTemplElForADD()
        {
            TemplElForADD.ShortName = "";
            TemplElForADD.Discription = "";
            TemplElForADD.Category = "";
            TemplElForADD.Priority = "";
            TemplElForADD.DateToString = "";
            TemplElForADD.Periodicity = "";
        }
        void ClearTemplElForEDIT()
        {
            TemplElForEDIT.ShortName = "";
            TemplElForEDIT.Discription = "";
            TemplElForEDIT.Category = "";
            TemplElForEDIT.Priority = "";
            TemplElForEDIT.DateToString = "";
            TemplElForEDIT.Periodicity = "";
        }
        public ICommand ChangeTask // изменение таска
        {
            get
            {
                return new DelegateCommand(obj =>
                {

                    foreach(TODOEl td in TODOElementsList)
                    {
                        if(td.Index == TemplElForEDIT.Index)
                        {
                            td.ShortName = TemplElForEDIT.ShortName;
                            td.Discription = TemplElForEDIT.Discription;
                            td.Category = TemplElForEDIT.Category;
                            td.Priority = TemplElForEDIT.Priority;
                            td.DateToString = TemplElForEDIT.DateToString;
                            td.Periodicity = TemplElForEDIT.Periodicity;
                        }
                    }

                    SerializeTasks();
                    ChangeTaskWidth = 0;
                    MessageBox.Show("Задание редактировано.");
                    ClearTemplElForEDIT();

                    history.AddState(TODOElementsList.ToList());

                });
            }
        }
        public ICommand ChangeTaskWindow //открыть изменение таска
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    if (TemplEl.ShortName == "")
                    {
                        MessageBox.Show("Выберите задание для редактирования.");
                        return;
                    }
                    TemplElForEDIT = new TODOEl(TemplEl);

                    AddTaskWidth = 0;
                    FilterWidth = 0;
                    switch (ChangeTaskWidth)
                    {
                        case 0:
                            { ChangeTaskWidth = 250;} break;
                        case 250:
                            { ChangeTaskWidth = 0; } break;
                    }

                });
            }
        }
        public ICommand FilterTaskWidth
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    AddTaskWidth = 0;
                    ChangeTaskWidth = 0;
                    switch (FilterWidth)
                    {
                        case 0:
                            { FilterWidth = 250; }  break;
                        case 250:
                            { FilterWidth = 0;
                                XmlSerializer xmlFormat = new XmlSerializer(todoElementsList.GetType());
                                using (FileStream fstream = new FileStream(@"TODOElementsList.xml", FileMode.Open))
                                {
                                    TODOElementsList = (ObservableCollection<TODOEl>)xmlFormat.Deserialize(fstream);
                                }

                                ShortNameCheck = false;
                                CategoryCheck = false;
                                PriorityCheck = false;
                                PeriodicityCheck = false;
                                DateCheck = false;

                                TemplElForFILTER.ShortName = "";
                                TemplElForFILTER.Category = "";
                                TemplElForFILTER.Periodicity = "";
                                TemplElForFILTER.Priority = "";
                                TemplElForFILTER.Date = DateTime.Now;

                            }   break;
                    }

                });
            }
        }

        public ICommand FilterTask
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    XmlSerializer xmlFormat = new XmlSerializer(todoElementsList.GetType());
                    using (FileStream fstream = new FileStream(@"TODOElementsList.xml", FileMode.Open))
                    {
                        TODOElementsList = (ObservableCollection<TODOEl>)xmlFormat.Deserialize(fstream);
                    }

                    IEnumerable<TODOEl> filterResult = from el in TODOElementsList select el;

                    if (ShortNameCheck)
                    {
                        filterResult = from el in filterResult where el.ShortName.Contains(TemplElForFILTER.ShortName) select el;
                    }

                    if (CategoryCheck)
                    {
                        filterResult = from el in filterResult where el.Category.Contains(TemplElForFILTER.Category) select el;
                    }

                    if (PriorityCheck)
                    {
                        filterResult = from el in filterResult where el.Priority.Contains(TemplElForFILTER.Priority) select el;
                    }

                    if (PeriodicityCheck)
                    {
                        filterResult = from el in filterResult where el.Periodicity.Contains(TemplElForFILTER.Periodicity) select el;
                    }

                    if (DateCheck)
                    {
                        if (DateCheck)
                            filterResult = from el in filterResult where el.Date.ToString().Contains(TemplElForFILTER.Date.ToString()) select el;
                    }

                   // TODOElementsList.Clear();
                    //foreach(TODOEl el in filterResult)
                    //{
                    //    TODOElementsList.Add(el);
                    //}

                    TODOElementsList = new ObservableCollection<TODOEl>(filterResult);
                    history.AddState(TODOElementsList.ToList());

                });
            }
        }
        public ICommand DeleteTask
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    if (TemplEl.ShortName == "")
                    {
                        MessageBox.Show("Выберите задание для удаления.");
                        return;
                    }
                    MessageBoxResult result = MessageBox.Show("Уверены?", "Удаление", MessageBoxButton.YesNo);
                    if (result == MessageBoxResult.Yes)
                        TODOElementsList.Remove(TemplEl);
                    TemplEl = new TODOEl();
                    history.AddState(TODOElementsList.ToList());

                });
            }
        }
        void SerializeTasks()
        {
            using (FileStream fs = new FileStream(@"TODOElementsList.xml", FileMode.Truncate))
            {
                XmlSerializer formatter = new XmlSerializer(typeof(ObservableCollection<TODOEl>));
                formatter.Serialize(fs, todoElementsList);
            }
        }

        public ICommand Language_EN
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    App.Language = new CultureInfo("EN");
                });
            }
        }
        public ICommand Language_RU
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    App.Language = new CultureInfo("RU");
                });
            }
        }

        public ICommand Pink
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    string style = "PinkTheme";
                    // определяем путь к файлу ресурсов
                    var uri = new Uri(style + ".xaml", UriKind.Relative);
                    // загружаем словарь ресурсов
                    ResourceDictionary resourceDict = Application.LoadComponent(uri) as ResourceDictionary;
                    // очищаем коллекцию ресурсов приложения
                    Application.Current.Resources.Clear();
                    // добавляем загруженный словарь ресурсов
                    Application.Current.Resources.MergedDictionaries.Add(resourceDict);

                });
            }
        }

        public ICommand LightBlue
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    string style = "LightBlueTheme";
                    // определяем путь к файлу ресурсов
                    var uri = new Uri(style + ".xaml", UriKind.Relative);
                    // загружаем словарь ресурсов
                    ResourceDictionary resourceDict = Application.LoadComponent(uri) as ResourceDictionary;
                    // очищаем коллекцию ресурсов приложения
                    Application.Current.Resources.Clear();
                    // добавляем загруженный словарь ресурсов
                    Application.Current.Resources.MergedDictionaries.Add(resourceDict);
                });
            }
        }

        public ICommand Undo
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    Memento nullCheck = history.Undo();
                    if (nullCheck != null)
                    {
                        TODOElementsList.Clear();

                        foreach (TODOEl t in nullCheck.tasksState)
                        {
                            TODOElementsList.Add(t);
                        }
                    }    
                });
            }
        }

        public ICommand Redo
        {
            get
            {
                return new DelegateCommand(obj =>
                {
                    Memento nullCheck = history.Redo();
                    if (nullCheck != null)
                    {
                        TODOElementsList.Clear();

                        foreach (TODOEl t in nullCheck.tasksState)
                        {
                            TODOElementsList.Add(t);
                        }
                    }
                });
            }
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged([CallerMemberName]string property = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(property));
        }
    }
}

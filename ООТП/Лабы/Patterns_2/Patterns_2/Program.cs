using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Patterns_2
{
    class Program
    {
        static void Main(string[] args)
        {
            ///Adapter

            Adaptee adaptee1 = new Adaptee();
            Adapter a = new Adapter(adaptee1);
            a.DoSomething();

            ///

            Console.WriteLine("---------------------------------------");

            BelarussianPizza belPizza = new BelarussianPizza();
            MushroomsPizza belPizzaWithMushrooms = new MushroomsPizza(belPizza);
            belPizzaWithMushrooms.PrintPizza();


            ///

            Console.WriteLine("---------------------------------------");

            Folder folder1 = new Folder("MyFolder1");
            File file1 = new File("File1"); 
            File file2 = new File("File2");
            File file3 = new File("File3");
            File file4 = new File("File4");
            folder1.AddComponent(file1, file2, file3, file4);
            folder1.PrintComponentName();
            Console.WriteLine();
            folder1.RemoveComponent(file2, file3);
            folder1.PrintComponentName();
        }
    }
}

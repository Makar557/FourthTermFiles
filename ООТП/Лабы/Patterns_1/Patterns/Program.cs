using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace Patterns
{
    class Program
    {
        static void Main(string[] args)
        {
            ///Singlton

            Thread thread1 = new Thread(() =>
              {
                  forTest("test1");
              });
            Thread thread2 = new Thread(() =>
            {
                forTest("test2");
            });

            thread1.Start();
            thread2.Start();
            thread1.Join();
            thread2.Join();

            ///Prototype

            Person Liza = new Person(19, "Liza", 123);
            Person LizaClone = Liza.DeepCopy();
            Console.WriteLine(LizaClone.name);

            ///Abstaract Method

            new Client().Main();

            ///Builder

            var mainCook1 = new MainCook();
            var worldOfSalads1 = new WorldOfSalads();
            mainCook1.NewSalad = worldOfSalads1;


            Console.WriteLine("Test full vegetable salad");
            mainCook1.FullVegetableSalad();
            Console.WriteLine(worldOfSalads1.GetSalad().PrintIngredients());

        }

        public static void forTest(string value)
        {
            Singlton singlton = Singlton.getInctance(value);
            Console.WriteLine(singlton.value);

        }
    }
}

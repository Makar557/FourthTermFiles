// давать более правильныеии подробные имена

using System;
using System.Collections.Generic;

namespace Patterns
{
    public interface IAbstractFactory
    {
        IAbdtractDress CreateDress();
        IAbstractSkirt CreateSkirt();
        IAbstractBlouse CreateBlouse();
    }

    class Lacoste : IAbstractFactory
    {
        public IAbdtractDress CreateDress()
        {
            return new LacosteDress();
        }
        public IAbstractSkirt CreateSkirt()
        {
            return new LacosteSkirt();
        }
        public IAbstractBlouse CreateBlouse()
        {
            return new LacosteBlouse();
        }
    }

    class Medicine : IAbstractFactory
    {
        public IAbdtractDress CreateDress()
        {
            return new MedicineDress();
        }
        public IAbstractSkirt CreateSkirt()
        {
            return new MedicineSkirt();
        }
        public IAbstractBlouse CreateBlouse()
        {
            return new MedicineBlouse();
        }
    }

    public interface IAbdtractDress
    {
        void Something();
    }
    public interface IAbstractSkirt
    {
        void Something();
    }
    public interface IAbstractBlouse
    {
        void Something();
    }

    class LacosteDress : IAbdtractDress
    {
        public void Something()
        {
            Console.WriteLine("Dress from Lacoste");
        }
    }
    class LacosteSkirt : IAbstractSkirt
    {
        public void Something()
        {
            Console.WriteLine("Skirt from Lacoste");
        }
    }
    class LacosteBlouse : IAbstractBlouse
    {
        public void Something()
        {
            Console.WriteLine("Blouse from Lacoste");
        }
    }

    class MedicineDress : IAbdtractDress
    {
        public void Something()
        {
            Console.WriteLine("Dress from Medicine");
        }
    }
    class MedicineSkirt : IAbstractSkirt
    {
        public void Something()
        {
            Console.WriteLine("Skirt from Medicine");
        }
    }
    class MedicineBlouse : IAbstractBlouse
    {
        public void Something()
        {
            Console.WriteLine("Blouse from Medicine");
        }
    }


    class Client
    {
        public void Main()
        {
            Console.WriteLine("Lacoste or Medicine? (1 or 2)");
            int choice1 = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("How many?");
            int choice2 = Convert.ToInt32(Console.ReadLine());
            switch (choice1)
            {
                case 1: { CreateSomething(new Lacoste(), choice2); } break;
                case 2: { CreateSomething(new Medicine(), choice2); } break;
                default: Console.WriteLine("Ошибка! Перезапускай прогу!"); break;
            }     
        }
        static void CreateSomething(IAbstractFactory abstractFactory, int howMany)
        {
            Random rand = new Random();

            while (howMany-- != 0)
            {
                switch (rand.Next(1, 3))
                {
                    case 1: abstractFactory.CreateDress().Something(); break;
                    case 2: abstractFactory.CreateSkirt().Something(); break;
                    case 3: abstractFactory.CreateBlouse().Something(); break;
                }
            }
        }
    }


}
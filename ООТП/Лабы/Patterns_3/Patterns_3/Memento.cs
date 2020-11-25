using System;
using System.Collections.Generic;

namespace Patterns_3
{
    class Hero
    {
        int patrons;
        public Hero()
        {
            patrons = 5;
        }

        public void Shoot()
        {
            if (patrons > 0)
            {
                patrons--;
                Console.WriteLine($"Герой выстрелил. Патронов осталось {patrons}.");
            }
            else Console.WriteLine("Патроны закончились.");
        }
        public HeroMomento SaveState()
        {
            Console.WriteLine("Состояние сохранено.");
            return new HeroMomento(patrons);
        }
        public void RestoreState(HeroMomento _heroMomento)
        {
            patrons = _heroMomento.Patrons;
            Console.WriteLine("Состояние восстановлено.");
        }
        public void Statictic()
        {
            Console.WriteLine($"Количество патронов: {patrons}");
        }
    }
    class HeroMomento
    {
        public int Patrons { get; private set; }
        public HeroMomento(int _patrons)
        {
            Patrons = _patrons;
        }
    }
    class History
    {
        public Stack<HeroMomento> stackHistory { get; private set; }
        public History()
        {
            stackHistory = new Stack<HeroMomento>();
        }
    }

}
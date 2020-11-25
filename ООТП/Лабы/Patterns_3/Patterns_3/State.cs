using System;

namespace Patterns_3
{
    interface IManState
    {
        void SitDown(Man _man);
        void StandUp(Man _man);
        void Fly(Man _man);
    }

    class Man
    {
        public IManState State;
        public Man(IManState _state)
        {
            State = _state;
        }
        public void SitDown()
        {
            State.SitDown(this);
        }
        public void StandUp()
        {
            State.StandUp(this);
        }
        public void Fly()
        {
            State.Fly(this);
        }
    }
    class SitDownMan : IManState
    {
        public void SitDown(Man _man)
        {
            Console.WriteLine("Персонаж уже сидит.");
        }
        public void StandUp(Man _man)
        {
            Console.WriteLine("Персонаж встал.");
            _man.State = new StandUpMan();
        }
        public void Fly(Man _man)
        {
            Console.WriteLine("Персонаж не может взлететь, т.к. он сидит.");
        }
    }
    class StandUpMan : IManState
    {
        public void SitDown(Man _man)
        {
            Console.WriteLine("Персонаж сел.");
            _man.State = new SitDownMan();
        }
        public void StandUp(Man _man)
        {
            Console.WriteLine("Персонаж уже стоит.");
        }
        public void Fly(Man _man)
        {
            Console.WriteLine("Персонаж взлетел.");
            _man.State = new FlyMan();
        }
    }
    class FlyMan : IManState
    {
        public void SitDown(Man _man)
        {
            Console.WriteLine("Персонаж в воздухе. Действие невозможно.");
        }
        public void StandUp(Man _man)
        {
            Console.WriteLine("Персонаж приземлился.");
            _man.State = new StandUpMan();
        }
        public void Fly(Man _man)
        {
            Console.WriteLine("Персонаж уже летит.");
        }
    }

}
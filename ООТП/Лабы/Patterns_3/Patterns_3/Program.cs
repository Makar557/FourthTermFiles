using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Patterns_3
{
    class Program
    {
        static void Main(string[] args)
        {
            /// Command

            Pult pult = new Pult();
            pult.SetCommand(new TVOnCommand(new TV()));
            pult.PressButton();
            pult.PressUndo();

            /// State

            Man man1 = new Man(new StandUpMan());
            man1.Fly();

            ///Momento

            Hero hero1 = new Hero();
            hero1.Shoot();
            HeroMomento heroMomento1 = hero1.SaveState();
            History history1 = new History();
            history1.stackHistory.Push(heroMomento1);
            hero1.Shoot();
            hero1.Shoot();
            hero1.RestoreState(history1.stackHistory.Pop());
            hero1.Statictic();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Patterns_2
{
    public interface ISomethingImportant
    {
        void DoSomething();
    }

    class Adaptee
    {
        public void DoSomethingSpecific()
        {
            Console.WriteLine("Это исходная функция. ");
        }
    }
    class Adapter : ISomethingImportant
    {
        private Adaptee adaptee;
        public Adapter(Adaptee _adaptee)
        {
            this.adaptee = _adaptee;
        }
        public void DoSomething()
        {
            adaptee.DoSomethingSpecific();
            Console.WriteLine("Это дополнительная функция адаптера.");
        }
    }
}

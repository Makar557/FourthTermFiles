using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace MP_1
{
    class Program
    {
        private const int CYCLE = 100_000;
        static void Main()
        {
            double v1 = 0, v2 = 0;
            Stopwatch time = new Stopwatch();

            time.Start();
            for (int i = 0; i < CYCLE; i++)
            {
                v1 += Auxil.IGet(-100, 100);
                v2 += Auxil.DGet(-100, 100);
            }
            time.Stop();

            Console.WriteLine($"Количество циклов: {CYCLE}");
            Console.WriteLine($"Среднее (int): {v1 / CYCLE}");
            Console.WriteLine($"Среднее (double): {v2 / CYCLE}");
            Console.WriteLine($"Потраченное время: {(float)time.ElapsedMilliseconds/1000} секунд");

            Console.ReadKey();
        }
    }
}

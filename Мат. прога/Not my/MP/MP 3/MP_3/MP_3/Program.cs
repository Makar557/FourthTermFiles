using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace MP_3
{
    class Program
    {
        static int countOfCity = 5;

        static void Main(string[] args)
        {
            Stopwatch sw = new Stopwatch();
            sw.Start();

            Salesman(countOfCity, 0);

            sw.Stop();
            Console.WriteLine($"Затраченное время: " + sw.Elapsed);
        }

        static string[] stroka = new string[Factorial(countOfCity)];
        static int position = 0;

        public static void Salesman(int count, int inf)
        {
            Console.WriteLine("Задача о коммивояжере");

            int[,] arrayOfCity = new int[5, 5] { { 999, 4, 23, 999, 2 }, { 2, 999, 17, 66, 82 }, { 4, 6, 999, 86, 51 }, { 19, 56, 8, 999, 6 }, { 91, 68, 52, 15, 999 } };

            for (int i = 0; i < count; i++)
            {
                for (int j = 0; j < count; j++)
                {
                    if (arrayOfCity[i, j] == 999)
                    {
                        Console.Write("INF ");
                    }
                    else
                    {
                        Console.Write(Convert.ToString(arrayOfCity[i, j]).PadLeft(3, ' ') + " ");
                    }
                }
                Console.WriteLine();
            }

            Console.WriteLine();

            SalesManPermutation(countOfCity);

            Console.WriteLine("==========================================");

            int min = Int32.MaxValue, minIndex = 0;
            for (int i = 0; i < stroka.Length; i++)
            {
                int sum = 0, isum = 0;
                for (int j = 0; j < stroka[i].Length - 1; j++)
                {
                    sum = sum + (arrayOfCity[Convert.ToInt32(stroka[i].Substring(j, 1)), Convert.ToInt32(stroka[i].Substring(j + 1, 1))]);
                    isum = i;
                }
                sum = sum + (arrayOfCity[Convert.ToInt32(stroka[i].Substring(stroka[i].Length - 1, 1)), Convert.ToInt32(stroka[i].Substring(0, 1))]);
                //Console.WriteLine(sum);
                if (sum < min)
                {
                    min = sum;
                    minIndex = isum;
                }
            }
            Console.WriteLine("Минимальное расстояние: " + min);
            Console.WriteLine("Путь коммивояжера: " + stroka[minIndex] + stroka[minIndex].Substring(0, 1));
        }
        public static void SalesManPermutation(int count)
        {
            int[] array = new int[count];
            for (int i = 0; i < count; i++)
            {
                array[i] = i;
            }

            SalesManPermutationRecursion(array);
            for (int i = 0; i < Factorial(countOfCity); i++)
            {
                //Console.WriteLine(stroka[i]);
            }
        }

        public static void SalesManPermutationRecursion(IList<int> array, string current = "")
        {
            for (int i = 0; i < array.Count; i++)
            {
                List<int> list = new List<int>(array);
                list.RemoveAt(i);
                SalesManPermutationRecursion(list, current + array[i]);
            }
            if (array.Count == 0)
            {
                stroka[position] = current;
                position++;
            }
        }

        public static long Factorial(int N)
        {
            long factotial = 1;
            if (N != 0)
            {
                for (int i = 2; i <= N; i++)
                {
                    factotial *= i;
                }
            }
            return factotial;
        }
    }
}

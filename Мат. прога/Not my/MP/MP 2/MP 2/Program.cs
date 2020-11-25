using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace MP_2
{
    class Program
    {
        static int shipCount = 4, shipChoice = 2;

        static string[] arrayOfCombination = new string[CountOfCombinatons(shipCount, shipChoice)];
        static int posOfCombination = 0;
        static string[] arrayOfPermutations = new string[CountOfCombinatons(shipCount, shipChoice) * Factorial(shipChoice)];
        static int posOfPermutation = 0;

        static void Main(string[] args)
        {
            Stopwatch sw = new Stopwatch();
            sw.Start();

            //ArraySubset(4);

            //Combination(4, 2);

            //Permutation(4);

            //Disposition(4, 2);

            Ship(shipCount, shipChoice);
            sw.Stop();
            Console.WriteLine($"Затраченное время: " + sw.Elapsed);
        }

        public static void ArraySubset(int count)
        {
            Console.WriteLine("Генератор подмножеств заданного множества");
            int countOfChoice = Convert.ToInt32(Math.Pow(2, count));
            for (int i = 0; i < countOfChoice; i++)
            {
                string binI = Convert.ToString(i, 2).PadLeft(count, '0');
                for (int j = 0; j < binI.Length; j++)
                {
                    if (binI[j] == '1')
                    {
                        Console.Write((j + 1) + " ");
                    }
                    else
                    {
                        Console.Write("- ");
                    }
                }
                Console.WriteLine();
            }
        }

        public static void Combination(int count, int choice)
        {
            Console.WriteLine("Генератор сочетаний");
            int countOfChoice = Convert.ToInt32(Math.Pow(2, count));
            for (int i = 0; i < countOfChoice; i++)
            {
                string binI = Convert.ToString(i, 2).PadLeft(count, '0');
                int findChoice = 0;
                for (int j = 0; j < binI.Length; j++)
                {
                    if (binI[j] == '1')
                    {
                        findChoice++;
                    }
                }
                if (findChoice == choice)
                {
                    for (int j = 0; j < binI.Length; j++)
                    {
                        if (binI[j] == '1')
                        {
                            Console.Write((j + 1) + " ");
                        }
                        else
                        {
                            Console.Write("- ");
                        }
                    }
                    Console.WriteLine();
                }
            }
        }

        public static void Permutation(int count)
        {
            Console.WriteLine("Генератор перестановок");
            int[] array = new int[count];
            for (int i = 0; i < count; i++)
            {
                array[i] = i;
            }
            PermutationRecursion(array);
        }

        public static void PermutationRecursion(IList<int> array, string current = "")
        {
            if (array.Count == 0)
            {
                Console.WriteLine(current);
                return;
            }
            for (int i = 0; i < array.Count; i++)
            {
                List<int> list = new List<int>(array);
                list.RemoveAt(i);
                PermutationRecursion(list, current + array[i].ToString() + " ");
            }
        }

        public static void Disposition(int count, int choice)
        {
            Console.WriteLine("Генератор размещений");
            int countOfChoice = Convert.ToInt32(Math.Pow(2, count));
            for (int i = 0; i < countOfChoice; i++)
            {
                string binI = Convert.ToString(i, 2).PadLeft(count, '0');
                int findChoice = 0;
                for (int j = 0; j < binI.Length; j++)
                {
                    if (binI[j] == '1')
                    {
                        findChoice++;
                    }
                }
                if (findChoice == choice)
                {
                    int[] array = new int[choice];
                    int k = 0;
                    for (int j = 0; j < binI.Length; j++)
                    {
                        if (binI[j] == '1')
                        {
                            array[k] = j + 1;
                            k++;
                        }
                    }
                    PermutationRecursion(array);
                }
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
        public static void Ship(int count, int choice)
        {
            int countOfChoice = Convert.ToInt32(Math.Pow(2, count));
            for (int i = 0; i < countOfChoice; i++)
            {
                string binI = Convert.ToString(i, 2).PadLeft(count, '0');
                int findChoice = 0;
                for (int j = 0; j < binI.Length; j++)
                {
                    if (binI[j] == '1')
                    {
                        findChoice++;
                    }
                }
                if (findChoice == choice)
                {
                    int index = 0;
                    for (int j = 0; j < binI.Length; j++)
                    {
                        if (binI[j] == '1')
                        {
                            arrayOfCombination[posOfCombination] = arrayOfCombination[posOfCombination] + j.ToString();
                            index++;
                        }
                    }
                    posOfCombination++;
                }
            }
            for (int i = 0; i < arrayOfCombination.Length; i++)
            {
                int[] array = new int[arrayOfCombination[i].Length];
                for (int j = 0; j < array.Length; j++)
                {
                    array[j] = Int32.Parse(arrayOfCombination[i].Substring(j, 1));
                }
                ShipPermutationRecursion(array);
            }


            Console.WriteLine("Задача о загрузке судна с центровкой");
            Random random = new Random();
            int[] weight = new int[count];
            int[] price = new int[count];
            int[] minWeight = new int[count];
            int[] maxWeight = new int[count];
            int[] priceSum = new int[arrayOfPermutations.Length];
            for (int i = 0; i < count; i++)
            {
                weight[i] = random.Next(100, 200);
                price[i] = random.Next(10, 100);
                minWeight[i] = random.Next(50, 120);
                maxWeight[i] = random.Next(150, 850);
            }
            Console.Write("Вектор веса: ( ");
            foreach (int elem in weight)
            {
                Console.Write(elem + " ");
            }
            Console.Write(")\nВектор стоимости: ( ");
            foreach (int elem in price)
            {
                Console.Write(elem + " ");
            }
            Console.Write(")\nВектор минимального веса: ( ");
            foreach (int elem in minWeight)
            {
                Console.Write(elem + " ");
            }
            Console.Write(")\nВектор максимального веса: ( ");
            foreach (int elem in maxWeight)
            {
                Console.Write(elem + " ");
            }
            Console.WriteLine(")");

            for (int i = 0; i < arrayOfPermutations.Length; i++)
            {
                for (int j = 0; j < arrayOfPermutations[i].Length; j++)
                {
                    if (weight[Int32.Parse(arrayOfPermutations[i].Substring(j, 1))] > minWeight[Int32.Parse(arrayOfPermutations[i].Substring(j, 1))] &&
                        weight[Int32.Parse(arrayOfPermutations[i].Substring(j, 1))] < maxWeight[Int32.Parse(arrayOfPermutations[i].Substring(j, 1))])
                    {
                        priceSum[i] = priceSum[i] + price[Int32.Parse(arrayOfPermutations[i].Substring(j, 1))];
                    }
                }
            }
            int maxIndex = 0;
            for (int i = 0; i < arrayOfPermutations.Length; i++)
            {
                if (priceSum[i] == priceSum.Max())
                {
                    maxIndex = i;
                }
            }
            Console.WriteLine("Максимальная прибыль: " + priceSum.Max());
            Console.WriteLine("Вектор загруженности судна: " + arrayOfPermutations[maxIndex]);
        }

        public static int CountOfCombinatons(int count, int choice)
        {
            return (int)(Factorial(count) / (Factorial(choice) * (Factorial(count - choice))));
        }

        public static void ShipPermutationRecursion(IList<int> array, string current = "")
        {
            for (int i = 0; i < array.Count; i++)
            {
                List<int> list = new List<int>(array);
                list.RemoveAt(i);
                ShipPermutationRecursion(list, current + array[i]);
            }
            if (array.Count == 0)
            {
                arrayOfPermutations[posOfPermutation] = current;
                posOfPermutation++;
            }
        }
    }
}

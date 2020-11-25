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
        static int countOfCity = 12;

        static int shipCount = 8, shipChoice = 5;

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

            //Backpack(20);

            //Salesman(countOfCity, 3);

            Ship(shipCount, shipChoice);

            //for (int i = 0; i < arrayOfPermutations.Length; i++)
            //{
            //    Console.WriteLine(arrayOfPermutations[i]);
            //}

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

        public static void Backpack(int count)
        {
            Console.WriteLine("Задача о рюкзаке");
            int maxCapacity = 300;
            Random random = new Random();
            int[] capacity = new int[count];
            int[] price = new int[count];
            for (int i = 0; i < count; i++)
            {
                capacity[i] = random.Next(10, 300);
                price[i] = random.Next(5, 55);
            }
            Console.Write("Максимальная вместимость: " + maxCapacity + "\nВектор вместимости: ( ");
            foreach (int elem in capacity)
            {
                Console.Write(elem + " ");
            }
            Console.Write(")\nВектор стоимости: ( ");
            foreach (int elem in price)
            {
                Console.Write(elem + " ");
            }
            Console.WriteLine(")");

            int allComb = Convert.ToInt32(Math.Pow(2, count));
            string[] bin = new string[allComb];
            int[] capacitySum = new int[allComb];
            int[] priceSum = new int[allComb];

            for (int i = 0; i < allComb; i++)
            {
                bin[i] = Convert.ToString(i, 2).PadLeft(count, '0');
                char[] combination = new char[bin[i].Length];
                for (int k = 0; k < combination.Length; k++)
                {
                    combination[k] = bin[i][k];
                }

                int pos = 0;
                for (int j = combination.Length - 1; j >= 0; j--)
                {
                    if (combination[j] == '1')
                    {
                        capacitySum[i] += capacity[pos];
                        priceSum[i] += price[pos];
                    }
                    else
                    {
                        capacitySum[i] += 0;
                        priceSum[i] += 0;
                    }
                    pos++;
                }
                if (capacitySum[i] > maxCapacity)
                {
                    capacitySum[i] = 0;
                    priceSum[i] = 0;
                }
                else Console.WriteLine(bin[i] + " : " + capacitySum[i] + " : " + priceSum[i]);
            }

            int max = capacitySum[0];
            int index = 0;

            for (int k = 0; k < capacitySum.Length; k++)
            {
                if (priceSum[k] > max)
                {
                    max = priceSum[k];
                    index = k;
                }
            }

            for (int i = 0; i < allComb; i++)
            {
                if (priceSum[i] == max)
                {
                    Console.WriteLine("Результат:\nВектор вещей: " + bin[i] + "\nВместимость: " + capacitySum[i] + "\nЦена: " + priceSum[i]);
                }
            }
        }

        static string[] stroka = new string[Factorial(countOfCity)];
        static int position = 0;

        public static void Salesman(int count, int inf)
        {
            Console.WriteLine("Задача о коммивояжере");

            Random random = new Random();
            int[,] arrayOfCity = new int[count, count];
            for (int i = 0; i < count; i++)
            {
                for (int j = 0; j < count; j++)
                {
                    if (i == j)
                    {
                        arrayOfCity[i, i] = 0;
                    }
                    else
                    {
                        arrayOfCity[i, j] = random.Next(10, 300);
                    }
                }
            }
            for (int i = 0; i < inf; i++)
            {
                arrayOfCity[random.Next(0, count - 1), random.Next(0, count - 1)] = 999;
            }

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

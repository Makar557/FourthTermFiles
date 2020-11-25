using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace MP_4
{
    class Program
    {
        const int N = 6;

        static void Main(string[] args)
        {
            string first = "Сом";
            string second = "Домик";

            Stopwatch sw = new Stopwatch();
            sw.Start();

            //Console.WriteLine("Первая строка S1(300): " + RandomString(300));
            //Console.WriteLine("Вторая строка S2(250): " + RandomString(250));

            Console.WriteLine("(Рекурсия) Дистанция Левенштейна для слов АБВГДЕЁЖЗИЙКЛМН и абвгдеёжзийклмн : " + LevensteinRecursion("АБВГДЕЁЖЗИЙКЛМН", "абвгдеёжзийклмн"));
            //Console.WriteLine("(Динамика) Дистанция Левенштейна для слов АБВГДЕЁЖЗИЙКЛ и абвгдеёжзийкл : " + LevensteinDynamic("АБВГДЕЁЖЗИЙКЛ", "абвгдеёжзийкл"));

            //Console.WriteLine("(Рекурсия) Дистанция Левенштейна для слов " + first + " и " + second + " : " + LevensteinRecursion(first, second));
            //Console.WriteLine("(Динамика) Дистанция Левенштейна для слов " + first + " и " + second + " : " + LevensteinDynamic(first, second));

            //MatrixRecursion();
            //MatrixDynamic();

            sw.Stop();
            Console.WriteLine($"Затраченное время: " + sw.Elapsed);
            
        }
        public static string RandomString(int n)
        {
            Random random = new Random();
            string alphabet = "ABCDEFGHIJKLMNOPWRSTUVWXYZabcdefghijklmnopwrstuvwxyz";
            string stroka = "";
            if (n != 0)
            {
                for (int i = 0; i < n; i++)
                {
                    stroka = stroka.Insert(stroka.Length, alphabet[random.Next(0, alphabet.Length)].ToString());
                }
            }
            return stroka;
        }

        public static int LevensteinRecursion(string first, string second)
        {
            if (first == second)
            {
                return 0;
            }
            if (first == "")
            {
                return second.Length;
            }
            if (second == "")
            {
                return first.Length;
            }
            else
            {
                int firstLenght = first.Length, secondLenght = second.Length;
                int[] result = new int[3];

                result[0] = LevensteinRecursion(first.Substring(0, firstLenght - 1), second) + 1;
                result[1] = LevensteinRecursion(first, second.Substring(0, secondLenght - 1)) + 1;
                result[2] = LevensteinRecursion(first.Substring(0, firstLenght - 1), second.Substring(0, secondLenght - 1))
                    + ((first[firstLenght - 1] == second[secondLenght - 1]) ? 0 : 1);

                return result.Min();
            }
        }

        public static int LevensteinDynamic(string first, string second)
        {
            int firstLenght = first.Length, secondLenght = second.Length;
            int[,] result = new int[(firstLenght + 1), (secondLenght + 1)];

            for (int i = 0; i <= firstLenght; i++)
            {
                result[i, 0] = i;
            }
            for (int j = 0; j <= secondLenght; j++)
            {
                result[0, j] = j;
            }
            for (int i = 1; i <= firstLenght; i++)
            {
                for (int j = 1; j <= secondLenght; j++)
                {
                    result[i, j] = GetMin(result[i - 1, j] + 1, result[i, j - 1] + 1,
                                   result[i - 1, j - 1] + (first[i - 1] == second[j - 1] ? 0 : 1));
                }
            }
            return result[firstLenght, secondLenght];
        }

        private static int GetMin(int x, int y, int z)
        {
            return
                (x < y && x < z) ? x :
                (y < x && y < z) ? y : z;
        }

        public static void MatrixRecursion()
        {
            int[] Mc = new int[N + 1] { 9, 12, 20, 23, 30, 40, 51 };
            int[,] Ms = new int[N, N];
            int result = 0;

            result = MatrixRecursionRecursion(1, N, N, Mc, Ms);
            Console.WriteLine("(Рекурсия) Задача о расстановке скобок при перемножении матриц\nРазмерности матриц: ");
            for (int i = 1; i <= N; i++)
            {
                Console.Write("(" + Mc[i - 1] + ", " + Mc[i] + ") ");
            }
            Console.WriteLine("\nМинимальное количество операций умножения: " + result);
            Console.WriteLine("Матрица S: ");
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < N; j++)
                {
                    Console.Write(Ms[i, j] + " ");
                }
                Console.WriteLine();
            }
        }

        public static int MatrixRecursionRecursion(int i, int j, int n, int[] c, int[,] s)
        {
            int result = Int32.MaxValue, tempResult = Int32.MaxValue;
            if (i < j)
            {
                for (int k = i; k < j; k++)
                {
                    tempResult = MatrixRecursionRecursion(i, k, n, c, s)
                        + MatrixRecursionRecursion(k + 1, j, n, c, s)
                        + c[i - 1] * c[k] * c[j];
                    if (tempResult < result)
                    {
                        result = tempResult;
                        s[i- 1, j - 1] = k;
                    }
                }
            }
            else
            {
                result = 0;
            }
            return result;
        }

        public static void MatrixDynamic()
        {
            int[] Mc = new int[N + 1] { 9, 12, 20, 23, 30, 40, 51 };
            int[,] Ms = new int[N, N];
            int result = 0;
            result = MatrixDynamicCicle(N, Mc, Ms);
            Console.WriteLine("(Динамика) Задача о расстановке скобок при перемножении матриц\nРазмерности матриц: ");
            for (int i = 1; i <= N; i++)
            {
                Console.Write("(" + Mc[i - 1] + ", " + Mc[i] + ") ");
            }
            Console.WriteLine("\nМинимальное количество операций умножения: " + result);
            Console.WriteLine("Матрица S: ");
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < N; j++)
                {
                    Console.Write(Ms[i, j] + " ");
                }
                Console.WriteLine();
            }
        }

        public static int MatrixDynamicCicle(int n, int[] c, int[,] s)
        {
            int[,] M = new int[n, n];
            int j = 0, q = 0;
            for (int i = 1; i <= n; i++)
            {
                s[i - 1, i - 1] = 0;
            }
            for (int l = 2; l <= n; l++)
            {
                for (int i = 1; i <= n - l + 1; i++)
                {
                    j = i + l - 1;
                    M[i - 1, j - 1] = Int32.MaxValue;
                    for (int k = i; k <= j - 1; k++)
                    {
                        q = M[i - 1, k - 1] + M[k, j - 1] + c[i - 1] * c[k] * c[j];
                        if (q < M[i - 1, j - 1])
                        {
                            M[i - 1, j - 1] = q;
                            s[i - 1, j - 1] = k;
                        }
                    }
                }
            }
            return M[0, n - 1];
        }
    }
}

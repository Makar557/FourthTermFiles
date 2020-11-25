using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MP_5
{
    class Program
    {
        static void Main(string[] args)
        {
            //AList();
            //AMatrix();

            int[,] matrix = new int[5, 5] { { 0, 1, 0, 0, 0 }, { 0, 0, 1, 1, 0 }, { 0, 0, 0, 1, 0 }, { 0, 0, 0, 0, 1 }, { 0, 0, 0, 0, 0 } };

            Console.WriteLine("Матрица смежности: ");
            for (int i = 0; i < 5; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    Console.Write(matrix[i, j]);
                }
                Console.WriteLine();
            }

            Console.WriteLine("Списки смежных вершин: ");
            for (int i = 0; i < 5; i++)
            {
                Console.Write("Вершина " + i + ": ");
                for (int j = 0; j < 5; j++)
                {
                    if(matrix[i, j] == 1)
                    {
                        Console.Write(j + " ");
                    }
                }
                Console.WriteLine();
            }

            BFS(matrix);

        }

        public static void AMatrix()
        {
            int[,] matrix = new int[5, 5] { { 0, 1, 0, 0, 0 }, { 0, 0, 1, 1, 0 }, { 0, 0, 0, 1, 0 }, { 0, 0, 0, 0, 1 }, { 0, 0, 0, 0, 0 } };

            for (int i = 0; i < 5; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    Console.Write(matrix[i, j]);
                }
                Console.WriteLine();
            }
        }

        public static void AList()
        {
            List<int> list = new List<int>();

            int[] one = { 0, 1, 0, 0, 0 };
            int[] two = { 0, 0, 1, 1, 0 };
            int[] three = { 0, 0, 0, 1, 0 };
            int[] four = { 0, 0, 0, 0, 1 };
            int[] five = { 0, 0, 0, 0, 0 };

            list.AddRange(one);
            list.AddRange(two);
            list.AddRange(three);
            list.AddRange(four);
            list.AddRange(five);

            int k = 1;
            foreach (int row in list)
            {
                Console.Write(row);
                if (k % 5 == 0)
                {
                    Console.WriteLine();
                }
                k++;
            }
        }

        public static void BFS(int[,] matrix)
        {
            Queue<int> q = new Queue<int>(5);
            int[] c = new int[5] { 0, 0, 0, 0, 0 };
            int[] d = new int[5] { -1, -1, -1, -1, -1 };
            int[] p = new int[5] { -1, -1, -1, -1, -1 };

            for (int i = 0; i < 5; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    if (matrix[i, j] == 1)
                    {
                        q.Enqueue(i);
                    }
                }
            }
        }
    }
}

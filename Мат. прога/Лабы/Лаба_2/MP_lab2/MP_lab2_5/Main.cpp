// --- main 
#include <iostream>
#include <iomanip> 
#include "Salesman.h"
#include "ctime"
#include "cstdlib"
#include <locale>


#define N 10
#define R rand() % 300 + 10 
#define R1 rand() % 9

using namespace std;
int main()
{
    setlocale(LC_ALL, "rus");

    srand((unsigned)time(NULL));


    int d[N][N];

 
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            d[i][j] = R;
            if (i == j)
                d[i][j] = INF;
        }
    }


    d[0][5] = INF;
    d[0][6] = INF;
    d[0][7] = INF;


    int r[N];                     // результат 
    int s = salesman(
        N,          // [in]  количество городов 
        (int*)d,          // [in]  массив [n*n] расстояний 
        r           // [out] массив [n] маршрут 0 x x x x  

    );
    cout << endl << "-- Задача коммивояжера -- ";
    cout << endl << "-- количество  городов: " << N;
    cout << endl << "-- матрица расстояний : ";
    for (int i = 0; i < N; i++)
    {
        cout << endl;
        for (int j = 0; j < N; j++)

            if (d[i][j] != INF) cout << setw(3) << d[i][j] << " ";

            else cout << setw(3) << "INF" << " ";
    }
    cout << endl << "-- оптимальный маршрут: ";
    for (int i = 0; i < N; i++) std::cout << r[i] << "-->"; cout << 0;
    cout << endl << "-- длина маршрута     : " << s;
    cout << endl;
    system("pause");
    return 0;
}

// --- main 
#include <iostream>
#include <iomanip> 
#include "Salesman.h"
#include "ctime"
#include "cstdlib"
#include <locale>


#define N 5
#define number 9

#define R rand() % 290 + 10 

using namespace std;
int main()
{
    setlocale(LC_ALL, "rus");

    srand((unsigned)time(NULL));
    clock_t  t1 = 0, t2 = 0;
    t1 = clock();                            // �������� ������� 


    int d[N][N] = { //0   1    2    3     4        
               {  INF,          number * 2,     21 + number,    INF,            number},    //  0
               { number,        INF,            number + 15,    68 - number,    84 - number},    //  1
               { 2 + number,    number * 3,     INF,            86,             49 + number},    //  2 
               { number + 17,   58 - number,    number * 4,     INF,            number * 3},    //  3
               { 93 - number,   number + 66,    52,             number + 13,    INF} };   //  4  



    int r[N];                     // ��������� 
    int s = salesman(
        N,          // [in]  ���������� ������� 
        (int*)d,          // [in]  ������ [n*n] ���������� 
        r           // [out] ������ [n] ������� 0 x x x x  

    );
    cout << endl << "-- ������ ������������ -- ";
    cout << endl << "-- ����������  �������: " << N;
    cout << endl << "-- ������� ���������� : ";
    for (int i = 0; i < N; i++)
    {
        cout << endl;
        for (int j = 0; j < N; j++)

            if (d[i][j] != INF) cout << setw(3) << d[i][j] << " ";

            else cout << setw(3) << "INF" << " ";
    }
    cout << endl << "-- ����������� �������: ";

    for (int i = 0; i < N; i++) 
        cout << r[i] << "-->"; cout << 0;

    cout << endl << "-- ����� ��������     : " << s;
    cout << endl;

    t2 = clock();                            // �������� ������� 
    cout << endl << "����������������� (�.�):   " << (t2 - t1);
    cout << endl << "                  (���):   "
        << ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC);
    cout << endl;

    system("pause");
    return 0;
}

// Main      
//#include "stdafx.h"
#include <iostream>
#include "Combi.h"
using namespace std;
int main()
{
    setlocale(LC_ALL, "rus");
    char  AA[][2] = { "A", "B", "C", "D", "E" };
    cout << endl << " --- ��������� ��������� ---";
    cout << endl << "�������� ���������: ";
    cout << "{ ";
    for (int i = 0; i < sizeof(AA) / 2; i++)

        cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
    cout << "}";
    cout << endl << "��������� ��������� ";
    combi::xcombination xc(sizeof(AA) / 2, 3);
    cout << "�� " << xc.n << " �� " << xc.m;
    int  n = xc.getfirst();
    while (n >= 0)
    {

        cout << endl << xc.nc << ": { ";

        for (int i = 0; i < n; i++)


            cout << AA[xc.ntx(i)] << ((i < n - 1) ? ", " : " ");

        cout << "}";

        n = xc.getnext();
    };
    cout << endl << "�����: " << xc.count() << endl;
    system("pause");
    return 0;
}

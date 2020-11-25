// --- Main
#include <iostream>
#include "Combi.h"
#include <iomanip> 
using namespace std;
int main()
{
    setlocale(LC_ALL, "rus");
    char  AA[][2] = { "A", "B", "C", "D" };
    cout << endl << " --- ��������� ������������ ---";
    cout << endl << "�������� ���������: ";
    cout << "{ ";
    for (int i = 0; i < sizeof(AA) / 2; i++)

        cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
    cout << "}";
    cout << endl << "��������� ������������ ";
    combi::permutation p(sizeof(AA) / 2);
    __int64  n = p.getfirst();
    while (n >= 0)
    {
        cout << endl << setw(4) << p.np << ": { ";

        for (int i = 0; i < p.n; i++)

            cout << AA[p.ntx(i)] << ((i < p.n - 1) ? ", " : " ");

        cout << "}";

        n = p.getnext();
    };
    cout << endl << "�����: " << p.count() << endl;
    system("pause");
    return 0;
}

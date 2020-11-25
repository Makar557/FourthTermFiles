#include "Task1.h"
#include "Levenshtein.h"
#include <iostream>
#include "LCS.h"

using namespace std;
void Task1();
void Task2();
void Task5_1();
void Task5_2();

void main()
{
	setlocale(LC_ALL, "rus");

	Task1();
	cout << "-----------------\n\n\n";
	Task2();
	cout << "-----------------\n\n\n";
	Task5_1();
	cout << "-----------------\n\n\n";
	Task5_2();
	cout << "-----------------\n\n\n";
}

void Task1()
{
	char* str250 = getString(250);
	char* str300 = getString(300);
	cout << "Строка длиной 250 символов = " << str250 << endl << endl;
	cout << "Строка длиной 300 символов = " << str300 << endl << endl;
}

void Task2()
{
	clock_t t1 = 0, t2 = 0, t3, t4;
	char x[] = "abcdefghklmnoxm", y[] = "xyabcdefghomnkm";
	int  lx = sizeof(x) - 1, ly = sizeof(y) - 1;
	std::cout << std::endl << "-- расстояние Левенштейна -----" << std::endl;
	std::cout << std::endl << "--длина --- рекурсия -- дин.програм. ---" << std::endl;
	for (int i = 8; i < std::min(lx, ly); i++)
	{
		t1 = clock();
		levenshtein_r(i, x, i - 2, y);
		t2 = clock();
		t3 = clock();
		levenshtein(i, x, i - 2, y);
		t4 = clock();
		std::cout << std::right << std::setw(2) << i - 2 << "/" << std::setw(2) << i
			<< "        " << std::left << std::setw(10) << ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC)
			<< "   " << std::setw(10) << ((double)(t4 - t3)) / ((double)CLOCKS_PER_SEC) << std::endl;
	}

}
void Task5_1()
{
	// -- вычисления длины LCS 
	setlocale(LC_ALL, "rus");
	clock_t t1 = 0, t2 = 0;

	char X[] = "TBHDSAV", 
		Y[] = "KIBYSV";
	cout << endl << "-- вычисление длины LCS для X и Y(рекурсия)";
	cout << endl << "-- последовательность X: " << X;
	cout << endl << "-- последовательность Y: " << Y;
	t1 = clock();
	int s = lcs
	(
		sizeof(X) - 1,  // длина   последовательности  X   
		X,       // последовательность X
		sizeof(Y) - 1,  // длина   последовательности  Y
		Y       // последовательность Y
	);
	t2 = clock();
	cout << endl << "-- длина LCS: " << s << endl << "Time: " << t2 - t1 << endl;
}
void Task5_2()
{  
	setlocale(LC_ALL, "rus");
	clock_t t1 = 0, t2 = 0;

	char z[100] = "";
	char x[] = "TBHDSAV",
		y[] = "KIBYSV";
	t1 = clock();
	int l = lcsd(x, y, z);
	t2 = clock();
	cout << endl
		<< "-- наибольшая общая подпоследовательость - LCS(динамическое"
		<< "программирование)" << endl;
	cout << endl << "последовательость X: " << x;
	cout << endl << "последовательость Y: " << y;
	cout << endl << "                LCS: " << z;
	cout << endl << "          длина LCS: " << l;
	cout << endl << "Time: " << t2 - t1 << endl;
	cout << endl;

	system("pause");
}
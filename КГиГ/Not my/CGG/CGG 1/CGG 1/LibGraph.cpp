#include "stdafx.h"
#include "LibGraph.h"
#include "CMatrix.h"

#define SPACING 50
#define PI 3.14159

void fillMatrix(CMatrix& matrix, double begin)
{
	for (int i = 0; i < matrix.countRows(); i++)
	{
		for (int j = 0; j < matrix.countCols(); j++, begin++)
		{
			matrix(i, j) = begin;
		}
	}
}

void printMatrix(CDC* dc, int x, int y, CString caption, CMatrix& matrix)
{
	CString str = L"";
	dc->TextOut(x, y, caption);
	y += SPACING;
	for (int i = 0; i < matrix.countRows(); i++)
	{
		for (int j = 0; j < matrix.countCols(); j++)
		{
			str.Format(L"%.2lf", matrix(i, j));
			dc->TextOut(x + j * SPACING, y + i * SPACING, str);
		}
	}
}

void printNumber(CDC* dc, int x, int y, CString caption, double number)
{
	CString str = L"";
	dc->TextOut(x, y, caption);
	str.Format(L"%.2lf", number);
	dc->TextOut(x, y + SPACING, str);
}

double cos(CMatrix& left, CMatrix& right)
{
	if (left.countCols() > 1 || right.countCols() > 1)
	{
		CString error = L"double cos(CMatrix&, CMatrix&): объект не является вектором";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	if (left.countRows() != right.countRows())
	{
		CString error = L"double cos(CMatrix&, CMatrix&): несоответствие размерностей";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	return scalarProduct(left, right) / (module(left) * module(right));
}

CMatrix vectorProduct(CMatrix& left, CMatrix& right)
{
	if (left.countCols() > 1 || right.countCols() > 1)
	{
		CString error = L"CMatrix vectorProduct(CMatrix&, CMatrix&): объект не является вектором";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	if (left.countRows() != 3 || right.countRows() != 3)
	{
		CString error = L"CMatrix vectorProduct(CMatrix&, CMatrix&): операция определена только для трехмерных векторов";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	CMatrix result(3);
	result(0) = left(1) * right(2) - left(2) * right(1);
	result(1) = left(2) * right(0) - left(0) * right(2);
	result(2) = left(0) * right(1) - left(1) * right(0);
	return result;
}

double scalarProduct(CMatrix& left, CMatrix& right)
{
	if (left.countCols() > 1 || right.countCols() > 1)
	{
		CString error = L"double scalarProduct(CMatrix&, CMatrix&): объект не является вектором";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	if (left.countRows() != right.countRows())
	{
		CString error = L"double scalarProduct(CMatrix&, CMatrix&): несоответствие размерностей";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	double result = 0;
	for (int i = 0; i < left.countRows(); i++)
	{
		result += left(i) * right(i);
	}
	return result;
}

double module(CMatrix& vector)
{
	if (vector.countCols() > 1)
	{
		CString error = L"double module(CMatrix&): объект не является вектором";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	double sum = 0;
	for (int i = 0; i < vector.countRows(); i++)
	{
		sum += vector(i) * vector(i);
	}
	return sqrt(sum);
}

CMatrix sphericalToCartesian(CMatrix& point)
{
	if (point.countCols() > 1)
	{
		CString error = L"CMatrix sphericalToCartesian(CMatrix&): объект не является вектором";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	if (point.countRows() != 3)
	{
		CString error = L"CMatrix sphericalToCartesian(CMatrix&): операция определена только для трехмерных векторов";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	double r = point(0), theta = point(1), phi = point(2);
	if (r < 0 || phi < 0 || phi > PI)
	{
		CString error = L"CMatrix sphericalToCartesian(CMatrix&): недопустимые аргументы";
		MessageBox(NULL, error, L"Ошибка", MB_ICONSTOP);
		exit(1);
	}
	CMatrix result(3);
	result(0) = r * sin(theta) * cos(phi);
	result(1) = r * sin(theta) * sin(phi);
	result(2) = r * cos(theta);
	return result;
}
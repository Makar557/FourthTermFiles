#include "stdafx.h"
#include "CMatrix.h"
#include "LibGraph.h"
#include "LibSurface.h"
#include <cmath>

double function1(double x, double y)
{
	return x * x + y * y;
}

double function2(double x, double y)
{
	return x * x - y * y;
}

double function3(double x, double y)
{
	//return sqrt(1 - x * x - y * y);
	return 1 - sqrt(x * x + y * y);
}

CPlot3D::CPlot3D()//конструктор по умолчанию
{
	_pFunc = NULL;
	_viewport.RedimMatrix(3);
	_rectWindow.SetRect(0, 0, 200, 200);//прямоугольник
	_viewport(0) = 10;
	_viewport(1) = 30;
	_viewport(2) = 45;
}

void CPlot3D::SetFunction(pfunc2 pF, CRectD RS, double dx, double dy)//очистка и применение функций
{
	_pFunc = pF;
	_rectSpace.SetRectD(RS.left, RS.top, RS.right, RS.bottom);
	_matrixFunction.clear();
	_matrixView.clear();
	_matrixWindow.clear();

	CreateMatrixFunction(dx, dy);
	CreateMatrixView();
	CreateMatrixWindow();
}

void CPlot3D::SetViewPoint(double r, double fi, double q)//определение точек
{
	_viewport(0) = r;
	_viewport(1) = fi;
	_viewport(2) = q;
	_matrixView.clear();
	CreateMatrixView();
	_matrixWindow.clear();
	CreateMatrixWindow();
}

CMatrix CPlot3D::GetViewPoint()//задание точек
{
	CMatrix P = _viewport;
	return P;
}

void CPlot3D::SetWinRect(CRect Rect)//прямоугольник для рисования функций
{
	_rectWindow = Rect;
	_matrixWindow.clear();
	CreateMatrixWindow();
}

void CPlot3D::CreateMatrixFunction(double dx, double dy)
{
	double xL = _rectSpace.left;//пространство для прямоугольника
	double xH = _rectSpace.right;
	double yL = _rectSpace.bottom;
	double yH = _rectSpace.top;
	CVecMatrix VecMatrix;
	CMatrix V(4);
	V(3) = 1;
	for (double x = xL; x <= xH; x += dx)
	{
		VecMatrix.clear();
		for (double y = yL; y <= yH; y += dy)
		{
			V(0) = x;
			V(1) = y;
			V(2) = _pFunc(x, y);
			VecMatrix.push_back(V);
		}
		_matrixFunction.push_back(VecMatrix);
	}
}

void CPlot3D::CreateMatrixView()//матрицца для рисования плоскостей
{
	CMatrix MV = CreateViewCoord(_viewport(0), _viewport(1), _viewport(2));
	CVecMatrix VecMatrix;
	CMatrix VX(4), V(3);
	V(2) = 1;
	double xmin = DBL_MAX;
	double xmax = DBL_MIN;
	double ymin = DBL_MAX;
	double ymax = DBL_MIN;

	for (int i = 0; i < _matrixFunction.size(); i++)
	{
		VecMatrix.clear();
		for (int j = 0; j < _matrixFunction[i].size(); j++)
		{
			VX = _matrixFunction[i][j];
			VX = MV * VX;
			V(0) = VX(0);
			V(1) = VX(1);
			VecMatrix.push_back(V);

			double x = V(0);
			double y = V(1);
			if (x < xmin)
				xmin = x;
			if (x > xmax)
				xmax = x;
			if (y < ymin)
				ymin = y;
			if (y > ymax)
				ymax = y;
		}
		_matrixView.push_back(VecMatrix);
	}
	_rectView.SetRectD(xmin, ymax, xmax, ymin);
}

void CPlot3D::CreateMatrixWindow()//оконная матрица
{
	CMatrix MW = SpaceToWindow(_rectView, _rectWindow);
	CVecPoint VecPoint;
	CMatrix  V(3);
	for (int i = 0; i < _matrixView.size(); i++)
	{
		VecPoint.clear();
		for (int j = 0; j < _matrixView[i].size(); j++)
		{
			V = _matrixView[i][j];
			V = MW * V;
			CPoint P((int)V(0), (int)V(1));
			VecPoint.push_back(P);
		}
		_matrixWindow.push_back(VecPoint);
	}
}

void CPlot3D::Draw(CDC& dc)//рисуем плоскости по функциям
{
	if (_matrixWindow.empty())
	{
		TCHAR* error = _T("Массив данных для рисования в окне пуст! ");
		MessageBox(NULL, error, _T("Ошибка"), MB_ICONSTOP);
		return;
	}
	CPoint pt[4];
	int nRows = _matrixWindow.size();
	int nCols = _matrixWindow[0].size();
	for (int i = 0; i < nRows - 1; i++)
	{
		for (int j = 0; j < nCols - 1; j++)
		{
			pt[0] = _matrixWindow[i][j];
			pt[1] = _matrixWindow[i][j + 1];
			pt[2] = _matrixWindow[i + 1][j + 1];
			pt[3] = _matrixWindow[i + 1][j];
			dc.Polygon(pt, 4);
		}
	}
}
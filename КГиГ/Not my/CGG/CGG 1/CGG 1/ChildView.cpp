// ChildView.cpp : реализация класса CChildView

#include "stdafx.h"
#include "CGG 1.h"
#include "ChildView.h"
#include "LibGraph.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// CChildView

CChildView::CChildView()
{
}

CChildView::~CChildView()
{
}

BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	ON_COMMAND(ID_TEST_MATRIXES, &CChildView::OnTestMatrixes)
	ON_COMMAND(ID_TEST_FUNCTIONS, &CChildView::OnTestFunctions)
END_MESSAGE_MAP()

// обработчики сообщений CChildView

BOOL CChildView::PreCreateWindow(CREATESTRUCT& cs) 
{
	if (!CWnd::PreCreateWindow(cs))
		return FALSE;

	cs.dwExStyle |= WS_EX_CLIENTEDGE;
	cs.style &= ~WS_BORDER;
	cs.lpszClass = AfxRegisterWndClass(CS_HREDRAW|CS_VREDRAW|CS_DBLCLKS, 
		::LoadCursor(NULL, IDC_ARROW), reinterpret_cast<HBRUSH>(COLOR_WINDOW+1), NULL);

	return TRUE;
}

void CChildView::OnPaint()
{
	CPaintDC dc(this); // контекст устройства для рисования
	
	// TODO: Добавьте код обработки сообщений
	
	// Не вызывайте CWnd::OnPaint() для сообщений рисования
}

void CChildView::OnTestMatrixes()
{
	RedrawWindow();
	CDC *dc = GetDC(); // контекст устройства для рисования

	CMatrix a(3, 3);
	CMatrix b(3, 3);
	CMatrix v1(3);
	CMatrix v2(3);
	fillMatrix(a, 1);
	fillMatrix(b, 4);
	fillMatrix(v1, 3);
	fillMatrix(v2, 7);
	printMatrix(dc, 50, 50, L"МАТРИЦА A", a);
	printMatrix(dc, 250, 50, L"МАТРИЦА B", b);
	printMatrix(dc, 450, 50, L"ВЕКТОР V1", v1);
	printMatrix(dc, 650, 50, L"ВЕКТОР V2", v2);
	printMatrix(dc, 50, 300, L"A + B", a + b);
	printMatrix(dc, 250, 300, L"A * B", a * b);
	printMatrix(dc, 450, 300, L"A * V1", a * v1);
	printMatrix(dc, 650, 300, L"V1^T * V2", v1.transpose() * v2);
	printMatrix(dc, 850, 300, L"V1^T * A * V2", v1.transpose() * a * v2);

	// TODO: добавьте свой код обработчика команд
}

void CChildView::OnTestFunctions()
{
	RedrawWindow();
	CDC *dc = GetDC(); // контекст устройства для рисования

	CMatrix v1(3);
	CMatrix v2(3);
	CMatrix point(3);
	fillMatrix(v1, 1);
	fillMatrix(v2, 4);
	fillMatrix(point, 1);
	printMatrix(dc, 50, 50, L"ВЕКТОР V1", v1);
	printMatrix(dc, 250, 50, L"ВЕКТОР V2", v2);
	printMatrix(dc, 450, 50, L"ТОЧКА P (СФЕРИЧЕСКАЯ СК)", point);
	printMatrix(dc, 50, 300, L"V1 x V2", vectorProduct(v1, v2));
	printNumber(dc, 250, 300, L"V1 * V2", scalarProduct(v1, v2));
	printNumber(dc, 450, 300, L"|V1|", module(v1));
	printNumber(dc, 650, 300, L"cos(V1 /\\ V2)", cos(v1, v2));
	printMatrix(dc, 850, 300, L"ТОЧКА P (ПРЯМОУГОЛЬНАЯ СК)", sphericalToCartesian(point));

	// TODO: добавьте свой код обработчика команд
}
#pragma region MyRegion



// CGG_1View.cpp: реализация класса CCGG1View
//

#include "pch.h"
#include "framework.h"
// SHARED_HANDLERS можно определить в обработчиках фильтров просмотра реализации проекта ATL, эскизов
// и поиска; позволяет совместно использовать код документа в данным проекте.
#ifndef SHARED_HANDLERS
#include "CGG_1.h"
#endif

#include "CGG_1Doc.h"
#include "CGG_1View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif
#include <string>


// CCGG1View

IMPLEMENT_DYNCREATE(CCGG1View, CView)

BEGIN_MESSAGE_MAP(CCGG1View, CView)
	// Стандартные команды печати
	ON_COMMAND(ID_FILE_PRINT, &CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, &CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, &CCGG1View::OnFilePrintPreview)
	ON_WM_CONTEXTMENU()
	ON_WM_RBUTTONUP()
END_MESSAGE_MAP()
#pragma endregion
// Создание или уничтожение CCGG1View

CCGG1View::CCGG1View() noexcept						
{
	A.RedimData(3, 3);
	B.RedimData(3, 3);
	V1.RedimData(3);
	V2.RedimData(3);

	C1.RedimData(3, 3);
	C2.RedimData(3, 3);
	D.RedimData(3);

	double arrayA[3][3] = 
	{ 
		{1.2, 2.3, 5.7}, 
		{6.4, 2.1, 0.1}, 
		{1.4, 0.3, 3.7} 
	};
	double arrayB[3][3] =
	{
		{6.2, 1.3, 2.2},
		{5.4, 2.0, 3.1},
		{4.1, 0.4, 3.9}
	};
	double arrayV1[3] = { 1.2, 3.4, 5.6 };
	double arrayV2[3] = { 2.8, 3.6, 1.4 };

	for (int i = 0; i < 3; i++)
		for (int j = 0; j < 3; j++)
			A(i, j) = arrayA[i][j];

	for (int i = 0; i < 3; i++)
		for (int j = 0; j < 3; j++)
			B(i, j) = arrayB[i][j];

	for (int i = 0; i < 3; i++)
	{
		V1(i) = arrayV1[i];
		V2(i) = arrayV2[i];
	}

	C1 = A + B;
	C2 = A * B;
	D = A * V1;
	q = V1.Transp() * V2;
	p = V1.Transp() * A * V2;


}
#pragma region MyRegion

CCGG1View::~CCGG1View()
{
}

BOOL CCGG1View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: изменить класс Window или стили посредством изменения
	//  CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}
#pragma endregion

//Печать PrintMatrix

void PrintMatrix(CDC& dc, int x, int y, CMatrix& M)
{
	CString matrixTemp;
	std::string tempStr;

	for (int i = 0; i < M.rows(); i++)
	{
		for (int j = 0; j < M.cols(); j++)
		{
			tempStr = std::to_string(M(i, j));
			tempStr[tempStr.find('.') + 2] = '\0';

			matrixTemp = tempStr.data();
			dc.TextOutW(x + j * 50, y + i * 50, matrixTemp);
		}
	}
}

// Вычисляет векторное произведение векторов V1 и V2

CMatrix VectorMult(CMatrix& V1, CMatrix& V2)
{
	CMatrix a(3);
	a(0) = V1(1) * V2(2) - V1(2) * V2(1);
	a(1) = V1(2) * V2(0) - V1(0) * V2(2);
	a(2) = V1(0) * V2(1) - V1(1) * V2(0);

	return a;
}

// Вычисляет скалярное произведение векторов V1 и V2

double ScalarMult(CMatrix& V1, CMatrix& V2)
{
	return V1(0) * V2(0) + V1(1) * V2(1) + V1(2) * V2(2);
}

// Вычисляет модуль вектора V

double ModVec(CMatrix& V)
{
	return sqrt(pow(V(0),2) + pow(V(1), 2) + pow(V(2), 2));
}

// Вычисляет КОСИНУС угла между векторами V1 и V2

double CosV1V2(CMatrix& V1, CMatrix& V2)
{
	return ScalarMult(V1, V2) / (ModVec(V1) * ModVec(V2));
}

// Преобразует сферические координаты PView  точки в декартовы
// PView(0) – r – расстояние до точки.
// PView(1) - fi - азимут(отсчет от оси X), град.
// PView(2) - q - угол(отсчетот оси Z), град.
// Результат: R(0)- x, R(1)- y, R(2)- z	

CMatrix SphereToCart(CMatrix& PView)
{
	CMatrix a;
	a.RedimData(3);
	a(0) = PView(0) * sin(PView(2)) * cos(PView(1));
	a(1) = PView(0) * sin(PView(2)) * sin(PView(1));
	a(2) = PView(0) * cos(PView(2));
	return a;
}


// Рисование CCGG1View

void CCGG1View::OnDraw(CDC* pDC)
{
	CCGG1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;
#pragma region MyRegion
	PrintMatrix(*pDC, 50, 50, A);
	pDC->TextOutW(210, 100, CString('+'));
	PrintMatrix(*pDC, 250, 50, B);
	pDC->TextOutW(400, 100, CString('='));
	PrintMatrix(*pDC, 425, 50, C1);

	PrintMatrix(*pDC, 50, 210, A);
	pDC->TextOutW(210, 260, CString('*'));
	PrintMatrix(*pDC, 250, 210, B);
	pDC->TextOutW(400, 260, CString('='));
	PrintMatrix(*pDC, 425, 210, C2);

	PrintMatrix(*pDC, 50, 370, A);
	pDC->TextOutW(210, 420, CString('*'));
	PrintMatrix(*pDC, 250, 370, V1);
	pDC->TextOutW(330, 420, CString('='));
	PrintMatrix(*pDC, 375, 370, D);

	PrintMatrix(*pDC, 50, 555, V1.Transp());
	pDC->TextOutW(210, 555, CString('*'));
	PrintMatrix(*pDC, 250, 530, V2);
	pDC->TextOutW(330, 555, CString('='));
	PrintMatrix(*pDC, 375, 555, q);

	PrintMatrix(*pDC, 650, 100, V1.Transp());
	pDC->TextOutW(815, 100, CString('*'));
	PrintMatrix(*pDC, 840, 50, A);
	pDC->TextOutW(1000, 100, CString('*'));
	PrintMatrix(*pDC, 1020, 50, V2);
	pDC->TextOutW(1080, 100, CString('='));
	PrintMatrix(*pDC, 1100, 100, p);
#pragma endregion
	PrintMatrix(*pDC, 650, 210, V1);
	pDC->TextOutW(715, 260, CString('*'));
	PrintMatrix(*pDC, 750, 210, V2);
	pDC->TextOutW(815, 260, CString('='));
	PrintMatrix(*pDC, 850, 210, VectorMult(V1, V2));


	std::string aaa = std::to_string(ScalarMult(V1, V2));
	aaa[aaa.find('.') + 2] = '\0';

	pDC->TextOutW(950, 210, CString("Скалярное произведение: "));
	pDC->TextOutW(1250, 210, CString(aaa.data()));

	aaa = std::to_string(ModVec(V1));
	aaa[aaa.find('.') + 2] = '\0';

	pDC->TextOutW(950, 260, CString("Нахождение модуля вектора V1: "));
	pDC->TextOutW(1250, 260, CString(aaa.data()));

	aaa = std::to_string(ModVec(V2));
	aaa[aaa.find('.') + 2] = '\0';

	pDC->TextOutW(950, 310, CString("Нахождение модуля вектора V2: "));
	pDC->TextOutW(1250, 310, CString(aaa.data()));

	aaa = std::to_string(CosV1V2(V1, V2));
	aaa[aaa.find('.') + 2] = '\0';

	pDC->TextOutW(950, 360, CString("Косинус угла между векторами: "));
	pDC->TextOutW(1250, 360, CString(aaa.data()));

	pDC->TextOutW(950, 410, CString("SphereToCart 1: "));
	PrintMatrix(*pDC, 970, 460, SphereToCart(V1));

	pDC->TextOutW(1150, 410, CString("SphereToCart 2: "));
	PrintMatrix(*pDC, 1170, 460, SphereToCart(V2));
}

#pragma region MyRegion



// Печать CCGG1View


void CCGG1View::OnFilePrintPreview()
{
#ifndef SHARED_HANDLERS
	AFXPrintPreview(this);
#endif
}

BOOL CCGG1View::OnPreparePrinting(CPrintInfo* pInfo)
{
	// подготовка по умолчанию
	return DoPreparePrinting(pInfo);
}

void CCGG1View::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: добавьте дополнительную инициализацию перед печатью
}

void CCGG1View::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: добавьте очистку после печати
}

void CCGG1View::OnRButtonUp(UINT /* nFlags */, CPoint point)
{
	ClientToScreen(&point);
	OnContextMenu(this, point);
}

void CCGG1View::OnContextMenu(CWnd* /* pWnd */, CPoint point)
{
#ifndef SHARED_HANDLERS
	theApp.GetContextMenuManager()->ShowPopupMenu(IDR_POPUP_EDIT, point.x, point.y, this, TRUE);
#endif
}


// Диагностика CCGG1View

#ifdef _DEBUG
void CCGG1View::AssertValid() const
{
	CView::AssertValid();
}

void CCGG1View::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CCGG1Doc* CCGG1View::GetDocument() const // встроена неотлаженная версия
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CCGG1Doc)));
	return (CCGG1Doc*)m_pDocument;
}
#endif //_DEBUG


// Обработчики сообщений CCGG1View
#pragma endregion
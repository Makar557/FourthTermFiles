// ChildView.cpp : реализация класса CChildView

#include "stdafx.h"
#include "CGG 2.h"
#include "ChildView.h"
#include "BmpUtility.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// CChildView

CChildView::CChildView()
{
	targetPoint.x = 0;
	targetPoint.y = 0;
	targetArea.top = 0;
	targetArea.left = 0;
	targetArea.bottom = 0;
	targetArea.right = 0;
	startSelected = false;
}

CChildView::~CChildView()
{
}

BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	ON_WM_LBUTTONDOWN()
	ON_WM_RBUTTONDOWN()
	ON_COMMAND(ID_BMP_LOAD, &CChildView::OnBmpLoad)
	ON_COMMAND(ID_BMP_SAVE, &CChildView::OnBmpSave)
END_MESSAGE_MAP()

// обработчики сообщений CChildView

BOOL CChildView::PreCreateWindow(CREATESTRUCT& cs)
{
	if (!CWnd::PreCreateWindow(cs))
		return FALSE;

	cs.dwExStyle |= WS_EX_CLIENTEDGE;
	cs.style &= ~WS_BORDER;
	cs.lpszClass = AfxRegisterWndClass(CS_HREDRAW | CS_VREDRAW | CS_DBLCLKS,
		::LoadCursor(NULL, IDC_ARROW), reinterpret_cast<HBRUSH>(COLOR_WINDOW + 1), NULL);

	return TRUE;
}

void CChildView::OnPaint()
{
	CPaintDC dc(this); // контекст устройства для рисования
	
	// TODO: Добавьте код обработки сообщений
	
	// Не вызывайте CWnd::OnPaint() для сообщений рисования
}

void CChildView::OnLButtonDown(UINT nFlags, CPoint point)
{
	RedrawWindow();
	targetPoint = point;
	CDC* displayDc = GetDC();
	displayDc->Ellipse(targetPoint.x - 5, targetPoint.y - 5, targetPoint.x + 5, targetPoint.y + 5);
	ReleaseDC(displayDc);
}

void CChildView::OnRButtonDown(UINT nFlags, CPoint point)
{
	if (startSelected)
	{
		targetArea.bottom = point.y;
		targetArea.right = point.x;

		CDC* displayDc = GetDC();
		displayDc->MoveTo(targetArea.left, targetArea.top);
		displayDc->LineTo(targetArea.right, targetArea.top);
		displayDc->MoveTo(targetArea.right, targetArea.top);
		displayDc->LineTo(targetArea.right, targetArea.bottom);
		displayDc->MoveTo(targetArea.right, targetArea.bottom);
		displayDc->LineTo(targetArea.left, targetArea.bottom);
		displayDc->MoveTo(targetArea.left, targetArea.bottom);
		displayDc->LineTo(targetArea.left, targetArea.top);
		ReleaseDC(displayDc);

		startSelected = false;
	}
	else
	{
		targetArea.top = point.y;
		targetArea.left = point.x;
		startSelected = true;
	}
}

void CChildView::OnBmpLoad()
{
	CFileDialog fileDialog(TRUE, L"bmp", L".bmp");
	INT_PTR result = fileDialog.DoModal();
	if (result == IDOK)
	{
		RedrawWindow();
		ShowBmp(*this, LoadBmp(fileDialog.GetPathName()), targetPoint.x, targetPoint.y);
	}
	// TODO: добавьте свой код обработчика команд
}

void CChildView::OnBmpSave()
{
	CFileDialog fileDialog(FALSE, L"bmp", L".bmp");
	INT_PTR result = fileDialog.DoModal();
	if (result == IDOK)
	{
		SaveBmp(*this, targetArea, fileDialog.GetPathName());
		RedrawWindow();
	}
	// TODO: добавьте свой код обработчика команд
}
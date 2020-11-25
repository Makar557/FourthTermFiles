#include "stdafx.h"
#include "CMatrix.h"
#include "LibGraph.h"
#include "CPyramid.h"
#include "CGG 5.h"
#include "ChildView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// CChildView

CChildView::CChildView()
{
	Mode = 0;
	Viewport.resize(3);
}

CChildView::~CChildView()
{
}

BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	ON_COMMAND(ID_PYRAMID_DRAW, &CChildView::OnPyramidDraw)
	ON_COMMAND(ID_PYRAMID_DRAWXRAY, &CChildView::OnPyramidDrawxray)
	ON_WM_KEYDOWN()
	ON_WM_SIZE()
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
	CPaintDC dc(this);

	if (Mode == 1)
	{
		Pyramid.draw(dc, Viewport, RectWindow);
	}
	if (Mode == 2)
	{
		Pyramid.drawXray(dc, Viewport, RectWindow);
	}
}

void CChildView::OnPyramidDraw()
{
	Viewport(0) = 10;
	Viewport(1) = 315;
	Viewport(2) = 45;

	Mode = 1;
	Invalidate();
}

void CChildView::OnPyramidDrawxray()
{
	Viewport(0) = 10;
	Viewport(1) = 315;
	Viewport(2) = 45;

	Mode = 2;
	Invalidate();
}

void CChildView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	if ((Mode == 1) || (Mode == 2))
	{
		switch (nChar)
		{
			double d;

		case VK_UP:
			d = Viewport(2) - 5;
			if (d >= 0)
			{
				Viewport(2) = d;
			}
			break;

		case VK_DOWN:
			d = Viewport(2) + 5;
			if (d <= 180)
			{
				Viewport(2) = d;
			}
			break;

		case VK_LEFT:
			d = Viewport(1) - 5;
			if (d >= -180)
			{
				Viewport(1) = d;
			}
			else
			{
				Viewport(1) = d + 360;
			}
			break;

		case VK_RIGHT:
			d = Viewport(1) + 5;
			if (d <= 180)
			{
				Viewport(1) = d;
			}
			else
			{
				Viewport(1) = d - 360;
			}
			break;
		}
		Invalidate();
	}
	CWnd::OnKeyDown(nChar, nRepCnt, nFlags);
}

void CChildView::OnSize(UINT nType, int cx, int cy)
{
	CWnd::OnSize(nType, cx, cy);
	RectWindow.SetRect(100, 100, cx - 100, cy - 50);
}
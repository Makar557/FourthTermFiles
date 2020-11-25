
// CGG_1View.h: интерфейс класса CCGG1View
//

#pragma once


class CCGG1View : public CView
{
protected: // создать только из сериализации
	CCGG1View() noexcept;
	DECLARE_DYNCREATE(CCGG1View)


	CMatrix A;
	CMatrix B;
	CMatrix V1;
	CMatrix V2;
	CMatrix C1;
	CMatrix C2;
	CMatrix D;
	CMatrix q;
	CMatrix p;


// Атрибуты
public:
	CCGG1Doc* GetDocument() const;

// Операции
public:

// Переопределение
public:
	virtual void OnDraw(CDC* pDC);  // переопределено для отрисовки этого представления
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);

// Реализация
public:
	virtual ~CCGG1View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Созданные функции схемы сообщений
protected:
	afx_msg void OnFilePrintPreview();
	afx_msg void OnRButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnContextMenu(CWnd* pWnd, CPoint point);
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // версия отладки в CGG_1View.cpp
inline CCGG1Doc* CCGG1View::GetDocument() const
   { return reinterpret_cast<CCGG1Doc*>(m_pDocument); }
#endif


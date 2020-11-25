
// CGG 4.h : главный файл заголовка для приложения CGG 4
//
#pragma once

#ifndef __AFXWIN_H__
	#error "включить stdafx.h до включения этого файла в PCH"
#endif

#include "resource.h"       // основные символы


// CCGG4App:
// О реализации данного класса см. CGG 4.cpp
//

class CCGG4App : public CWinApp
{
public:
	CCGG4App();


// Переопределение
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// Реализация

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG4App theApp;

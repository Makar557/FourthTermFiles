
// CGG 1.h : главный файл заголовка для приложения CGG 1
//
#pragma once

#ifndef __AFXWIN_H__
	#error "включить stdafx.h до включения этого файла в PCH"
#endif

#include "resource.h"       // основные символы


// CCGG1App:
// О реализации данного класса см. CGG 1.cpp
//

class CCGG1App : public CWinApp
{
public:
	CCGG1App();


// Переопределение
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// Реализация

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG1App theApp;

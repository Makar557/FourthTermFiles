
// CGG 2.h : главный файл заголовка для приложения CGG 2
//
#pragma once

#ifndef __AFXWIN_H__
	#error "включить stdafx.h до включения этого файла в PCH"
#endif

#include "resource.h"       // основные символы


// CCGG2App:
// О реализации данного класса см. CGG 2.cpp
//

class CCGG2App : public CWinApp
{
public:
	CCGG2App();


// Переопределение
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// Реализация

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG2App theApp;

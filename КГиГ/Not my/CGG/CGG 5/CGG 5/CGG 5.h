
// CGG 5.h : главный файл заголовка для приложения CGG 5
//
#pragma once

#ifndef __AFXWIN_H__
	#error "включить stdafx.h до включения этого файла в PCH"
#endif

#include "resource.h"       // основные символы


// CCGG5App:
// О реализации данного класса см. CGG 5.cpp
//

class CCGG5App : public CWinApp
{
public:
	CCGG5App();


// Переопределение
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// Реализация

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG5App theApp;

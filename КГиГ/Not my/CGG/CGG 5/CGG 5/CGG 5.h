
// CGG 5.h : ������� ���� ��������� ��� ���������� CGG 5
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�������� stdafx.h �� ��������� ����� ����� � PCH"
#endif

#include "resource.h"       // �������� �������


// CCGG5App:
// � ���������� ������� ������ ��. CGG 5.cpp
//

class CCGG5App : public CWinApp
{
public:
	CCGG5App();


// ���������������
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// ����������

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG5App theApp;

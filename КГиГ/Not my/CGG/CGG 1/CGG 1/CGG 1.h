
// CGG 1.h : ������� ���� ��������� ��� ���������� CGG 1
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�������� stdafx.h �� ��������� ����� ����� � PCH"
#endif

#include "resource.h"       // �������� �������


// CCGG1App:
// � ���������� ������� ������ ��. CGG 1.cpp
//

class CCGG1App : public CWinApp
{
public:
	CCGG1App();


// ���������������
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// ����������

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG1App theApp;

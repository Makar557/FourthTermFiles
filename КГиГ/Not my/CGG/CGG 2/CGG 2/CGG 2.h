
// CGG 2.h : ������� ���� ��������� ��� ���������� CGG 2
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�������� stdafx.h �� ��������� ����� ����� � PCH"
#endif

#include "resource.h"       // �������� �������


// CCGG2App:
// � ���������� ������� ������ ��. CGG 2.cpp
//

class CCGG2App : public CWinApp
{
public:
	CCGG2App();


// ���������������
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// ����������

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG2App theApp;


// CGG 4.h : ������� ���� ��������� ��� ���������� CGG 4
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�������� stdafx.h �� ��������� ����� ����� � PCH"
#endif

#include "resource.h"       // �������� �������


// CCGG4App:
// � ���������� ������� ������ ��. CGG 4.cpp
//

class CCGG4App : public CWinApp
{
public:
	CCGG4App();


// ���������������
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// ����������

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG4App theApp;

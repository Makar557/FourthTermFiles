#include "stdafx.h"
#include "CMatrix.h"
#include "LibGraph.h"

CRectD::CRectD()
{
	Left = Top = Right = Bottom = 0;
}

CRectD::CRectD(double left, double top, double right, double bottom)
{
	Left = left;
	Top = top;
	Right = right;
	Bottom = bottom;
}

void CRectD::setRectD(double left, double top, double right, double bottom)
{
	Left = left;
	Top = top;
	Right = right;
	Bottom = bottom;
}

CSizeD CRectD::sizeD()
{
	CSizeD cz;
	cz.cx = fabs(Right - Left);
	cz.cy = fabs(Top - Bottom);
	return cz;
}

CMatrix getConverterWorldToWindow(CRectD& rectWorld, CRect& rectWindow)
{
	CMatrix result(3, 3);
	CSize sz = rectWindow.Size();
	int dwx = sz.cx;
	int dwy = sz.cy;
	CSizeD szd = rectWorld.sizeD();

	double dsx = szd.cx;
	double dsy = szd.cy;

	double kx = (double)dwx / dsx;
	double ky = (double)dwy / dsy;

	result(0, 0) = kx;
	result(0, 1) = 0;
	result(0, 2) = (double)rectWindow.left - kx * rectWorld.Left;

	result(1, 0) = 0;
	result(1, 1) = -ky;
	result(1, 2) = (double)rectWindow.bottom + ky*rectWorld.Bottom;

	result(2, 0) = 0;
	result(2, 1) = 0;
	result(2, 2) = 1;

	return result;
}

CMatrix getConverterWorldToView(double r, double phi, double theta)
{
	phi = (fmod(phi, 360.0) / 180.0) * PI;
	theta = (fmod(theta, 360.0) / 180.0) * PI;

	CMatrix result(4, 4);
	result(0, 0) = -sin(phi);
	result(0, 1) = cos(phi);

	result(1, 0) = -cos(theta) * cos(phi);
	result(1, 1) = -cos(theta) * sin(phi);
	result(1, 2) = sin(theta);

	result(2, 0) = -sin(theta) * cos(phi);
	result(2, 1) = -sin(theta) * sin(phi);
	result(2, 2) = -cos(theta);
	result(2, 3) = r;

	result(3, 3) = 1;

	return result;
}
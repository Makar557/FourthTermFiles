// ChildView.cpp : реализация класса CChildView
//

#include "stdafx.h"
#include "CGG 8.h"
#include "ChildView.h"
#include "CMatrix.h"
#include "LibChart2D.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define DIFFUSE_LIGHT 1
#define GLOSSY_LIGHT 2

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

int DRAW_MODE = 0;

int Light_Global_Theta = 45;
int Light_Global_Phi = 145;
CMatrix transform(4, 4);
CMatrix transform2(4, 4);
CMatrix buffer1(4, 1);
CMatrix buffer2(4, 1);

// CChildView

CChildView::CChildView()
{
	int radius = 50;
	sphere = new Sphere(radius);
	sphere->CalculateMatrix(CRect(0, 0, 400, 400), CRectD(-radius, -radius, radius, radius));
}

CChildView::~CChildView()
{
}

BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	ON_WM_KEYDOWN()
	ON_COMMAND(ID_DRAW_DIFFUSE, &CChildView::OnDrawDiffuse)
	ON_COMMAND(ID_DRAW_GLOSSY, &CChildView::OnDrawGlossy)
END_MESSAGE_MAP()

// обработчики сообщений CChildView

BOOL CChildView::PreCreateWindow(CREATESTRUCT& cs) 
{
	if (!CWnd::PreCreateWindow(cs))
		return FALSE;

	cs.dwExStyle |= WS_EX_CLIENTEDGE;
	cs.style &= ~WS_BORDER;
	cs.lpszClass = AfxRegisterWndClass(CS_HREDRAW|CS_VREDRAW|CS_DBLCLKS, 
		::LoadCursor(NULL, IDC_ARROW), reinterpret_cast<HBRUSH>(COLOR_WINDOW+1), NULL);

	return TRUE;
}

void CChildView::OnPaint() 
{
	CPaintDC dc(this); // контекст устройства для рисования

	if (DRAW_MODE == DIFFUSE_LIGHT)
	{
		sphere->Draw(dc, true);
		//figura->DrawInvisible(dc);
	}
	if (DRAW_MODE == GLOSSY_LIGHT)
	{
		sphere->Draw(dc, false);
		//figura->DrawLight(dc);
	}
}

void CChildView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	// TODO: добавьте свой код обработчика сообщений или вызов стандартного

	if (nChar == 65 || nChar == 68 || nChar == 87 || nChar == 83)
	{
		if (nChar == 65) Light_Global_Phi -= 30;//свет налево
		if (nChar == 68) Light_Global_Phi += 30;//свет направо
		if (nChar == 87) Light_Global_Theta -= 30;//свет ввех
		if (nChar == 83) Light_Global_Theta += 30;//свет вниз
		if (Light_Global_Phi < 0) Light_Global_Phi += 360;
		if (Light_Global_Phi > 360) Light_Global_Phi -= 360;
		if (Light_Global_Theta < 0) Light_Global_Theta += 360;
		if (Light_Global_Theta > 360) Light_Global_Theta -= 360;
		Invalidate();
	}
	CWnd::OnKeyDown(nChar, nRepCnt, nFlags);
}

void CChildView::OnDrawDiffuse()
{
	DRAW_MODE = DIFFUSE_LIGHT;
	Invalidate();
}

void CChildView::OnDrawGlossy()
{
	DRAW_MODE = GLOSSY_LIGHT;
	Invalidate();
}

void Sphere::Draw(CDC& dc, bool light_mode)
{
	ExtPoint CurrentPoint;
	ExtPoint CoordCenter;
	ExtPoint CameraVector;
	ExtPoint LightVector;
	LightParams Light;
	CoordCenter.Set(0, 0, 0);
	Light.intensivity = 20;
	Light.p = 1;

	if (light_mode)
	{
		Light.KoefDifuz = 1;
		Light.KoefStandart = 0;
		Light.KoefZerkal = 0;
	}
	else
	{
		Light.KoefDifuz = 0;
		Light.KoefStandart = 0;
		Light.KoefZerkal = 1;
	}
	CameraVector = PointsOnVector(CoordCenter, SphereToCart(700, 0, 0));
	LightVector = PointsOnVector(CoordCenter, SphereToCart(700, Light_Global_Phi*pi / 180, Light_Global_Theta*pi / 180));
	CoordCenter.Set(0, 0, 0);
	ExtPoint RadiusVector;
	double light_result;
	int red = 255;
	int green = 255;
	int blue = 0;
	double CosUgolCamNormal;
	double CosUgolLightNormal;
	for (double Fi = 0; Fi < 360; Fi += 0.25)
	{
		for (double Teta = 0; Teta < 180; Teta += 0.25)
		{
			CurrentPoint = SphereToCart(radius, Fi*pi / 180, Teta*pi / 180);
			RadiusVector = PointsOnVector(CoordCenter, CurrentPoint);
			CosUgolCamNormal = ScalarMultiply(CameraVector, RadiusVector);
			if (CosUgolCamNormal > 0)
			{
				CosUgolLightNormal = ScalarMultiply(LightVector, RadiusVector);
				cord(0) = CurrentPoint.X;
				cord(1) = CurrentPoint.Y;
				rescord = transform*cord;
				if (CosUgolLightNormal > 0)
				{
					ExtPoint centr;
					centr.Set(0, 0, 0);
					double temp = (ScalarMultiply(RadiusVector, LightVector) * 2) / pow(ModulVector(RadiusVector), 2);
					ExtPoint VectorOtrazenia;
					VectorOtrazenia.X = RadiusVector.X*temp - LightVector.X;
					VectorOtrazenia.Y = RadiusVector.Y*temp - LightVector.Y;
					VectorOtrazenia.Z = RadiusVector.Z*temp - LightVector.Z;
					double UgolAlpha = Ugol(CameraVector, VectorOtrazenia);

					double FI = Ugol(RadiusVector, LightVector);

					double result = 0;
					if (light_mode == true)
					{
						result = (Light.KoefDifuz*cos(FI)*cos(UgolAlpha));
					}
					else
					{
						result = (Light.KoefZerkal*pow(cos(UgolAlpha), 200));
					}

					if (result < 0) result = 0;

					light_result = result;

					dc.SetPixel(rescord(0), rescord(1), RGB(red*light_result, green*light_result, blue*light_result));
				}
				else
				{
					dc.SetPixel(rescord(0), rescord(1), RGB(0, 0, 0));
				}
			}
		}
	}
}
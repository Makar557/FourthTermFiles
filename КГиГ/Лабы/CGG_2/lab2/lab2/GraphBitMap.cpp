#pragma once
#include "stdafx.h"
#include "GraphBitMap.h"
#include <fstream>

int counter = 0;

//ф-ци€ дл€ отображени€ (чтени€ с диска) в заданной области окна изображени€ в формате BMP
//отображает рисунок в заданной позиции окна
//hWnd - дискриптор окна, куда выводитс€ изображение
//hBit - дискриптор рисунка
//r Ц область в окне, куда выводитс€ изображение
//(x,y) - координаты левого верхнего угла изображени€ в окне вывода
int ShowBitMap(HWND hWnd, HANDLE hBit, int x, int y) 
{
	BITMAP BitMap; //в структуру BitMap считываютс€ параметры  картинки
	GetObjectW(hBit, sizeof(BITMAP), &BitMap);
	//из еЄ полей bmHeight и bmWidth получаем размеры дл€ копировани€
	int Height = BitMap.bmHeight;
	int Width = BitMap.bmWidth;
	//ѕолучаем контекст изображени€
	HDC hdc = GetDC(hWnd);
	//—оздаем контекст пам€ти
	HDC hdcMem = CreateCompatibleDC(hdc);
	//¬ созданный контекст пам€ти заносим дискриптор битовой карты
	HBITMAP OldBitmap = (HBITMAP)SelectObject(hdcMem, hBit);
	BitBlt(hdc, x, y, Width, Height, hdcMem, 0, 0, SRCCOPY); //ф-и€ копировани€
	//ѕосле копировани€ уничтожаютс€ контексты пам€ти и изображени€
	SelectObject(hdcMem, OldBitmap);
	ReleaseDC(hWnd, hdc);
	return 0;
}

//ф-ци€ дл€ записи на диск изображени€ заданной области окна в формате BMP
//сохранение рабочей области окна в файле Name.bmp
//hWnd - дискриптор окна, рабоча€ область которого сохран€етс€
//r Ц область в  окне, котора€ сохран€етс€ в файле
//Name - им€ файла дл€ сохранени€
int ClientToBmp(HWND hWnd, char *Name)
{
	RECT r;
	GetClientRect (hWnd, &r); //”знаем размер рабочей области
	return ClientRectToBmp (hWnd, Name, r);
}

int ClientRectToBmp(HWND hWnd, char* name, RECT r) //ф-ци€ рабочей области
	{
	HANDLE fh = CreateFile((LPCTSTR)name, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL | FILE_FLAG_SEQUENTIAL_SCAN, NULL);
	if (fh == INVALID_HANDLE_VALUE) 
		return 2;
	BITMAPINFOHEADER bi;
		ZeroMemory (&bi, sizeof (BITMAPINFOHEADER));

	bi.biSize = sizeof (BITMAPINFOHEADER);  //–азмер файла
	bi.biWidth = r.right - r.left;
	bi.biHeight = r.bottom - r.top;
	bi.biPlanes = 1; 
	bi.biBitCount = 32; //16;
	bi.biSizeImage = (bi.biWidth * bi.biBitCount + 31)/32*4*bi.biHeight;

	BITMAPFILEHEADER bmfHdr;
		ZeroMemory (&bmfHdr, sizeof (BITMAPFILEHEADER));
	bmfHdr.bfType = 0x4D42; //BM  ('M'<<8)|'B';  //«аполн€ем дисковый заголовок
	bmfHdr.bfSize = bi.biSizeImage + sizeof (BITMAPFILEHEADER)+bi.biSize;
	bmfHdr.bfReserved1 = bmfHdr.bfReserved2 = 0;
	bmfHdr.bfOffBits = (DWORD)sizeof(BITMAPFILEHEADER) + (DWORD)bi.biSize; // —мещение до начала данных


	HDC hDC = GetDC (hWnd);
	HDC hDCMem = CreateCompatibleDC (hDC);
	HBITMAP hBitmap = CreateCompatibleBitmap (hDC, bi.biWidth, bi.biHeight); //битова€ карта
	HBITMAP oldBitmap = (HBITMAP)SelectObject (hDCMem, hBitmap);
	BitBlt (hDCMem, 0, 0, bi.biWidth, bi.biHeight, hDC, r.left, r.top, SRCCOPY);
	hBitmap = (HBITMAP)SelectObject (hDCMem, oldBitmap);

	HANDLE hDIB = GlobalAlloc (GHND /*GMEM_FIXED*/, bi.biSizeImage);
	char* lp = (char*)GlobalLock (hDIB);
	GetDIBits (hDC, hBitmap, 0, bi.biHeight, lp, (LPBITMAPINFO)&bi, DIB_RGB_COLORS);	
	DWORD dwWritten = sizeof (BITMAPFILEHEADER); // оличество записанных файлов
	// «апись в файл загружаемого заголовка  
		WriteFile(fh, (LPSTR)&bmfHdr, sizeof(BITMAPFILEHEADER), &dwWritten, NULL);
	dwWritten = sizeof (BITMAPINFOHEADER);
		WriteFile (fh, (LPSTR)&bi, sizeof (BITMAPINFOHEADER), &dwWritten, NULL);
	dwWritten = bi.biSizeImage;
	//«апись изображени€ на диск	
	    WriteFile (fh, lp, bi.biSizeImage, &dwWritten, NULL);

	GlobalUnlock(hDIB);   
	GlobalFree(hDIB);

	DeleteObject(hBitmap);
	//ќсвобождение пам€ти и закрытие файла
	//GlobalFree (GlobalHandle (lp));
	lp = NULL;
	CloseHandle (fh);
	ReleaseDC (hWnd, hDCMem);
	ReleaseDC (hWnd, hDC);
	DeleteDC (hDCMem);
	DeleteDC (hDC);
	if (dwWritten == 2) return 2;
	counter++;
	return 0;
	}
#pragma once

#include "CMatrix.h"

void fillMatrix(CMatrix&, double);

void printMatrix(CDC*, int, int, CString, CMatrix&);

void printNumber(CDC*, int, int, CString, double);

double cos(CMatrix&, CMatrix&);

CMatrix vectorProduct(CMatrix&, CMatrix&);

double scalarProduct(CMatrix&, CMatrix&);

double module(CMatrix&);

CMatrix sphericalToCartesian(CMatrix&);
// Copyright (C) 2026 Pedro J. Martinez-Ferrer
// SPDX-License-Identifier: GPL-3.0-or-later


#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N_SQ (4 * 1024 * 1024 / sizeof(double)) // ~4 MiB per matrix

void fill(double *array, const size_t n);
double dot(const double *a, const double *b, const size_t n);
void gemm(const double *a, const double *b, double *c, const size_t n);

int main() {
  size_t n;
  double elapsed, norm;
  double *a, *b, *c;
  clock_t start, end;

  n = (size_t)sqrt((double)N_SQ);

  a = malloc(n * n * sizeof(double));
  b = malloc(n * n * sizeof(double));
  c = malloc(n * n * sizeof(double));

  fill(a, n * n);
  fill(b, n * n);
  fill(c, n * n);

  start = clock();
  gemm(a, b, c, n);
  end = clock();

  norm = dot(c, c, n * n);
  norm = sqrt(fabs(norm));
  elapsed = (double)(end - start) / CLOCKS_PER_SEC;
  printf("c matrix norm = %.6e, time = %.6e seconds\n", norm, elapsed);

  free(a);
  free(b);
  free(c);

  return 0;
}

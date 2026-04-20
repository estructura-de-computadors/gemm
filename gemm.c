// Copyright (C) 2026 Pedro J. Martinez-Ferrer
// SPDX-License-Identifier: GPL-3.0-or-later


#include <stdlib.h>

void gemm(const double *a, const double *b, double *c, const size_t n) {
  size_t i, j, k;
  double sum;

  for (i = 0; i < n; ++i) {
    for (j = 0; j < n; ++j) {
      sum = 0.0;
      for (k = 0; k < n; ++k) {
        sum += a[i * n + k] * b[k * n + j];
      }
      c[i * n + j] = sum;
    }
  }
}

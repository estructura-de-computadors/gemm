// Copyright (C) 2026 Pedro J. Martinez-Ferrer
// SPDX-License-Identifier: GPL-3.0-or-later


#include <stdlib.h>

double dot(const double *a, const double *b, const size_t n) {
  size_t i;
  double result;

  result = 0.0;
  for (i = 0; i < n; ++i) {
    result += a[i] * b[i];
  }

  return result;
}

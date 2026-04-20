// Copyright (C) 2026 Pedro J. Martinez-Ferrer
// SPDX-License-Identifier: GPL-3.0-or-later


#include <stdlib.h>

#define HALF_RANGE 100

void fill(double *array, const size_t n) {
  size_t i;

  for (i = 0; i < n; ++i) {
    array[i] = -HALF_RANGE + (2.0 * HALF_RANGE * i) / (double)n;
  }
}

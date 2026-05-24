# Copyright (C) 2026 Pedro J. Martinez-Ferrer
# SPDX-License-Identifier: GPL-3.0-or-later

.section .text
.globl   gemm
.type    gemm, @function

# void gemm(const double *a, const double *b, double *c, size_t n)
gemm:
	mv t0, zero                 # i = 0

loop_i:
	bgeu t0, a3, end_i          # i >= n

	mul t3, t0, a3              # i * n
	mv  t1, zero                # j = 0

loop_j:
	bgeu t1, a3, end_j          # j >= n

	fmv.d.x ft0, zero           # sum = 0.0
	mv      t2, zero            # k = 0

loop_k:
	bgeu t2, a3, end_k          # k >= n

	add  t4, t3, t2             # (i * n) + k
	slli t4, t4, 3              # (i * n + k) * 8
	add  t4, a0, t4             # &a[i * n + k]
	fld  ft1, 0(t4)             # a[i * n + k]

	mul  t5, t2, a3             # k * n
	add  t5, t5, t1             # (k * n) + j
	slli t5, t5, 3              # (k * n + j) * 8
	add  t5, a1, t5             # &b[k * n + j]
	fld  ft2, 0(t5)             # b[k * n + j]

	fmadd.d ft0, ft1, ft2, ft0  # sum += ft1 * ft2

	addi t2, t2, 1              # k += 1
	j    loop_k

end_k:
	add  t4, t3, t1             # (i * n) + j
	slli t4, t4, 3              # (i * n + j) * 8
	add  t4, a2, t4             # &c[i * n + j]
	fsd  ft0, 0(t4)             # c[i * n + j] = sum

	addi t1, t1, 1              # j += 1
	j    loop_j

end_j:
	addi t0, t0, 1              # i += 1
	j    loop_i

end_i:
	ret

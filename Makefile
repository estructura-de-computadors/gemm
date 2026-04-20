# Copyright (C) 2026 Pedro J. Martinez-Ferrer
# SPDX-License-Identifier: GPL-3.0-or-later


# Compilation flags
CC = riscv64-linux-gnu-gcc
CFLAGS = -static -O2 -Wall -std=c11

# Execution flags
QEMU = qemu-riscv64
QEMU_OPTS = -cpu max,v=true,vlen=128,elen=64


# All matrix multiplications
all: matrix_mult_c matrix_mult_scalar matrix_mult_vector

run_all: run_matrix_mult_c run_matrix_mult_scalar run_matrix_mult_vector


# C matrix multiplication
matrix_mult_c: matrix_mult.c dot.c fill.c gemm.c
	$(CC) $(CFLAGS) -march=rv64gc -o \
	matrix_mult_c matrix_mult.c dot.c fill.c gemm.c -lm

run_matrix_mult_c: matrix_mult_c
	$(QEMU) ./matrix_mult_c


# RISC-V "scalar" matrix multiplication
matrix_mult_scalar: matrix_mult.c dot.c fill.c gemm_riscv_scalar.s
	$(CC) $(CFLAGS) -march=rv64gc -o \
	matrix_mult_scalar matrix_mult.c dot.c fill.c gemm_riscv_scalar.s -lm

run_matrix_mult_scalar: matrix_mult_scalar
	$(QEMU) ./matrix_mult_scalar


# RISC-V "vector" matrix multiplication
matrix_mult_vector: matrix_mult.c dot.c fill.c gemm_riscv_vector.s
	$(CC) $(CFLAGS) -march=rv64gcv -o \
	matrix_mult_vector matrix_mult.c dot.c fill.c gemm_riscv_vector.s -lm

run_matrix_mult_vector: matrix_mult_vector
	$(QEMU) $(QEMU_OPTS) ./matrix_mult_vector


# Clean repository
clean:
	rm -f matrix_mult_*


.PHONY: all run_matrix_mult_c run_matrix_mult_scalar run_matrix_mult_vector clean

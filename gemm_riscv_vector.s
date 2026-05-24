# Copyright (C) 2026 Pedro J. Martinez-Ferrer
# SPDX-License-Identifier: GPL-3.0-or-later

.section .text
.globl   gemm
.type    gemm, @function

# void gemm(const double *a, const double *b, double *c, size_t n)
gemm:
# TODO: Pas 1 - Incialització de la variable d'inducció, d'acumulació i longitud del vector:
# - Inicialitza la variable d'inducció del bucle.
# - Setetja el valor de la longitud del vector amb `vsetvli`.
# - Identifica quin dels tres bucles vectoritzaràs.

loop_i:
# TODO: Pas 2 - Bucle extern:
# - Instruccions del bucle `i`.
# - for (i = 0; i < n; ++i) {

loop_j:
# TODO: Pas 3 - Bucle intermig:
# - Instruccions del bucle `j`.
# - for (j = 0; j < n; ++j) {
# - sum = 0.0

loop_k:
# TODO: Pas 4 - Bucle intern:
# - Instruccions del bucle `k`.
# - Aquí hi ha el producte escalar entre una fila d'A i una columna de B.
# - for (k = 0; k < n; ++k) {
# - Suposarem que n és multiple de la mida del vector.
# - Pregunta: què passaria si n no fos múltiple de la mida del vector?
# - Quantes posicions saltem en k?
# - El resultat s'acumula a la variable `sum`, en un registre vectorial.
# - sum += a[i * n + k] * b[k * n + j]

end_k:
# TODO: Pas 5 - Acabar el bucle intermig:
# - Aquí el valor `sum` es guarda en la posició corresponent de C.
# - c[i * n + j] = sum
# - Abans, però, s'ha de passar d'un registre vectorial a un d'escalar.
# - Quantes posicions saltem en j?

end_j:
# TODO: Pas 6 - Acabar el bucle extern:
# - Quantes posicions saltem en i?

end_i:
	ret

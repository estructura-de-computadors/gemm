# Avaluació de laboratori: Vectorització en RISC-V (RVV)

> **Instruccions:** Respon de manera clara i honesta. Aquest instrument avalua tant la comprensió tècnica com l'ús crític dels agents d'IA. Aquest fitxer s'ha d'omplir directament al repositori i lliurar-lo segons les indicacions del professorat.

**Número de grup:** _(Escriu aquí el número)_

**Membres del grup:** _(Nom i cognoms)_

## 1. Resultats i discussió

### 1.1 Anàlisi quantitativa de rendiment

A continuació, indica el rendiment obtingut en el simulador (en temps d'execució mesurat en segons) per al problema de vectorització assignat:

| Implementació | Resultat (norma) | Temps d'execució (s) | Speedup |
| :--- | :---: | :---: | :---: |
| **C escalar** (`gemm.c`) | | | |
| **RISC-V escalar** (`gemm_riscv_scalar.s`) | | | |
| **RISC-V vectorial (VL constant)** (`gemm_riscv_vector.s`) | | | |
| **RISC-V vectorial (VL variable)** (`gemm_riscv_vector_VL.s`) | | | |

Adjunta en un fitxer separat:

* El detall del consum associat a les interaccions amb l'agent (tokens, requests, etc.).
* La sortida per terminal de totes les comandes efectuades per l'agent.

### 1.2 Anàlisi qualitativa: Interaccions rellevants

Adjunta en un fitxer separat la transcripció completa del xat. Identifica aquí la **interacció més crítica o rellevant**:

* **ID de la interacció/prompt:**

 > _(Ex: Prompt #4: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...")_

* **Per què va ser crítica?**

 > _(Justificació de la dificultat o del canvi de rumb en el codi)_.

* **Impacte en la solució final:**

 > _(Descriu com va canviar el codi vectorial)_.

## 2. Qüestionari de reflexió i ús de la IA

### 2.1 Dimensió tècnica (instruccions RVV)

En quina mesura l'ús de la IA t'ha ajudat a entendre millor les instruccions vectorials RVV (com `vsetvli`, `vle64.v`, `vfmacc.vv`) i la gestió de la longitud dels vectors (VL) de RISC-V?

> _Escriu la teva resposta aquí..._

### 2.2 Pensament crític i validació

Quantes vegades has hagut de corregir el codi generat per la IA perquè no complia l'estàndard **RVV 1.0** o contenia errors d'assemblador? Descriu breument un error detectat.

> _Escriu la teva resposta aquí..._

### 2.3 Transparència i integritat

Identifica explícitament quines parts del codi han estat generades íntegrament per la IA i si hi ha hagut alguna modificació manual escrita per tu.

| Codi | Modificacions |
| :--- | :--- |
| `gemm.c` | Proporcionat |
| `gemm_riscv_scalar.s` | Proporcionat |
| `gemm_riscv_vector.s` (pas 1) | |
| `gemm_riscv_vector.s` (pas 2)| |
| `gemm_riscv_vector.s` (pas 3) | |
| `gemm_riscv_vector.s` (pas 4) | |
| `gemm_riscv_vector.s` (pas 5) | |
| `gemm_riscv_vector.s` (pas 6) | |
| `gemm_riscv_vector_VL.s` | |

> _Elabora la teva resposta aquí..._

### 2.4 Càrrega cognitiva

Sents que la IA t'ha "alliberat" de la sintaxi feixuga de RISC-V per centrar-te principalment en l'algoritme (estratègia de _intel·ligència augmentada_ de Holmes et al. (2019))?

> _Escriu la teva resposta aquí..._

### 2.5 Satisfacció, exploració i multitasca

Consideres que l'agent t'ha permès abordar solucions més *complexes* que treballant de manera *tradicional*?

> _Escriu la teva resposta aquí..._

Com has aprofitat el temps mentre l'agent processava les teves peticions (algunes poden trigar diversos minuts)?

> _Escriu la teva resposta aquí..._

## 3. Mètriques d'eficiència d'IA agèntica

| Indicador | Valor |
| :--- | :--- |
| **Nombre total de prompts** | |
| **Consum estimat (tokens, requests, etc.)** | |
| **Duració total de la sessió (minuts)** | |
| **Taxa d'èxit de l'agent (codi funcional sense canvis humans, %)** | |

## 4. Lliçons apreses

Elabora un llistat de les lliçons apreses que, segons la teva opinió, t'han resultat més importants: 

> * _Lliçó 1: breu explicació de l'aprenentatge._
> * _Lliçó 2: breu explicació de l'aprenentatge._
> * ...

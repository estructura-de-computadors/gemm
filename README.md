# Repte de vectorització RISC-V: Multiplicació de matrius (gemm)

## 👋 Introducció

Benvinguts al segon repte pràctic de l'assignatura **Estructura de Computadors (EC)** de la Facultat d'Informàtica de Barcelona (FIB) a la Universitat Politècnica de Catalunya (UPC). En aquesta sessió abordarem l'acceleració de la multiplicació de dos matrius (en anglès: _general matrix-matrix multiplicacion_ - `gemm`) utilitzant l'extensió vectorial RVV de RISC-V, amb el suport d'un agent d'intel·ligència artificial (GitHub Copilot) que actuarà com el teu tutor personal.

Aquesta activitat forma part d'un projecte d'innovació docent que busca potenciar la teva autonomia i preparar-te per a les arquitectures de computació d'altes prestacions (HPC).

## 🎯 Objectiu de la pràctica i resultats d'aprenentatge

L'objectiu és passar d'una implementació **escalar** (execució instrucció a instrucció de manera seqüencial) a una implementació **vectorial** (execució paral·lela de diverses instruccions). Aprendreu a utilitzar el concepte *vector length agnostic* (VLA), que permet que el mateix codi s'executi en processadors amb diferents amplades de vector.

La multiplicació de matrius es pot interpretar com una aplicació successiva de productes escalars entre un primer vector que representa les files d'una matriu $\mathbf{A}$ i un segon que representa les columnes d'una matriu $\mathbf{B}$:

\[
\mathbf{C} = \mathbf{A}\mathbf{B} \iff
c_{ij} = \sum_{k=0}^{n-1} a_{ik} b_{kj} =a_{i0} b_{0j} + a_{i1} b_{1j} + \ldots + a_{i,n-1} b_{n-1,j}.
\]

La imatge següent compara el recorregut seqüencial d'un vector (esquerra) contra el recorregut vectorial (dreta) de dos elements alhora, cicle a cicle. Fixa't que el vectorial acaba en la **meitat** de temps:

![seq](seq.gif)
![vec](vec.gif)

El teu objectiu és:
1. Analitzar el codi escalar de referència i resoldre dubtes relacionades.
2. Identificar quin dels tres bucles ($i, j, k$) és el candidat més *senzill* per vectoritzar.
3. Implementar una solució vectorial que aprofiti la naturalesa **VLA (vector length agnostic)** de RISC-V per obtenir un speedup significatiu.

## 📋 Treball previ

Abans de continuar, realitza les següents tasques obligatòries que et permetran familiaritzar-te amb les instruccions vectorials de RISC‑V, la plataforma GitHub Education i l'eina Copilot. La durada estimada són 60 minuts.

### Introducció a RVV

Segueix el tutorial de Krste Asanovic i Roger Espasa. Els enllaços al material són:

* [Transparències del tutorial RVV](https://riscv.org/wp-content/uploads/2024/12/15.20-15.55-18.05.06.VEXT-bcn-v1.pdf)
* [Tutorial de 35 minuts de YouTube sobre l'ISA vectorial de RISC-V](https://www.youtube.com/watch?v=S4fxBZD79gc)

### Introducció a GitHub Education (Copilot) i Git

Crea un compte de GitHub Education amb el teu correu electrònic de la UPC (hauràs de verificar que ets estudiant). També et recomano el tutorial sobre Git i GitHub. Els enllaços al material són:

* [Documentació oficial i guia ràpida de GitHub Education](https://docs.github.com/en/education/quickstart)
* [Tutorial a Git i GitHub](https://github.com/estructura-de-computadors/vectoritzacio-riscv-introduction-to-git-and-github-github-starter-course)

## 🚀 Metodologia de treball

1. **Preparació:** Abans de començar, assegura't d'haver revisat el material previ sobre l'ISA vectorial de RISC-V i el funcionament de l'extensió RVV. Instal·la VS Code seguint les instruccions descrites en aquest document. Finalment, recorda afegir al repositori el PDF de l'especificació RVV 1.0 perquè l'agent pugui treballar correctament.
2. **Configuració de l'agent:** Obre el fitxer `AGENTS.md` per comprendre com està definit el rol de l'agent `fiber-teacher`.
3. **Desenvolupament iteratiu:** Parla amb l'agent per entendre com s'ha d'implementar la vectorització, pas a pas. Pots demanar-li detalls específics sobre com configurar la longitud del vector `VL` amb la instrucció `vsetvli` i com realitzar la reducció final d'un registre vectorial a un d'escalar.
4. **Validació:** Demana a l'agent comparar els resultats entre les versions escalar i vectorial fent servir les comandes disponibles al `Makefile`, el temps mesurats, el speedup final obtingut i el teòric.
5. **Mesurabilitat**: Posat en marxa el cronòmetre per mesurar el temps que has dedicat a realitzar la pràctica. Mesura també el budget consumit d'interaccions (mesurat en tokens, requests, etc.), els outputs de la terminal i la transcripció completa del xat amb l'agent. Recorda adjuntar aquesta informació com a part del lliurament.

## 📂 Estructura del repositori

Aquest repositori conté els següents fitxers clau:

* **`Makefile`**: Eina per automatitzar la compilació, l'execució i el testeig del codi.
* **`matrix_mult.c`**: El programa principal (`main`) que s'encarrega d'inicialitzar les matrius, cridar les funcions de multiplicació de matrius i mesurar-ne el temps d'execució.
* **`gemm.c`**: Implementació de referència en llenguatge C de l'algoritme de multiplicació de matrius.
* **`gemm-riscv-scalar.s`**: Codi font en assemblador RISC-V utilitzant instruccions escalars. Es tracta d'una segona solució de referència escrita en assemblador.
* **`gemm_riscv_vector.s`**: Fitxer on has de desenvolupar la solució vectorial utilitzant l'extensió RVV. Conté una estructura bàsica amb TODOs per guiar-te.
* **`AGENTS.md`**: Fitxer de configuració de la IA agèntica. Aquí es defineix el comportament de l'agent.
* **`EVALUATION.md`**: Informe final que has d'omplir i lliurar al final de la pràctica, incloent-hi l'anàlisi de rendiment i la reflexió sobre l'ús que has fet de la IA.

## 🛠️ Instruccions d'ús

### Compilació i execució

Les diferents regles es troben al fitxer `Makefile`.  Per compilar un dels binaris associats a la multiplicació de matrius, utilitza, en el cas de la implementació en llenguatge C:

```bash
make matrix_mult_c
```

Per executar el binari generat utilitza:

```bash
make run_matrix_mult_c
```

### Neteja del directori

Per eliminar els binaris utilitza:

```bash
make clean
```

### Visual Code Studio

1. Crea un compte de [GitHub Education](https://github.com/education).
2. Instal·la l'extensió `General Assembly Hightlighter` (Vicent Vaeza) de VS Code.
3. Instal·la l'extensió `GitHub Copilot Chat` (GitHub) de VS Code i configura-la amb el teu compte GitHub Education.
4. Instal·la l'extensió `Dev Containers` (Microsoft) de VS Code.
5. Obre aquest repositori amb VS Code.
6. L'extensió `Dev Containers` et demanarà *reobrir* el repositori dins d'un contenidor (Docker): **accepta!**

### GitHub Copilot Chat

1. Dins de la finestra xat, a baix de tot, reemplaça l'agent `Agent` (per defecte) per l'agent personalitzat `fiber-teacher`.
2. Comença una conversa saludant l'agent i dient-li que ets estudiant d'Estructura de Computadors.
3. L'agent s'introduirà i començarà a posar-te preguntes.
4. A continuació, pots comentar-li que et faci un repàs de l'algoritme de multiplicació de matrius, analitzant les implementacions escalars en llenguatge C i RISC-V.
5. Recorda que l'agent és completament autònom i no necessita intervenció humana. S'aconsella demanar a l'agent anar pas a pas: n'hi ha **6** en aquesta pràctica.
6. Si ho consideres necessari, demana a l'agent que torni a començar o expliqui els passos en més detall.
7. Assegura't de confirmar l'execució de comandes per part de l'agent: `make`, `find`, `pdftotext` ...

## 📝 Lliurament

Un cop finalitzada la sessió, recorda completar tots els apartats del fitxer `EVALUATION.md` i adjuntar els tres arxius addicionals demanats:

1. **`prompt.md`**: Transcripció completa del xat amb l'agent.
2. **`terminal.md`**: Outputs del terminal generats per l'agent.
3. **`budget.md`**: Budget consumit durant les interaccions (en tokens, premium requests, etc.).

Es valorarà especialment:

* La millora de rendiment assolida (speedup).
* La qualitat i el pensament crític demostrat en les teves interaccions amb l'agent d'IA.
* Les qualitat de les teves respostes a les preguntes generades per l'agent.
* La transparència en identificar quines parts d'aquesta metodologia docent t'han *realment* ajudat a entendre un problema tan complex com és la vectorització de RISC-V en instruccions d'assemblador.

## 📚 Material addicional

* [Especificació de la versió 1.0 de l'extensió RVV](https://github.com/riscvarchive/riscv-v-spec/releases/download/v1.0/riscv-v-spec-1.0.pdf)

## ⚖️ Llicència

Aquest projecte està llicenciat sota la Llicència Pública General GNU versió 3.0 o posterior (GPL-3.0-or-later). Consulteu el fitxer [LICENSE](LICENSE) per a més detalls.

## 📇 Informació de contacte

Dr. Pedro J. Martinez-Ferrer \
Departament d'Arquitectura de Computadors (DAC) \
Universitat Politècnica de Catalunya - BarcelonaTech (UPC) \
Campus Nord, Edif. D6, C. Jordi Girona 1-3, 08034 Barcelona, Spain \
pedro.martinez.ferrer [at] upc [dot] edu

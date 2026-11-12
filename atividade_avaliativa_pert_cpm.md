# 🏆 Atividade Avaliativa Prática: PERT/CPM e Gestão de Prazos
**Disciplina:** Planejamento e Controle da Produção (PCP) / Gestão de Projetos  
**Público-alvo:** Ensino Médio Técnico e Graduação Inicial  
**Modalidade:** Em duplas ou trios (ou individual)  
**Tempo estimado:** 60 a 80 minutos  
**Valor total:** 10,0 pontos  

---

## 🎯 Objetivo da Atividade
Colocar em prática os conceitos fundamentais de planejamento e controle de projetos aprendidos em aula:
1. Lidar com a incerteza de prazos calculando a duração média pelo **Método PERT**;
2. Construir o mapa visual de precedências (**Rede AON — Atividade no Nó**);
3. Calcular os tempos mais cedo e mais tarde (**Ida e Volta**) utilizando as siglas oficiais bilíngues;
4. Calcular a **Folga Total** de cada atividade e identificar o **Caminho Crítico**;
5. Tomar decisões estratégicas de gestão diante de atrasos imprevistos e propostas de antecipação de prazo (*Crashing*).

---

## 🏎️ Situação-Problema: "Missão EcoSprint — O Carro Solar da Feira de Ciências"

A turma de vocês foi selecionada para representar a instituição na grande **Competição Regional de Veículos Sustentáveis**. A equipe precisa planejar, montar e testar o protótipo do **EcoSprint**, um veículo elétrico movido a energia solar.

O coordenador da feira avisou que o evento já tem data marcada e **não haverá nenhuma tolerância para atrasos na entrega**. A equipe dividiu o trabalho em 8 tarefas principais:

| Tarefa | O que deve ser feito? | Depende de quem? (Predecessoras) | Estimativas de Tempo |
|:---:|---|:---:|---|
| **A** | Planejamento geral e desenho conceitual | *Nenhuma (início de tudo)* | Duração certa: **2 dias** |
| **B** | Projetar a estrutura mecânica (chassi e rodas) | Depende de **A** | Duração certa: **4 dias** |
| **C** | Escolher e comprar células solares e baterias | Depende de **A** | **Incerteza (PERT)**: $o=1\text{d}$, $m=3\text{d}$, $p=5\text{d}$ |
| **D** | Cortar e montar o chassi de alumínio | Depende de **B** | Duração certa: **5 dias** |
| **E** | Montar o circuito elétrico e suportes | Depende de **C** | Duração certa: **4 dias** |
| **F** | Instalar os eixos e acoplar as rodas no chassi | Depende de **D** | Duração certa: **3 dias** |
| **G** | Ligar o motor elétrico com o circuito e sensores | Depende de **D** e **E** | Duração certa: **3 dias** |
| **H** | Testes de pista, calibração e entrega final | Depende de **F** e **G** | Duração certa: **2 dias** |

---

## 📋 Regras de Ouro e Siglas para os Cálculos

Lembrem-se das convenções oficiais vistas em sala de aula:
- **Linha de Cima (Caminhada da IDA · para a frente):**
  - **ES = IMC / DCI:** Início Mais Cedo (Data Mais Cedo de Início) $\to$ o projeto começa em $t = 0$. Em junções de setas, vence sempre o **MAIOR** tempo de término anterior!
  - **EF = TMC / DCT:** Término Mais Cedo $\to \text{EF} = \text{ES} + \text{Duração}$.
- **Linha de Baixo (Caminhada da VOLTA · para trás):**
  - **LF = TMT / DTT:** Término Mais Tarde $\to$ no nó final, fixamos $\text{LF} = \text{Duração Total do Projeto}$. Em bifurcações na volta, respeitamos sempre o **MENOR** prazo limite!
  - **LS = IMT / DTI:** Início Mais Tarde $\to \text{LS} = \text{LF} - \text{Duração}$.
- **Folga Total (FT):** $\text{FT} = \text{LS} - \text{ES} = \text{LF} - \text{EF} \quad (\text{ou } \text{IMT} - \text{IMC} = \text{TMT} - \text{TMC})$.
- **Caminho Crítico:** Sequência contínua de tarefas com **Folga Zero ($\text{FT} = 0$)**. É o caminho mais demorado que governa o fim do projeto!

---

## ✍️ Questões da Atividade

### 🔹 Questão 1: O Tempo Esperado no Método PERT (1,5 pontos)
Na **Tarefa C**, a equipe está insegura com o prazo de entrega das células solares pelo fornecedor. Por isso, foram levantados 3 palpites com os fornecedores:
- **Otimista ($o$):** 1 dia (se a entrega for expressa);
- **Mais Provável ($m$):** 3 dias (o prazo normal em condições normais);
- **Pessimista ($p$):** 5 dias (se houver chuva e atraso na transportadora).

**1.1:** Utilizando a fórmula da média ponderada do PERT:
$$t_e = \frac{o + 4m + p}{6}$$
Calcule a **duração esperada ($t_e$)** da Tarefa C, mostrando a substituição numérica passo a passo.  
*(Adote esse valor inteiro para todos os cálculos seguintes).*

---

### 🔹 Questão 2: O Mapa da Rede AON e Caminhos Possíveis (2,0 pontos)
**2.1:** Desenhe a rede de tarefas do projeto utilizando caixinhas (**nós**) e setas (**dependências**).  
*(Atenção: a tarefa G recebe setas de D e de E; a tarefa H recebe setas de F e de G).*

**2.2:** Identifique e escreva todos os caminhos possíveis que levam do **Início (A)** até o **Fim (H)**, somando a duração das tarefas de cada um:
- **Caminho 1:** A $\to$ \_\_\_ $\to$ \_\_\_ $\to$ \_\_\_ $\to$ \_\_\_ = \_\_\_\_ dias.
- **Caminho 2:** A $\to$ \_\_\_ $\to$ \_\_\_ $\to$ \_\_\_ $\to$ \_\_\_ = \_\_\_\_ dias.
- **Caminho 3:** A $\to$ \_\_\_ $\to$ \_\_\_ $\to$ \_\_\_ $\to$ \_\_\_ = \_\_\_\_ dias.
- *Qual desses caminhos é o mais demorado? O que esse tempo representa para o projeto?*

---

### 🔹 Questão 3: Tabela de Tempos, Folgas e Caminho Crítico (3,0 pontos)
Preencha a tabela de cronograma completa do projeto:

| Tarefa | Duração ($d$) | Início Cedo (ES / IMC) | Término Cedo (EF / TMC) | Início Tarde (LS / IMT) | Término Tarde (LF / TMT) | Folga Total (FT) | É Crítica? (Sim / Não) |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **A** | 2 dias |  |  |  |  |  |  |
| **B** | 4 dias |  |  |  |  |  |  |
| **C** | *(calc. PERT)* |  |  |  |  |  |  |
| **D** | 5 dias |  |  |  |  |  |  |
| **E** | 4 dias |  |  |  |  |  |  |
| **F** | 3 dias |  |  |  |  |  |  |
| **G** | 3 dias |  |  |  |  |  |  |
| **H** | 2 dias |  |  |  |  |  |  |

**3.1:** Qual é a **Duração Total Mínima** do projeto?  
**3.2:** Quais tarefas pertencem ao **Caminho Crítico** (sequência com Folga Zero)?

---

### 🔹 Questão 4: Tomada de Decisão sob Pressão (2,5 pontos)

#### ⚠️ Cenário 1: Atraso do Fornecedor (1,25 pontos)
O fornecedor das células solares ligou informando que a **Tarefa C vai atrasar 2 dias** além do previsto (passando de 3 para 5 dias).
- Esse atraso fará a equipe perder o prazo de apresentação final do carro? **Sim ou Não?**
- **Explique tecnicamente** usando os valores de **Folga** que você calculou na tabela da Questão 3.

#### 💰 Cenário 2: Onde Investir Recursos Extras? (*Crashing*) (1,25 pontos)
A direção da escola conseguiu uma verba extra e sugeriu pagar uma oficina para fazer a solda e montagem da **Tarefa E em apenas 2 dias** (reduzindo 2 dias de sua duração original).
- O líder da equipe deve aceitar gastar a verba na Tarefa E para tentar antecipar a entrega do carro? **Sim ou Não? Justifique.**
- Se a equipe precisasse de verdade entregar o projeto **2 dias antes**, em quais tarefas ela deveria negociar redução de prazo?

---

### 🔹 Questão 5: Conexão com o Mundo Real e o PCP (1,0 ponto)
Em um texto curto de 4 a 6 linhas, responda com suas palavras:
*"Por que uma grande montadora de veículos (como Fiat, Toyota ou Tesla) não gerencia suas fábricas apenas com uma lista de afazeres no bloco de notas? Qual é o perigo de uma empresa não saber quais são suas tarefas críticas e quais têm folga?"*

---

<br>

---

# 📖 GABARITO DO PROFESSOR (COM RESOLUÇÃO PASSO A PASSO)

### Resolução da Questão 1 (1,5 pontos)
- Dados: $o = 1\text{ d}$, $m = 3\text{ d}$, $p = 5\text{ d}$.
$$t_e = \frac{1 + 4(3) + 5}{6} = \frac{1 + 12 + 5}{6} = \frac{18}{6} = \mathbf{3\text{ dias}}.$$
- *Distribuição de pontos:* 1,0 ponto pela fórmula e substituição correta; 0,5 ponto pelo valor final (3 dias).

---

### Resolução da Questão 2 (2,0 pontos)
**2.1 Desenho da Rede AON (1,0 ponto):**
- Início em A; A aponta para B e C; B aponta para D; C aponta para E; D aponta para F e G; E aponta para G; F e G apontam para H.

**2.2 Levantamento dos Caminhos (1,0 ponto):**
1. **Caminho 1 (via F):** $\text{A} \to \text{B} \to \text{D} \to \text{F} \to \text{H} = 2 + 4 + 5 + 3 + 2 = \mathbf{16\text{ dias}}$ 👑
2. **Caminho 2 (via D e G):** $\text{A} \to \text{B} \to \text{D} \to \text{G} \to \text{H} = 2 + 4 + 5 + 3 + 2 = \mathbf{16\text{ dias}}$ 👑
3. **Caminho 3 (via Elétrica C e E):** $\text{A} \to \text{C} \to \text{E} \to \text{G} \to \text{H} = 2 + 3 + 4 + 3 + 2 = \mathbf{14\text{ dias}}$
- *Análise:* Os Caminhos 1 e 2 são os mais longos (empatados em 16 dias). Isso significa que o projeto levará no mínimo **16 dias**, pois é o tempo estritamente necessário para concluir a cadeia mecânica mais longa.

---

### Resolução da Questão 3 (3,0 pontos)
**Tabela Preenchida (2,0 pontos):**

| Tarefa | $d$ | ES (IMC) | EF (TMC) | LS (IMT) | LF (TMT) | Folga (FT) | É Crítica? |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **A** | 2 | 0 | 2 | 0 | 2 | **0** | **Sim 🚨** |
| **B** | 4 | 2 | 6 | 2 | 6 | **0** | **Sim 🚨** |
| **C** | 3 | 2 | 5 | 4 | 7 | **2** | Não |
| **D** | 5 | 6 | 11 | 6 | 11 | **0** | **Sim 🚨** |
| **E** | 4 | 5 | 9 | 7 | 11 | **2** | Não |
| **F** | 3 | 11 | 14 | 11 | 14 | **0** | **Sim 🚨** |
| **G** | 3 | 11 | 14 | 11 | 14 | **0** | **Sim 🚨** |
| **H** | 2 | 14 | 16 | 14 | 16 | **0** | **Sim 🚨** |

**3.1 Duração Total Mínima (0,5 ponto):** **16 dias**.  
**3.2 Caminho Crítico (0,5 ponto):** Há dois caminhos críticos simultâneos: **A $\to$ B $\to$ D $\to$ F $\to$ H** e **A $\to$ B $\to$ D $\to$ G $\to$ H** (ambos com folga zero em todas as etapas).

---

### Resolução da Questão 4 (2,5 pontos)
- **Cenário 1 (1,25 pontos):** **NÃO atrasa o projeto!** A Tarefa C possui **2 dias de folga total** ($\text{FT} = 2\text{ dias}$). Se ela demorar 2 dias a mais, apenas consumirá a sua folga ($\text{Folga restante} = 0$), e o caminho da parte elétrica passará de 14 para 16 dias (empatando com os caminhos críticos), mas sem aumentar o prazo final de 16 dias.
- **Cenário 2 (1,25 pontos):** **NÃO deve gastar!** A Tarefa E não é crítica e possui 2 dias de folga. Gastar dinheiro para reduzi-la não adianta nada, pois a tarefa seguinte (G) continuará esperando a tarefa mecânica D terminar no dia 11. Para antecipar o projeto em 2 dias, os recursos devem ser focados exclusivamente nas tarefas do **Caminho Crítico** comum (como **A, B, D ou H**).

---

### Resolução da Questão 5 (1,0 ponto)
- *Gabarito conceitual:* Uma lista simples não mostra quais tarefas ocorrem em paralelo nem onde estão os gargalos. Sem o CPM, a empresa pode investir dinheiro em tarefas que têm folga (desperdiçando recursos) ou descuidar de uma tarefa crítica simples, atrasando a linha inteira de montagem, quebrando compromissos com clientes (OTIF) e gerando ociosidade e custos elevados no chão de fábrica.

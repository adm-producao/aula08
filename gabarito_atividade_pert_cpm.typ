#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 1.8cm, bottom: 1.8cm),
  header: context {
    if counter(page).get().first() > 1 [
      #text(8pt, fill: rgb("#64748b"), font: "Helvetica Neue")[
        #grid(
          columns: (1fr, 1fr),
          align: (left, right),
          [Administração da Produção · Gabarito Oficial PERT/CPM],
          [Profª. Renata Oliveira]
        )
        #v(-4pt)
        #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
      ]
    ]
  },
  footer: context [
    #text(8pt, fill: rgb("#64748b"), font: "Helvetica Neue")[
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
      #v(-2pt)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [Engenharia de Materiais · CEFET-MG (`adm_prod_mat`)],
        [Página #counter(page).display() de #counter(page).final().first()]
      )
    ]
  ]
)

#set text(
  font: "Helvetica Neue",
  size: 9.5pt,
  fill: rgb("#1e293b"),
  lang: "pt"
)

#set par(justify: true, leading: 0.58em)

// Cores Institucionais
#let ufc-primary = rgb("#142c46")
#let ufc-secondary = rgb("#176b87")
#let ufc-teal = rgb("#1f8a70")
#let ufc-gold = rgb("#d97706")
#let ufc-rose = rgb("#b91c1c")
#let ufc-bg-card = rgb("#f8fafc")

// Variáveis Matemáticas PERT/CPM
#let ES = math.italic("ES")
#let EF = math.italic("EF")
#let LS = math.italic("LS")
#let LF = math.italic("LF")
#let FT = math.italic("FT")

// Estilos de Título
#show heading.where(level: 1): it => block(
  above: 12pt, below: 6pt,
  text(12.5pt, weight: "bold", fill: ufc-primary)[#it.body]
)

#show heading.where(level: 2): it => block(
  above: 10pt, below: 5pt,
  text(11pt, weight: "bold", fill: ufc-secondary)[#it.body]
)

#show heading.where(level: 3): it => block(
  above: 8pt, below: 4pt,
  text(10pt, weight: "bold", fill: ufc-primary)[#it.body]
)

// ==========================================
// PÁGINA 1: IDENTIFICAÇÃO, DADOS & QUESTÃO 1
// ==========================================

#block(
  fill: ufc-primary,
  inset: (x: 12pt, y: 9pt),
  radius: 6pt,
  width: 100%,
  stroke: 1pt + rgb("#0f172a"),
  [
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #text(8.5pt, weight: "bold", fill: rgb("#93c5fd"))[CEFET-MG · ENGENHARIA DE MATERIAIS (`adm_prod_mat`)] \
        #v(1pt)
        #text(14pt, weight: "bold", fill: white)[Gabarito Detalhado & Guia de Correção] \
        #v(1pt)
        #text(10pt, weight: "medium", fill: rgb("#e2e8f0"))[Atividade Avaliativa: Planejamento e Controle de Projetos (PERT/CPM)] \
        #v(2pt)
        #text(8.5pt, fill: rgb("#cbd5e1"))[Caso Prático: Projeto EcoSprint (Veículo Solar) · Pontuação Total: *10,0 Pontos*]
      ],
      [
        #block(
          fill: white,
          inset: 6pt,
          radius: 5pt,
          [
            #align(center)[
              #text(7pt, weight: "bold", fill: ufc-primary)[DOCENTE] \
              #text(8.5pt, weight: "bold", fill: ufc-secondary)[Profª. Renata Oliveira] \
              #text(7pt, fill: rgb("#64748b"))[Semestre Letivo 2026]
            ]
          ]
        )
      ]
    )
  ]
)

#v(4pt)

#block(
  fill: rgb("#eff6ff"),
  stroke: 0.8pt + rgb("#bfdbfe"),
  inset: (x: 8pt, y: 6pt),
  radius: 5pt,
  width: 100%,
  [
    #text(8.5pt)[
      #text(weight: "bold", fill: rgb("#1d4ed8"))[Orientações Pedagógicas para Correção:]
      Este gabarito traz a resolução analítica completa, o diagrama da rede, a demonstração algorítmica das caminhadas para frente e para trás, a análise dos múltiplos caminhos críticos e os critérios objetivos de pontuação (barema).
    ]
  ]
)

== 1. Resumo dos Dados de Entrada do Projeto EcoSprint

O projeto é estruturado em *8 atividades* interdependentes com prazo fixo e inegociável de entrega para a mostra tecnológica:

#table(
  columns: (auto, 1fr, auto, auto),
  align: (center + horizon, left + horizon, center + horizon, left + horizon),
  inset: 4.5pt,
  fill: (col, row) => if row == 0 { rgb("#e2e8f0") } else if calc.odd(row) { rgb("#f8fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e1"),
  [*Atividade*], [*Descrição do Trabalho*], [*Predecessoras*], [*Duração Estimada*],
  [*A*], [Desenho conceitual e especificações técnicas], [—], [Duração determinística: *2 dias*],
  [*B*], [Projeto e cálculo estrutural do chassi], [*A*], [Duração determinística: *4 dias*],
  [*C*], [Aquisição de células fotovoltaicas e baterias], [*A*], [*Incerteza (PERT)*: $o = 1$ d, $m = 3$ d, $p = 5$ d],
  [*D*], [Fabricação e montagem do chassi de alumínio], [*B*], [Duração determinística: *5 dias*],
  [*E*], [Montagem do chicote elétrico e suportes], [*C*], [Duração determinística: *4 dias*],
  [*F*], [Instalação da suspensão, eixos e rodas], [*D*], [Duração determinística: *3 dias*],
  [*G*], [Integração do trem de força, inversor e sensores], [*D, E*], [Duração determinística: *3 dias*],
  [*H*], [Calibração de pista, telemetria e entrega final], [*F, G*], [Duração determinística: *2 dias*]
)

#v(4pt)

== 2. Resolução Detalhada das Questões

=== Questão 1 · Estimativa de Duração PERT (Valor: 1,5 pontos)

*Enunciado:* Na Atividade C, foram levantadas três estimativas de duração devido à incerteza logística do fornecedor: otimista ($o = 1$ dia), mais provável ($m = 3$ dias) e pessimista ($p = 5$ dias). Calcular a duração esperada ($t_e$) aplicando a fórmula da média ponderada PERT.

#block(
  fill: rgb("#f0fdf4"),
  stroke: 1pt + rgb("#86efac"),
  inset: (x: 10pt, y: 7pt),
  radius: 6pt,
  width: 100%,
  [
    #text(weight: "bold", fill: rgb("#166534"))[Gabarito e Memória de Cálculo Passo a Passo:]
    $ t_e = frac(o + 4m + p, 6) = frac(1 + 4(3) + 5, 6) = frac(1 + 12 + 5, 6) = frac(18, 6) = bold(3" dias") $

    #v(2pt)
    #text(fill: rgb("#15803d"), weight: "bold")[Resultado Final Oficial:] $bold(t_e = 3" dias")$ *(adotado como valor determinístico nas etapas seguintes).*

    #v(2pt)
    #line(length: 100%, stroke: 0.5pt + rgb("#bbf7d0"))
    #text(8.5pt, fill: rgb("#166534"))[
      *Aprofundamento Estatístico (Variância e Desvio Padrão da Atividade):* \
      $sigma^2 = (frac(p - o, 6))^2 = (frac(5 - 1, 6))^2 = (frac(4, 6))^2 = frac(16, 36) approx bold(0{,}444" dias"^2) quad | quad sigma = sqrt(0{,}444) approx bold(0{,}667" dias")$.
    ]
  ]
)

#v(2pt)
#text(8.5pt)[
  *Critérios de Correção (Barema - 1,5 pts):* \
  • *1,0 ponto:* Apresentação formal da fórmula PERT e substituição numérica passo a passo ($1 + 12 + 5$). \
  • *0,5 ponto:* Resposta numérica exata ($3$ dias). *(Descontar 0,5 se apenas apresentar o número sem demonstrar o cálculo).*
]

#pagebreak()

// ==========================================
// PÁGINA 2: QUESTÃO 2 (DIAGRAMA E CAMINHOS)
// ==========================================

=== Questão 2 · Diagrama de Rede AON e Análise de Caminhos (Valor: 2,0 pontos)

*2.1 Diagrama da Rede de Precedência (Nó-na-Atividade - AON):*
Diagrama com todas as 8 caixas no padrão clássico de 6 quadrantes com cronograma integrado:

#align(center)[
  #image("img/rede_aon_gabarito.svg", width: 99%)
]

*2.2 Identificação e Cálculo dos Caminhos Possíveis da Rede:*
Da atividade inicial (A) até a entrega final (H), existem exatamente *três caminhos*:

#table(
  columns: (auto, 1fr, auto, auto),
  align: (center + horizon, left + horizon, center + horizon, center + horizon),
  inset: 5pt,
  fill: (col, row) => if row == 0 { rgb("#e2e8f0") } else if row in (1, 2) { rgb("#fef2f2") } else { rgb("#f8fafc") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  [*Caminho*], [*Sequência de Atividades*], [*Soma das Durações*], [*Classificação*],
  [*Caminho 1*], [$A -> B -> D -> F -> H$], [$2 + 4 + 5 + 3 + 2 = bold(16" dias")$], [#text(ufc-rose, weight: "bold")[Caminho Crítico 1]],
  [*Caminho 2*], [$A -> B -> D -> G -> H$], [$2 + 4 + 5 + 3 + 2 = bold(16" dias")$], [#text(ufc-rose, weight: "bold")[Caminho Crítico 2]],
  [*Caminho 3*], [$A -> C -> E -> G -> H$], [$2 + 3 + 4 + 3 + 2 = bold(14" dias")$], [Subcrítico (Folga = 2 dias)]
)

#v(4pt)

#block(
  fill: rgb("#fffbeb"),
  stroke: 1pt + rgb("#fde68a"),
  inset: (x: 10pt, y: 7pt),
  radius: 6pt,
  width: 100%,
  [
    #text(weight: "bold", fill: rgb("#92400e"))[Interpretação Gerencial Requerida (Significado do Caminho Mais Longo):] \
    Os caminhos 1 e 2 são os mais longos da rede, empatados em *16 dias*. A duração do caminho mais longo determina a *duração mínima total para a conclusão do projeto*. Nenhum veículo poderá ser entregue antes de 16 dias sem acelerar tarefas críticas. Qualquer atraso de 1 dia em qualquer atividade ao longo dos caminhos 1 ou 2 acarretará atraso direto de 1 dia na entrega final da feira.
  ]
)

#v(4pt)
#text(8.5pt)[
  *Critérios de Correção (Barema - 2,0 pts):* \
  • *1,0 ponto (Item 2.1):* Rede AON desenhada com as 8 caixas e conexões corretas, destacando as convergências em G e H. \
  • *0,5 ponto (Item 2.2):* Listagem correta dos 3 caminhos e cálculo das respectivas somas (16, 16 e 14 dias). \
  • *0,5 ponto (Item 2.2):* Explicação gerencial fundamentada sobre o significado do caminho mais longo (prazo mínimo e gargalo).
]

#pagebreak()

// ==========================================
// PÁGINA 3: QUESTÃO 3 (CRONOGRAMA E FOLGAS)
// ==========================================

=== Questão 3 · Cronograma Completo, Folgas e Caminho Crítico (Valor: 3,5 pontos)

*Tabela Oficial de Programação Preenchida:*

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
  inset: 5.5pt,
  fill: (col, row) => if row == 0 {
    rgb("#142c46")
  } else if row in (1, 2, 4, 6, 7, 8) {
    rgb("#fef2f2") // Destaque crítico
  } else {
    white
  },
  stroke: 0.5pt + rgb("#cbd5e1"),
  [#text(white, weight: "bold")[Ativ.]],
  [#text(white, weight: "bold")[$d$]],
  [#text(white, weight: "bold")[ES (IMC)]],
  [#text(white, weight: "bold")[EF (TMC)]],
  [#text(white, weight: "bold")[LS (IMT)]],
  [#text(white, weight: "bold")[LF (TMT)]],
  [#text(white, weight: "bold")[Folga (FT)]],
  [#text(white, weight: "bold")[Crítica?]],
  
  [*A*], [2 dias], [0], [2], [0], [2], [*0*], [#text(ufc-rose, weight: "bold")[SIM]],
  [*B*], [4 dias], [2], [6], [2], [6], [*0*], [#text(ufc-rose, weight: "bold")[SIM]],
  [*C*], [3 dias], [2], [5], [4], [7], [*2*], [Não],
  [*D*], [5 dias], [6], [11], [6], [11], [*0*], [#text(ufc-rose, weight: "bold")[SIM]],
  [*E*], [4 dias], [5], [9], [7], [11], [*2*], [Não],
  [*F*], [3 dias], [11], [14], [11], [14], [*0*], [#text(ufc-rose, weight: "bold")[SIM]],
  [*G*], [3 dias], [11], [14], [11], [14], [*0*], [#text(ufc-rose, weight: "bold")[SIM]],
  [*H*], [2 dias], [14], [16], [14], [16], [*0*], [#text(ufc-rose, weight: "bold")[SIM]]
)

#v(3pt)
*3.1 Duração Total Mínima do Projeto:* $bold(16" dias")$ \
*3.2 Caminhos Críticos Identificados:* O projeto apresenta *dois caminhos críticos concomitantes*:
1. $bold(A -> B -> D -> F -> H)$
2. $bold(A -> B -> D -> G -> H)$

#block(
  fill: rgb("#f8fafc"),
  stroke: 1pt + rgb("#e2e8f0"),
  inset: (x: 9pt, y: 7pt),
  radius: 6pt,
  width: 100%,
  [
    #text(weight: "bold", fill: ufc-primary)[Demonstração Algorítmica dos Cálculos de Ida e Volta:]
    #text(8.5pt)[
      - *Caminhada para Frente (Ida - Determinação dos Inícios Mais Cedo):*
        - $A$: $ES = 0 arrow.r EF = 0 + 2 = 2$.
        - $B$: Predecessora $A (EF = 2) arrow.r ES = 2 arrow.r EF = 2 + 4 = 6$.
        - $C$: Predecessora $A (EF = 2) arrow.r ES = 2 arrow.r EF = 2 + 3 = 5$.
        - $D$: Predecessora $B (EF = 6) arrow.r ES = 6 arrow.r EF = 6 + 5 = 11$.
        - $E$: Predecessora $C (EF = 5) arrow.r ES = 5 arrow.r EF = 5 + 4 = 9$.
        - $F$: Predecessora $D (EF = 11) arrow.r ES = 11 arrow.r EF = 11 + 3 = 14$.
        - $G$: *Convergência de $D$ e $E$!* Regra do máximo: $ES_G = max(EF_D, EF_E) = max(11, 9) = bold(11) arrow.r EF_G = 11 + 3 = 14$.
        - $H$: *Convergência de $F$ e $G$!* Regra do máximo: $ES_H = max(EF_F, EF_G) = max(14, 14) = bold(14) arrow.r EF_H = 14 + 2 = bold(16)$.
      - *Caminhada para Trás (Volta - Determinação dos Inícios Mais Tarde):*
        - $H$: Fixa-se $LF_H = 16 arrow.r LS_H = 16 - 2 = 14$.
        - $F$: Sucessora $H (LS = 14) arrow.r LF = 14 arrow.r LS = 14 - 3 = 11$.
        - $G$: Sucessora $H (LS = 14) arrow.r LF = 14 arrow.r LS = 14 - 3 = 11$.
        - $E$: Sucessora $G (LS = 11) arrow.r LF = 11 arrow.r LS = 11 - 4 = 7$.
        - $D$: *Divergência na volta para $F$ e $G$!* Regra do mínimo: $LF_D = min(LS_F, LS_G) = min(11, 11) = bold(11) arrow.r LS_D = 11 - 5 = 6$.
        - $C$: Sucessora $E (LS = 7) arrow.r LF = 7 arrow.r LS = 7 - 3 = 4$.
        - $B$: Sucessora $D (LS = 6) arrow.r LF = 6 arrow.r LS = 6 - 4 = 2$.
        - $A$: *Divergência na volta para $B$ e $C$!* Regra do mínimo: $LF_A = min(LS_B, LS_C) = min(2, 4) = bold(2) arrow.r LS_A = 2 - 2 = 0$.
      - *Folga Total ($FT = LS - ES = LF - EF$):*
        $FT_C = 4 - 2 = 7 - 5 = bold(2" dias")$ | $FT_E = 7 - 5 = 11 - 9 = bold(2" dias")$. Todas as demais têm $FT = bold(0)$ (críticas).
    ]
  ]
)

#v(2pt)
#text(8.5pt)[
  *Critérios de Correção (Barema - 3,5 pts):* \
  • *2,0 pontos:* Preenchimento exato de todas as colunas da tabela de cronograma (descontar 0,25 por linha com erros conceituais). \
  • *0,5 ponto:* Resposta 3.1 ($16$ dias). \
  • *1,0 ponto:* Resposta 3.2 identificando ambos os caminhos críticos ou reconhecendo que tanto F quanto G são atividades críticas concorrentes.
]

#pagebreak()

// ==========================================
// PÁGINA 4: QUESTÃO 4 (CENÁRIOS) E BAREMA
// ==========================================

=== Questão 4 · Análise de Cenários e Tomada de Decisão (Valor: 3,0 pontos)

==== 4.1 Cenário de Atraso no Fornecedor da Atividade C (1,5 pontos)
*Situação:* O fornecedor das células solares avisa que a entrega da Atividade C atrasará 2 dias ($d_C$ passa de 3 para 5 dias).

*a) A data final de entrega do projeto será atrasada?* \
#[#text(weight: "bold", size: 10pt, fill: ufc-rose)[[ &nbsp; ] Sim &nbsp;&nbsp;&nbsp;&nbsp; [ X ] NÃO]]

*b) Justificativa Técnica com base em Folgas:*
#block(
  fill: rgb("#f0fdf4"),
  stroke: 1pt + rgb("#86efac"),
  inset: (x: 8pt, y: 6pt),
  radius: 5pt,
  width: 100%,
  [
    #text(8.5pt)[
      *Justificativa Completa:* \
      A Atividade C possui *Folga Total de 2 dias* ($FT_C = 2$). O atraso informado de 2 dias é *exatamente igual à folga disponível*, sendo integralmente absorvido sem atrasar a entrega final:
      - Com $d_C = 5$ dias, o novo término de C passa a ser $EF_C = 2 + 5 = 7$ dias.
      - A Atividade E inicia no dia 7 e termina no dia $7 + 4 = 11$ dias ($EF_E = 11$).
      - A Atividade G aguarda D e E: $ES_G = max(EF_D, EF_E) = max(11, 11) = 11$ dias.
      - Como a fabricação do chassi (Atividade D) já concluía no dia 11 ($EF_D = 11$), o início de G não sofre nenhum atraso, mantendo a conclusão final em *16 dias*.
      - *Consequência:* A folga foi zerada ($FT_C' = 0$), tornando o caminho $A -> C -> E -> G -> H$ um *terceiro caminho crítico*, eliminando qualquer margem operacional adicional.
    ]
  ]
)

#v(1pt)
#text(8pt)[*Critério 4.1:* 0,5 pt (resposta "Não") + 1,0 pt (justificativa técnica detalhada sobre folga e início inalterado de G).]

#v(4pt)

==== 4.2 Cenário de Compressão de Prazo / Crashing na Atividade E (1,5 pontos)
*Situação:* A direção oferece verba para acelerar a Atividade E em 2 dias (reduzindo sua duração de 4 para 2 dias).

*a) Vale a pena aceitar esse investimento para entregar o protótipo mais cedo?* \
#[#text(weight: "bold", size: 10pt, fill: ufc-rose)[[ &nbsp; ] Sim &nbsp;&nbsp;&nbsp;&nbsp; [ X ] NÃO]]

*b) Justificativa Técnica e Estratégia Correta de Compressão:*
#block(
  fill: rgb("#fef2f2"),
  stroke: 1pt + rgb("#fca5a5"),
  inset: (x: 8pt, y: 6pt),
  radius: 5pt,
  width: 100%,
  [
    #text(8.5pt)[
      *Justificativa Completa:* \
      A Atividade E *não pertence ao caminho crítico* e já possui *Folga Total de 2 dias* ($FT_E = 2$). Reduzir sua duração para 2 dias antecipa seu término para o dia $5 + 2 = 7$, mas a Atividade G continua impedida de iniciar até o dia 11 pela Atividade D ($EF_D = 11$):
      $ ES_G = max(EF_D, EF_E) = max(11, 7) = bold(11" dias") $
      O projeto permanece concluindo em *16 dias*. O aporte financeiro seria um *desperdício*, gerando apenas folga ociosa inútil ($FT_E' = 4$ dias).

      *Onde investir para reduzir o projeto em 2 dias (de 16 para 14 dias):* \
      1. *Tronco Único Crítico (Mais Econômico):* Comprimir atividades comuns a ambos os caminhos críticos: *A, B, D ou H* (ex.: reduzir D de 5 para 3 dias).
      2. *Ramificações Concomitantes:* Se intervir nas tarefas paralelas, é obrigatório comprimir *simultaneamente* as atividades *F e G* em 2 dias cada (acelerar apenas uma delas deixará a outra como gargalo de 16 dias).
    ]
  ]
)

#v(1pt)
#text(8pt)[*Critério 4.2:* 0,5 pt ("Não") + 0,5 pt (justificativa de E não ser crítica) + 0,5 pt (indicação de A, B, D, H ou F+G).]

#v(6pt)

== 3. Tabela Barema Consolidada para Lançamento de Notas

#table(
  columns: (auto, 1fr, auto, auto),
  align: (center + horizon, left + horizon, center + horizon, center + horizon),
  inset: 4.5pt,
  fill: (col, row) => if row == 0 { rgb("#142c46") } else if calc.odd(row) { rgb("#f8fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e1"),
  [#text(white, weight: "bold")[Item]],
  [#text(white, weight: "bold")[Critério Avaliado]],
  [#text(white, weight: "bold")[Pontos]],
  [#text(white, weight: "bold")[Subtotal]],
  
  [*Q1*], [Fórmula PERT, substituição dos valores ($1+12+5$) e resultado $t_e = 3$ dias], [1,5 pt], [1,5 pt],
  [*Q2.1*], [Diagrama AON desenhado com caixas, dependências e convergências corretas], [1,0 pt], [],
  [*Q2.2*], [Listagem dos 3 caminhos (16, 16, 14 dias) e interpretação do caminho mais longo], [1,0 pt], [2,0 pts],
  [*Q3.1*], [Quadro de cronograma com ES, EF, LS, LF e Folga Total calculados], [2,0 pts], [],
  [*Q3.2*], [Indicação do prazo mínimo de 16 dias e dos dois caminhos críticos concomitantes], [1,5 pt], [3,5 pts],
  [*Q4.1*], [Cenário de Atraso C: Resposta "Não" (0,5 pt) e justificativa pela folga de 2 dias (1,0 pt)], [1,5 pt], [],
  [*Q4.2*], [Cenário Crashing E: Resposta "Não" (0,5 pt), justificativa da folga (0,5 pt) e indicação de A, B, D, H ou F+G (0,5 pt)], [1,5 pt], [3,0 pts],
  
  table.cell(colspan: 3, align: right)[*PONTUAÇÃO MÁXIMA TOTAL DA ATIVIDADE:*],
  [#text(weight: "bold", fill: ufc-primary)[10,0 pts]]
)

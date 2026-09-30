# Homework 1: Estatística Descritiva

## Descrição
Trabalho de análise estatística descritiva de um subconjunto de 300 observações de um dataset. Conta com a classificação das variáveis do conjunto de dados, cálculo de medidas de tendência central e de dispersão, boxplots e interpretações. Investiga ainda a relação entre uso do sistema e estação do ano, condição meteorológica e temperatura através de gráficos (histogramas, boxplots, scatterplots) e do coeficiente de correlação.

## Estrutura

```text
homework-01/
├── codigo/
│   ├── HW1_bike_sharing.csv    # Conjunto de dados utilizado
│   ├── main.r                  # Código principal da análise
│   └── Rplots.pdf              # Gráficos gerados pelo R
│
├── relatorio/
│   ├── imagens/                # Imagens e gráficos utilizados no relatório
│   ├── main.tex                # Código-fonte do relatório LaTeX
│   └── main.pdf                # Relatório final renderizado
│
└── README.md                   # Documentação do projeto
```

## Divisão e Colaboração
O trabalho foi dividido em quatro tarefas para cada um dos integrantes e, como cada etapa era dependente da anterior, debatido em grupo para obter maior coerência entre as seções. A divisão foi:
1. Danny Secundino: Implemetações em R e primeira questão
1. Saulo Gomes: Resolução da segunda questão
1. Alexandre Grangeiro: Resolução da terceira questão
1. Bruno Lage: Resolução da quarta questão (interpretação)

De modo que todos redigiram o relatório. Quanto às discussões, chegamos a conclusões sobre a estrutura do relatório (divisão da questão em pontos), organização do cálculo manual (fórmulas, tabelas) e discrepância entre os métodos usados para cálculo do quartil (na questão 2, manual contra a função do R). Além disso, foram discutidas a escolha da variável usada a certa altura, a interpretação dos enunciados, a definição da variável low_usage e quais variáveis mais influenciavam no total_user a partir dos dados obtidos. 


## Conjunto de Dados Analisados pelo Grupo
Para definir o conjunto de dados a ser analisado, escolhemos o maior número de matrícula dentre os números de matrícula dos membros do grupo ($M = 579763$) e, então, realizamos a seguinte operação para escolher qual seria a primeira observação do nosso conjunto de dados:

$r = 1 + (M \ mod \ 100) = 1 + (579763 \ mod\ 100) = 1 + 63 = 64$.

Além disso, como tínhamos que ter um conjunto com 300 observações, tomamos, como último dado no nosso conjunto de dados o valor $300 + r - 1 = 300 + 64 - 1 = 363$

Assim, nosso escopo para este trabalho está definido da observação **64** à observação **363**.

O código R usado para definir esse conjunto está sendo mostrado abaixo:

```R
# students numbers
alexandre_sn <- 578345
bruno_sn <- 578342
danny_sn <- 579763
saulo_sn <- 579493

# highest student number
M <- max(c(alexandre_sn, bruno_sn, danny_sn, saulo_sn)) # 579763

# Defining the start and the end of group's dataset
# start
r <- 1 + (M %% 100)     # 64

# end
end <- 300 + r - 1      # 363

# Defining data_group (ie., the group's dataset)
# loading the entire file
all_data <- read.csv("HW1_bike_sharing.csv")

# defining our scope
data_group <- all_data[r:end, ]
```
Esse bloco de código consta no código completo, a saber, `codigo/main.r`.

## Como Rodar o Código
O código foi pensado para ter a sua saída apresentada em uma interface no terminal, então é de extrema importância que o código seja executado. Para isso, **com o R devidamente instalado** na sua máquina, navegue até a pasta `codigo/` e, no terminal digite:
```bash
Rscript main.r
```

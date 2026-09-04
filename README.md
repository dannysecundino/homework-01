# Homework 1: Estatística Descritiva
[texto introdutório né]

---

## Conjunto de Dados Analisados pelo Grupo
[fazer o ngc lá do mod né]

```R
# [codigo em R aqui]
```

TODO: terminar esse readme

---
para orientação de vcs, colegas de trabalho:
Antes de mais nada, clone esse repositório para a sua máquina:
```bash
git clone https://github.com/dannysecundino/homework-01.git
```

1. uma linha horizontal como a que está acima se faz com 3 hífens
2. para fazer um bloco de código R (nem sei se vai precisar aqui, acho que não):

```R
# [codigo em R aqui]
```
3. para fazer uma enumeração é desse jeito que eu tô faazendo
4. aqui em um .md, a gnt segue um padrão de titulos, o titulo principal tem uma #, os títulos de conteúdos têm ## e subtítulos desses títulos têm ###.
5. vc pode fazer uma lista não ordenada:
- tipo
- assim
- tá vendo
6. agora falando do trabalho: vejam o .md de pasta `relatorio` (inclusive é legal escrever assim entre duas crases quando couber, para ficar organizado). vamos usar latex pelo vs code
[vc altera o .tex e dps transforma em pdf; já fiz a base dele lá]
7. o código-fonte fica na pasta `codigo`
8. no fim de tudo, vamos deixar só o relatorio e o .tex na pasta de relatorio e so o codigofonte na pasta de código
9. acabei de lembrar: vou colocar o banco de dados aqui tbm, vamos vendo a melhor forma de guardar. acho que cabe ser na pasta codigo (é o HW1_bike_sharing.csv).
10. para subir as suas mudanças:
nós vammos dividir bem nossas tarefas, para não ter muita sobreposição de mudanças em arquivos, mas sabemos que elas iraão acontecer. por isso, fiz branches com diferentes funções
- `relatorio`: quando vc fizer alterações na pasta do relatório, suba para essa branch
- `codigo`: quando vc fizer alterações na pasta do codigo, suba para essa branch
- `readme`: quando vc fizer alterções no readme, suba para essa branch

como subir alterações? 
i. primeiro, faça o padrão para subir no git né
```bash
git add .
git commit -m "sua mensagem de commit aqui"
```
(coloque mensagens de commit boas, que espresse de fato o que vc fez)

ii. depois, suba para a branch correspondente (discutido logo acima)
```bash
git push -u origin <nome_da_branch>
```
não suba para a main pfvr

iii. por fim no site do github, aberto no nosso repositório, faça
- vá até
pull request > new pull request > [base: main; comapare: <nome da branch para a qual vc subiu as suas alterações>] > create pull request

11. vai dar bom

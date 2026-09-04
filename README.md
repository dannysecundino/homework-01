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
8. no fim de tudo, vamos deixar só o relatorio e o .tex na pasta de relatorio e so o codigofonte na pasta de código (com os dados que couberem estar lá)
9. acabei de lembrar: vou colocar o banco de dados aqui tbm, vamos vendo a melhor forma de guardar. acho que cabe ser na pasta codigo (é o HW1_bike_sharing.csv).
10. Para subir as suas mudanças:

Nós vamos dividir bem nossas tarefas, para não ter muita sobreposição de mudanças em arquivos, mas sabemos que elas irão acontecer. Por isso, fiz branches com diferentes funções (elas existem no mundo das ideias de platão, vcs precisam criar na primeira vez pelo visto):
- `relatorio`: quando você fizer alterações na pasta do relatório, suba para essa branch
- `codigo`: quando você fizer alterações na pasta do código, suba para essa branch
- `readme`: quando você fizer alterações no README, suba para essa branch

Como subir alterações?

i. Antes de mexer em qualquer arquivo, entre na branch correspondente: (por favor mesmo)
```bash
git checkout <nome_da_branch>
```
Se a branch ainda não existir localmente, crie e entre nela com:
```bash
git checkout -b <nome_da_branch>
```

Logo depois, antes de começar a trabalhar, dê um `git pull` na `main` para começar atualizado. ou seja, faça
```bash
git pull origin main
```

ii. Faça suas alterações e depois suba para o stage e commite:
```bash
git add .
git commit -m "sua mensagem de commit aqui"
```
(coloque mensagens de commit boas, que expressem de fato o que você fez)

iii. Suba para a branch correspondente:
```bash
git push -u origin <nome_da_branch>
```
Não suba para a main, por favor.

iv. Por fim, no site do GitHub, aberto no nosso repositório, faça:
- Vá até Pull requests > New pull request > [base: main; compare: <nome da branch para a qual você subiu as suas alterações>] > Create pull request (coloque informações pertinnentes lá e tal)

**Só dar merge quando vc estiver com tempo para ver se as suas alterações não afetam nada do resto do código (.tex ou .r (e até o .md tbm))**

11. vai dar bom, pessoal

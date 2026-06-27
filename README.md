# Smart-Fit-DB

## Trabalho:Projeto de Bancos de Dados I  
## Orientador:Gustavo Henrique Lima Pinto 
## Equipe:Vinicius da Silva e Silva e João de Deus da Conceição Neto
## Curso:Sistemas de Informação
## Instituição:Universidade Federal do Pará

# Sistema Escolhido

## Nome do Sistema:Smart-Fit-DB

## Descrição do Sistema:O Smart-Fit-DB é um banco de dados relacional desenvolvido para PostgreSQL a fim de simular um schema semelhante ao da rede de academias Smart Fit.Nele,cada usuário pode se cadastrar como um cliente ou um instrutor,realizando tarefas diferentes.Todo cliente precisa realizar uma matrícula e assinar um plano de serviço,o qual oferece três opções:Smart,Fit e Black.Além disso,todo cliente precisa participar de uma turma,a qual é determinada pelos exercícios que precisa fazer.Todo instrutor é responsável por uma turma de acordo com a sua especialidade e cada turma precisa seguir um plano de exercícios.Um plano de exercícios é determinado por um instrutor e está associado a uma única turma.Além disso,os planos de exercícios possuem uma determinada duração e estão associados com uma modalidade.

## Objetivo do Sistema:O objetivo do Smart-Fit-DB é de ser apenas um exercício acadêmico de modelagem.Não há nenhuma intenção comercial e todas as semelhanças são apenas para seguir o propósito de simular o modelo de dados da forma mais fiél possível,sem violar os direitos autorais da Smart Fit. 

# A Modelagem

## Uma Breve Descrição:Os DERs foram desenvolvidos utilizando a ferramenta BR Modelo Web.Cada versão representa um estágio do sistema,o qual é evoluído de forma incremental.

## Entidades

### Academia:Representa uma unidade (franqueado) composta por informações de cadastro,contato e endereço.
### Equipamento:Representa uma entidade forte e independente.
### Usuario:Representa uma entidade composta por informações de cadastro.Ele é uma abstração para `Cliente` e `Instrutor`.
### Cliente:Representa uma especialização de `Usuario` composta por informações de cadastro.
### Instrutor:Representa uma especialização de `Usuario` composta por informações de cadastro.
### Turma:Representa uma entidade fraca dependente de `Instrutor`.
### Plano_Exercicios:Representa uma entidade fraca dependente de `Turma` e `Instrutor`.
### Matricula:Representa uma entidade fraca dependente de `Cliente`.
### Plano_Assinatura:Representa uma entidade forte independente dentro do sistema.
### Pagamento:Representa uma entidade fraca dependente de `Matricula`,`Plano_Assinatura` e `Cliente`.Ele sempre é gerado pleno `Plano_Assinatura`.

## Decisões de Modelagem

### Usuário:A entidade foi definida para ser "Usuário" uma especialização por disjunção parcial.Escolheu-se tal abordagem devido a modelagem:não há um relacionamento entre a entidade fraca "Matricula" e a entidade forte "Instrutor" e por isso não escolheu-se a sobreposição parcial (já que seria necessário também relacionar tais entidades).Além disso,há uma possibilidade de um usuário não ser nem "Cliente" e nem "Instrutor".

### Academia:A Smart-Fit-DB representa um sistema capaz de gerenciar múltiplas unidades (franqueados).Cada unidade precisa ter atributos referentes ao registro(CNPJ),endereço e formas de contato.

### Pagamento:A Smart-Fit-DB é um sistema que simula transações financeiras.Devido a todo cliente se matricular e assinar um plano,é necessário que haja uma entidade que represente essas transações:cada matrícula e assinatura são mensais e precisam ser representadas como faturas.

# Migrações

### Primeira Migração

#### Código

```
ALTER TABLE Usuario ADD COLUMN Email_Usuario VARCHAR(100) UNIQUE NOT NULL;

ALTER TABLE Cliente ADD COLUMN Turma_ID INT REFERENCES Turma(ID_Turma) ON DELETE RESTRICT;

ALTER TABLE Pagamento ADD COLUMN Matricula_ID INT REFERENCES Matricula(ID_Matricula) ON DELETE CASCADE;

```

#### Explicação:Percebeu-se a necessidade de adicionar colunas às tabelas `Usuario`,`Cliente` e `Pagamento` para atender à segunda modelagem.




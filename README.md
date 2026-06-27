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

## Relacionamentos

### Academia -> Equipamento : 1:N

### Academia -> Usuario : 1:N

### Usuario -> Cliente : 1:1

### Usuario -> Instrutor : 1:1

### Cliente -> Turma : 1:N

### Instrutor -> Turma: 1:N

### Instrutor -> Plano_Exercicios : 1:N

### Turma -> Plano_Exercicios : 1:N

### Cliente -> Matricula : 1:1

### Matricula -> Plano_Assinatura : 1:N

### Matricula -> Pagamento : 1:1

## Decisões de Modelagem

### Usuário:A entidade foi definida para ser "Usuário" uma especialização por disjunção parcial.Escolheu-se tal abordagem devido a modelagem:não há um relacionamento entre a entidade fraca "Matricula" e a entidade forte "Instrutor" e por isso não escolheu-se a sobreposição parcial (já que seria necessário também relacionar tais entidades).Além disso,há uma possibilidade de um usuário não ser nem "Cliente" e nem "Instrutor".

### Academia:A Smart-Fit-DB representa um sistema capaz de gerenciar múltiplas unidades (franqueados).Cada unidade precisa ter atributos referentes ao registro(CNPJ),endereço e formas de contato.

### Pagamento:A Smart-Fit-DB é um sistema que simula transações financeiras.Devido a todo cliente se matricular e assinar um plano,é necessário que haja uma entidade que represente essas transações:cada matrícula e assinatura são mensais e precisam ser representadas como faturas.

# Migrações

### Primeira Migração

``` SQL
ALTER TABLE Usuario ADD COLUMN Email_Usuario VARCHAR(100) UNIQUE NOT NULL;

ALTER TABLE Cliente ADD COLUMN Turma_ID INT REFERENCES Turma(ID_Turma) ON DELETE RESTRICT;

ALTER TABLE Pagamento ADD COLUMN Matricula_ID INT REFERENCES Matricula(ID_Matricula) ON DELETE CASCADE;

```

#### Percebeu-se a necessidade de adicionar colunas às tabelas `Usuario`,`Cliente` e `Pagamento` para atender à segunda modelagem.

### Segunda Migração

``` SQL
CREATE TABLE Plano_Exercicios (
  ID_Plano SERIAL PRIMARY KEY,
  Tipo_Exercicio VARCHAR(200) NOT NULL,
  Quantidade_Exercicios INT NOT NULL,
  Periodo_Exercicios VARCHAR(20) NOT NULL,
  Turma_ID INT REFERENCES Turma(ID_Turma) ON DELETE CASCADE,
  Instrutor_ID VARCHAR(6) REFERENCES Instrutor(CREF) ON DELETE CASCADE
);
```

#### Ela atende à necessidade da segunda modelagem,pois a primeira não apresentava o atributo `ID_Plano`.

### Terceira Migração

``` SQL
ALTER TABLE TURMA ADD CONSTRAINT Check_Turma_Turno CHECK(Turno IN ('Manhã','Tarde','Noite'));

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Nome_Plano CHECK(Nome_Plano IN ('Smart','Fit','Black'));

ALTER TABLE Pagamento ADD CONSTRAINT Check_Forma_Pagamento CHECK(Forma_Pagamento IN ('Dinheiro','Pix','Crédito','Débito'));

ALTER TABLE Instrutor ADD CONSTRAINT Check_Especialidade_Instrutor CHECK (Especialidade IN (
'Yoga','Pilates','Spinning','Zumba',
'Musculação','Hipertrofia','Emagrecimento','Fortalecimento','Condicionamento','Alongamento e Flexibilidade',
'Karatê','Jiu-jitsu','Capoeira','Kung Fu','Taekwondo'));

```

#### Inferiu-se a necessidade de adicionar informações que aumentassem a fidelidade do Smart-Fit-DB em relação à Smart Fit.

### Quarta Migração

``` SQL
ALTER TABLE Plano_Exercicios RENAME COLUMN Tipo_Exercicio TO Modalidade_Exercicio;

ALTER TABLE Plano_Exercicios RENAME COLUMN Periodo_Exercicio TO Duracao_Exercicio;

ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Modalidade_Exercicio CHECK (Modalidade_Exercicio IN (
 'FITDANCE','ZUMBA','BODY COMBAT','BODY BALANCE','SMART CORE',
 'ALONGAMENTO','SMART FIGHT','SMART BIKE'));

```

#### Refatorou-se as colunas `Tipo_Exercicio` e `Periodo_Exercicio` de `Plano_Exercicios`,para que elas fiquem mais fiéis em relação ao sistema da Smart Fit.

### Quinta Migração

``` SQL
ALTER TABLE Equipamento ADD CONSTRAINT Check_Preco_Equipamento CHECK (Valor_Equipamento > 0);

ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Quantidade_Exercicio CHECK (Quantidade_Exercicios > 0);

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Vencimento_Plano CHECK (Data_Vencimento > CURRENT_DATE);

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Valor_Plano CHECK (Valor_Plano > 0);

ALTER TABLE Pagamento ADD CONSTRAINT Check_Data_Pagamento CHECK (Data_Pagamento > CURRENT_DATE);

ALTER TABLE Pagamento ADD CONSTRAINT Check_Valor_Pagamento CHECK (Valor_Total > 0);

```

#### Acrescentou-se restrições a fim de evitar possíveis erros de inserções.

### Sexta Migração

``` SQL
ALTER TABLE Academia DROP COLUMN Endereco_Academia;

ALTER TABLE Academia ADD COLUMN Unidade_Federativa_Academia VARCHAR(2) NOT NULL;

ALTER TABLE Academia ADD COLUMN Cidade_Academia VARCHAR(50) NOT NULL;

ALTER TABLE Academia ADD COLUMN Bairro_Academia VARCHAR(50) NOT NULL;

ALTER TABLE Academia ADD COLUMN Rua_Academia VARCHAR(50) NOT NULL;

```

#### Eliminou-se o atributo composto `Endereco_Academia` a fim de normalizar a tabela `Academia`

### Sétima Migração

``` SQL
ALTER TABLE Cliente ADD CONSTRAINT Unique_Telefone_Cliente UNIQUE (Telefone_Contato);

ALTER TABLE Instrutor ADD CONSTRAINT Unique_Telefone_Instrutor UNIQUE(Telefone_Contato);
```

#### Refatorou-se o campo `Telefone_Contato` de `Cliente` e `Instrutor` para evitar inserções repetidas.


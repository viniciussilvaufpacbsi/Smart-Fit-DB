# Smart-Fit-DB

## Trabalho:Projeto de Bancos de Dados I  
## Orientador:Gustavo Henrique Lima Pinto 
## Equipe:Vinicius da Silva e Silva < 202411140038 > e João de Deus da Conceição Neto < 202204940037 >
## Curso:Sistemas de Informação
## Instituição:Universidade Federal do Pará

# Sistema Escolhido

## Nome do Sistema:Smart-Fit-DB

## Descrição do Sistema:

### O Smart-Fit-DB é um banco de dados relacional desenvolvido para PostgreSQL a fim de simular um schema semelhante ao da rede de academias Smart Fit.Nele,temos um conjunto de academias,onde cada uma representa um franqueado.Toda academia possuí usuários e equipamentos.Cada usuário pode se cadastrar como cliente ou instrutor.Um cliente precisa realizar uma matrícula e pode assinar um plano que oferece três opções:Smart,Fit e Black.Além disso,um cliente pode participar de uma turma,a qual está de acordo com uma modalidade de exercícios.Cada instrutor é responsável por uma turma devido a sua especialidade e cada turma precisa seguir um plano de exercícios.Todo plano de exercícios é determinado por um instrutor e está associado a uma turma.Cada plano de exercícios corresponde a uma modalidade e possuí uma quantidade de exercícios e uma duração.Além disso,todo plano de exercícios faz uso de um equipamento.Todo equipamento pertence a uma academia.

## Objetivo do Sistema:

### O objetivo do Smart-Fit-DB é de ser apenas um exercício acadêmico.Não há intenções comerciais e todas as semelhanças são apenas para seguir o propósito de simular um modelo de dados da forma mais fiél possível,sem violar os direitos autorais da Smart Fit.

# Sobre A Modelagem

## Uma Breve Descrição:

### Cada DER foi desenvolvido por meio da ferramenta BR Modelo Web.

### Cada versão representa um estágio do sistema,o qual é evoluído de forma incremental.

### Todas as evoluções foram feitas para tornar o sistema mais fiél e otimizado possível.

### Cada diagrama e sua explicação se encontra no diretório `Modelagens`.

## Entidades

### Academia:Entidade forte que representa uma franqueado composto de atributos como `CNPJ,Nome_Academia,Cidade_Academia,Bairro_Academia` e `Rua_Academia`.

### Equipamento:Entidade forte que pertence a uma academia.Ele é composto por atributos como `Nome_Equipamento,Tipo_Equipamento,Condicao_Equipamento,Valor_Equipamento` e `Academia_ID`.

### Usuario:Entidade fraca dependente de `Academia` composta de atributos como `Nome_Usuario,Senha_Usuario,Data_Cadastro` e `Academia_ID`.Ele é uma abstração para `Cliente` e `Instrutor`.

### Cliente:Especialização de `Usuario` composta de atributos como `CPF_Cliente`,`Telefone_Contato` e `Usuario_ID`.

### Instrutor:Especialização de `Usuario` composta de atributos como `CREF,Telefone_Contato` e `Especialidade`.

### Turma:Entidade fraca dependente de `Cliente` e `Instrutor`.Ela é composta de atributos como `ID_Turma,Nome_Turma,Turno_Turma` e `Instrutor_ID` 

### Plano_Exercicios:Entidade fraca dependente de `Turma` e `Instrutor`.Ele é composto de atributos como `Modalidade_Exercicio,Duracao_Exercicio,Quantidade_Exercicios` e `Equipamento_ID`.

### Matricula:Entidade fraca dependente de `Cliente`.Ela é composta de atributos como `ID_Matricula,Cliente_ID` e `Data_Matricula`.

### Plano_Assinatura:Entidade fraca dependente de `Cliente`.Ele é composto de atributos como `ID_Plano,Nome_Plano,Valor_Plano` e `Cliente_ID`.

### Fatura_Mensal:Entidade fraca dependente de `Plano_Assinatura` e `Cliente`.Ela é composta de atributos como `ID_Fatura,Valor_Fatura,Data_Fechamento,Data_Vencimento,Cliente_ID` e `Plano_ID`.Ela é gerada por um `Plano_Assinatura`.

## Relacionamentos

### Academia -> Equipamento `1:N`

### Academia -> Usuario `1:N`

### Cliente -> Turma `N:N`

### Instrutor -> Turma `1:N`

### Instrutor -> Plano_Exercicios `1:N`

### Turma -> Plano_Exercicios `1:N`

### Plano_Exercicios -> Equipamento `1:N`

### Cliente -> Matricula `1:1`

### Cliente -> Plano_Assinatura `1:N`

### Plano_Assinatura -> Fatura_Mensal `1:1`

## Decisões de Modelagem

### Usuário:A entidade foi definida para ser uma especialização por disjunção parcial.Escolheu-se tal abordagem devido ao escopo simples do projeto.Além disso,há a possibilidade de um usuário não ser nem `Cliente` e nem `Instrutor`.

### Academia:O Smart-Fit-DB representa um sistema capaz de gerenciar múltiplas unidades,cada uma com seus próprios atributos.

### Equipamento:O Smart-Fit-DB permite armazenar dados referentes aos equipamentos utilizados por cada academia.Todo equipamento só pertence a uma única academia devido à `FK`.Além disso,cada equipamento registrado pode ser usado em um determinado plano de exercícios.

### Fatura_Mensal:O Smart-Fit-DB é um sistema que simula transações financeiras.Devido aos clientes assinarem planos de assinatura,é necessário que haja uma entidade que represente essas transações,pois as assinaturas são mensais e precisam estar representadas como faturas.

### Turma:No Smart-Fit-DB cada turma só pode ter um único instrutor devido a especialidade do mesmo e também devido a modalidade de exercícios a qual ela irá seguir.

### Plano_Assinatura:No Smart-Fit-DB cada plano de assinatura é único para cada cliente.

# Migrações

### Schema Inicial

``` SQL

CREATE TABLE Academia (
   CNPJ VARCHAR(14) PRIMARY KEY,
   Nome_Academia VARCHAR(100) NOT NULL,
   Endereco_Academia VARCHAR(200) NOT NULL,
   Telefone_Contato VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE Usuario (
  ID_Usuario SERIAL PRIMARY KEY,
  Nome_Usuario VARCHAR(100) UNIQUE NOT NULL,
  Senha_Usuario VARCHAR(60) NOT NULL,
  Data_Cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Cliente (
 CPF_Cliente VARCHAR(11) PRIMARY KEY,
 Nome_Cliente VARCHAR(100) NOT NULL,
 Telefone_Contato VARCHAR(11) NOT NULL,
 Usuario_ID INT REFERENCES Usuario(ID_Usuario) ON DELETE CASCADE
);

CREATE TABLE Instrutor (
  CREF VARCHAR(6) PRIMARY KEY,
  Nome_Instrutor VARCHAR(100) NOT NULL,
  Telefone_Contato VARCHAR(11) NOT NULL,
  Especialidade VARCHAR(30) NOT NULL,
  Usuario_ID INT REFERENCES Usuario(ID_Usuario) ON DELETE CASCADE
);

CREATE TABLE Matricula (
  ID_Matricula SERIAL PRIMARY KEY,
  Data_Matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Cliente_ID VARCHAR(11) REFERENCES Cliente(CPF_Cliente) ON DELETE CASCADE
);

CREATE TABLE Turma (
  ID_Turma SERIAL PRIMARY KEY,
  Nome_Turma VARCHAR(75) NOT NULL,
  Turno VARCHAR(30) NOT NULL,
  Instrutor_ID VARCHAR(6) REFERENCES Instrutor(CREF) ON DELETE CASCADE
);

CREATE TABLE Plano_Assinatura (
  ID_Plano SERIAL PRIMARY KEY,
  Nome_Plano VARCHAR(30) NOT NULL,
  Valor_Plano NUMERIC(5,2) NOT NULL,
  Data_Vencimento DATE NOT NULL
);

CREATE TABLE Pagamento (
  ID_Pagamento SERIAL PRIMARY KEY,
  Data_Pagamento DATE NOT NULL,
  Forma_Pagamento VARCHAR(30) NOT NULL,
  Valor_Total NUMERIC(6,2) NOT NULL,
  Cliente_ID VARCHAR(11) REFERENCES Cliente(CPF_Cliente) ON DELETE CASCADE,
  Plano_ID INT REFERENCES Plano_Assinatura(ID_Plano) ON DELETE CASCADE
);  

CREATE TABLE Equipamento (
  ID_Equipamento SERIAL PRIMARY KEY,
  Nome_Equipamento VARCHAR(100) NOT NULL,
  Tipo_Equipamento VARCHAR(40),
  Condicao_Equipamento VARCHAR(50) NOT NULL,
  Valor_Equipamento NUMERIC(8,2) NOT NULL
);

CREATE TABLE Plano_Exercicios (
  ID_Plano SERIAL PRIMARY KEY,
  Tipo_Exercicio VARCHAR(200) NOT NULL,
  Quantidade_Exercicios INT NOT NULL,
  Periodo_Exercicios VARCHAR(20) NOT NULL
);

```
 

#### Este schema corresponde à primeira modelagem.

### Primeira Migração

``` SQL
ALTER TABLE Usuario ADD COLUMN Email_Usuario VARCHAR(100) UNIQUE NOT NULL;

ALTER TABLE Cliente ADD COLUMN Turma_ID INT REFERENCES Turma(ID_Turma) ON DELETE RESTRICT;

ALTER TABLE Pagamento ADD COLUMN Matricula_ID INT REFERENCES Matricula(ID_Matricula) ON DELETE CASCADE;

ALTER TABLE Plano_Exercicios ADD COLUMN Instrutor_ID VARCHAR(6) REFERENCES Instrutor(CREF) ON DELETE CASCADE;

ALTER TABLE Plano_Exercicios ADD COLUMN Turma_ID INT REFERENCES Turma(ID_Turma) ON DELETE CASCADE;

```

#### Esta migração corresponde à segunda modelagem e acrescenta as colunas `Email_Usuario`,`Turma_ID`,`Matricula_ID`,`Instrutor_ID` e `Turma_ID` às tabelas `Usuario`,`Cliente`,`Pagamento` e `Plano_Exercicios`.

### Segunda Migração

``` SQL
ALTER TABLE Plano_Exercicios RENAME COLUMN Periodo_Exercicios TO Duracao_Exercicio;

ALTER TABLE Plano_Exercicios RENAME COLUMN Tipo_Exercicio TO Modalidade_Exercicio;

```

#### Esta migração corresponde à segunda modelagem e altera o nome das colunas da tabela `Plano_Exercicios` a fim de se manter mais fíel em relação a Smart Fit.

### Terceira Migração

``` SQL
ALTER TABLE Turma ADD CONSTRAINT Check_Turma_Turno CHECK(Turno IN ('Manhã','Tarde','Noite'));

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Nome_Plano CHECK(Nome_Plano IN ('Smart','Fit','Black'));

ALTER TABLE Pagamento ADD CONSTRAINT Check_Forma_Pagamento CHECK(Forma_Pagamento IN ('Dinheiro','Pix','Crédito','Débito'));

ALTER TABLE Instrutor ADD CONSTRAINT Check_Especialidade_Instrutor CHECK (Especialidade IN (
 'Yoga','Pilates','Spinning','Zumba',
 'Musculação','Hipertrofia','Emagrecimento','Fortalecimento','Condicionamento','Alongamento e Flexibilidade',
 'Karatê','Jiu-jitsu','Capoeira','Kung Fu','Taekwondo'));

```

#### Esta migração adiciona restrições nas tabelas `Turma,Plano_Assinatura,Pagamento` e `Instrutor` a fim de aumentar a fidelidade do Smart-Fit-DB em relação a Smart Fit.

### Quarta Migração

``` SQL
ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Modalidade_Exercicio CHECK (Modalidade_Exercicio IN (
 'FITDANCE','ZUMBA','BODY COMBAT','BODY BALANCE','SMART CORE',
 'ALONGAMENTO','SMART FIGHT','SMART BIKE'));

```

#### Esta migração acrescenta restrições à coluna `Modalidade_Exercicio` para torna-se mais fíel à Smart Fit.

### Quinta Migração

``` SQL
ALTER TABLE Equipamento ADD CONSTRAINT Check_Preco_Equipamento CHECK (Valor_Equipamento > 0);

ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Quantidade_Exercicio CHECK (Quantidade_Exercicios > 0);

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Vencimento_Plano CHECK (Data_Vencimento > CURRENT_DATE);

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Valor_Plano CHECK (Valor_Plano > 0);

ALTER TABLE Pagamento ADD CONSTRAINT Check_Data_Pagamento CHECK (Data_Pagamento > CURRENT_DATE);

ALTER TABLE Pagamento ADD CONSTRAINT Check_Valor_Pagamento CHECK (Valor_Total > 0);

```

#### Esta migração adiciona restrições a fim de evitar possíveis erros de inserções.

### Sexta Migração

``` SQL
ALTER TABLE Academia DROP COLUMN Endereco_Academia;

ALTER TABLE Academia ADD COLUMN Unidade_Federativa_Academia VARCHAR(2) NOT NULL;

ALTER TABLE Academia ADD COLUMN Cidade_Academia VARCHAR(50) NOT NULL;

ALTER TABLE Academia ADD COLUMN Bairro_Academia VARCHAR(50) NOT NULL;

ALTER TABLE Academia ADD COLUMN Rua_Academia VARCHAR(50) NOT NULL;

```

#### Esta migração corresponde à terceira modelagem e elimina o atributo composto `Endereco_Academia` a fim de normalizar a tabela `Academia`.

### Sétima Migração

``` SQL
ALTER TABLE Cliente ADD CONSTRAINT Unique_Telefone_Cliente UNIQUE (Telefone_Contato);

ALTER TABLE Instrutor ADD CONSTRAINT Unique_Telefone_Instrutor UNIQUE(Telefone_Contato);

```

#### Esta migração refatora o campo `Telefone_Contato` de `Cliente` e `Instrutor` para seguir a regra de negócios comum de que todo número de telefone precisa ser único.


### Oitava Migração

``` SQL
ALTER TABLE Equipamento ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE SET NULL ON UPDATE RESTRICT;

ALTER TABLE Cliente DROP COLUMN Turma_ID;

ALTER TABLE Turma RENAME COLUMN Turno TO Turno_Turma;

````

### Esta migração corresponde à quarta modelagem.

### Adiciona-se o atributo `Academia_ID` à tabela `Equipamento` a fim de seguir o relacionamento `1:N`. 

### Remove-se o atributo `Turma_ID` da tabela `Cliente` para seguir o relacionamento `N:N`. 

### Renomeia-se o atributo `Turno` da tabela `Turma` para `Turno_Turma.

### Nona Migração

``` SQL
ALTER TABLE Usuario ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Plano_Assinatura ADD COLUMN Matricula_ID INT REFERENCES Matricula (ID_Matricula) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Pagamento RENAME TO Fatura_Mensal;

ALTER TABLE Fatura_Mensal RENAME COLUMN ID_Pagamento TO ID_Fatura;

ALTER TABLE Fatura_Mensal RENAME COLUMN Valor_Total TO Valor_Fatura;

ALTER TABLE Fatura_Mensal RENAME COLUMN Data_Pagamento TO Data_Vencimento;

ALTER TABLE Fatura_Mensal RENAME CONSTRAINT Check_Data_Pagamento TO Check_Data_Vencimento;

ALTER TABLE Fatura_Mensal ADD COLUMN Data_Fechamento DATE NOT NULL;

```

### Esta migração corresponde à quinta modelagem.

### Ela adiciona o atributo `Academia_ID` à tabela `Usuario` a fim de seguir o relacionamento 1:N e o atributo `Matricula_ID` à tabela `Plano_Assinatura` a fim de seguir com o relacionamento 1:N e tornar cada plano único pra cada usuário.

### Além disso,ele renomeia a tabela `Pagamento` para `Fatura_Mensal` e refatora as suas colunas e restrições para que correspondam às regras de negócios de uma tabela de fatura.

### Décima Migração

``` SQL

CREATE TABLE Cliente_Turma (							         
  Cliente_ID VARCHAR(11) REFERENCES Cliente (CPF_Cliente),
  Turma_ID INT REFERENCES Turma (ID_Turma),
  PRIMARY KEY(Cliente_ID,Turma_ID)
);

```

### Esta migração corresponde à quinta modelagem.

### Ela cria uma tabela `Cliente_Turma` para armazenar informações relacionais de uma forma muito mais eficaz em comparação às FKs.

### Décima Primeira Migração

``` SQL
ALTER TABLE Fatura_Mensal DROP COLUMN Matricula_ID;

ALTER TABLE Plano_Assinatura DROP COLUMN Matricula_ID;

ALTER TABLE Academia DROP COLUMN Unidade_Federativa_Academia;

```

### Esta migração corresponde à sexta modelagem.

### Remove-se `Matricula_ID` pois `Fatura_Mensal` é gerada por `Plano_Assinatura`.

### Remove-se `Unidade_Federativa_Academia` devido ao escopo do projeto ter sido reduzido.

### Décima Segunda Migração

``` SQL

ALTER TABLE Plano_Exercicios ADD COLUMN Equipamento_ID INT REFERENCES Equipamento (ID_Equipamento) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE Plano_Assinatura ADD COLUMN Cliente_ID VARCHAR(11) REFERENCES Cliente (CPF_Cliente) ON DELETE CASCADE ON UPDATE RESTRICT;

```

### Esta migração corresponde à sexta modelagem.

### Adiciona-se `Equipamento_ID` pois percebeu-se que um plano de exercícios precisa de um equipamento.

### Adiciona-se `Cliente_ID` ao `Plano_Assinatura` pois ele depende de um cliente e não de uma matrícula.

### Décima Terceira Migração

``` SQL
ALTER TABLE Plano_Assinatura ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Matricula ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Plano_Exercicios ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE;
```

### Esta migração corresponde à sétima modelagem

### Adiciona-se `Academia_ID` a `Plano_Assinatura` para sermos capazes de analisar os planos que cada uma oferece.

### Adiciona-se `Academia_ID` a `Matricula` para sermos capazes de analisar matrículas de uma determinada academia.

### Adiciona-se `Academia_ID` a `Plano_Exercicios` para sermos capazes de analisar as modalidades que cada uma oferece.

# Método de Rodar o Projeto

## 1.Vá em [DB Fiddle](https://www.db-fiddle.com/)   

## 2.Selecione a versão mais recente do `PostgreSQL`

## 3.Retorne ao repositório `Smart-Fit-DB`

## 4.Vá em `Projeto Completo`

## 5.Copie o código do arquivo `smart-fit_complete-schema.sql`

## 6.Copie o código do arquivo `smart-fit_complete-data.sql`

## 7.Insira-os no espaço **Schema SQL** do `DB Fiddle`

## 8.Retorne novamente ao repositório `Smart-Fit-DB`

## 9.Vá em `Consultas`

## 10.Copie o código do arquivo `smart-fit_queries.sql`

## 11.Retorne ao `DB Fiddle`

## 12.Insira-o no espaço **Query SQL** do `DB Fiddle`

## 13.Aperte `Run`


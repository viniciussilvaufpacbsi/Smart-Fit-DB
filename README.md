# Smart-Fit-DB

## Trabalho:Projeto de Bancos de Dados I  
## Orientador:Gustavo Henrique Lima Pinto 
## Equipe:Vinicius da Silva e Silva e João de Deus da Conceição Neto
## Curso:Sistemas de Informação
## Instituição:Universidade Federal do Pará

# Sistema Escolhido

## Nome do Sistema:Smart-Fit-DB

## Descrição do Sistema:O Smart-Fit-DB é um banco de dados relacional desenvolvido para PostgreSQL a fim de simular um schema semelhante ao da rede de academias Smart Fit.Nele,cada usuário pode se cadastrar como um cliente ou um instrutor,desempenhando papéis diferentes.Todo cliente precisa realizar uma matrícula e assinar um plano que oferece três opções:Smart,Fit e Black.Além disso,os clientes precisam participar de uma turma,a qual é determinada de acordo com os exercícios que eles precisam fazer.Todo instrutor é responsável por uma turma de acordo com a sua especialidade e cada turma precisa seguir um plano de exercícios.Cada plano de exercícios é determinado por um instrutor e está associado a uma única turma.Além disso,os planos de exercícios possuem uma determinada duração e estão associados a uma modalidade.

## Objetivo do Sistema:O objetivo do Smart-Fit-DB é de ser apenas um exercício acadêmico.Não há nenhuma intenção comercial e todas as semelhanças são apenas para seguir o propósito de simular o modelo de dados da forma mais fiél possível,sem violar os direitos autorais da Smart Fit. 

# A Modelagem

## Uma Breve Descrição:Os DERs foram desenvolvidos utilizando a ferramenta BR Modelo Web.Cada versão representa um estágio do sistema,o qual é evoluído de forma incremental.

## Entidades

### Academia:Representa uma unidade (franqueado) composta por informações de cadastro,contato e endereço.
### Equipamento:Representa uma entidade forte que pertence a uma única unidade.Ele é composto por informações comerciais,como `Nome_Equipamento,Tipo_Equipamento,Condicao_Equipamento` e `Valor_Equipamento`.
### Usuario:Representa uma entidade fraca dependente de `Academia` composta por informações de cadastro.Ele é uma abstração para `Cliente` e `Instrutor`.
### Cliente:Representa uma especialização de `Usuario` composta por informações de cadastro exclusivas de um cliente,como `CPF_Cliente`.
### Instrutor:Representa uma especialização de `Usuario` composta por informações de cadastro exclusivas de um instrutor,como `CREF` e `Especialidade`.
### Turma:Representa uma entidade fraca dependente de `Cliente` e `Instrutor`.Ela é composta por informações simples como `ID_Turma,Nome_Turma,Turno_Turma` e `Instrutor_ID` 
### Plano_Exercicios:Representa uma entidade fraca dependente de `Turma` e `Instrutor`.Ele é composto por informações referentes a exercícios,como `Modalidade_Exercicio,Duracao_Exercicio` e `Quantidade_Exercicios`.
### Matricula:Representa uma entidade fraca dependente de `Cliente`.Ela é composta por informações do `Cliente`,como `Cliente_ID` e de si mesma,como `ID_Matricula` e `Data_Matricula`.
### Plano_Assinatura:Representa uma entidade fraca dependente de `Matricula`.Ele é composto por informações de si,como `ID_Plano,Nome_Plano` e `Valor_Plano`,além daquelas sobre o `Cliente`,como `Matricula_ID`.Todo `Plano_Assinatura` é "único" pra cada `Cliente` devido a sua `Matricula`.
### Fatura_Mensal:Representa uma entidade fraca dependente de `Matricula`,`Plano_Assinatura` e `Cliente`.Ela é composta por informações financeiras,como `ID_Fatura,Valor_Fatura,Data_Fechamento` e `Data_Vencimento`,além daquelas envolvendo o `Cliente`.Toda fatura é gerada pelo `Plano_Assinatura`.

## Relacionamentos

### Academia -> Equipamento 1:N

### Academia -> Usuario 1:N

### Cliente -> Turma N:N

### Instrutor -> Turma 1:N

### Instrutor -> Plano_Exercicios 1:N

### Turma -> Plano_Exercicios 1:N

### Cliente -> Matricula 1:1

### Matricula -> Plano_Assinatura 1:N

### Matricula -> Fatura_Mensal 1:1

## Decisões de Modelagem

### Usuário:A entidade foi definida para ser uma especialização por disjunção parcial.Escolheu-se tal abordagem para corresponder às modelagens:não há um relacionamento entre `Matricula` e `Instrutor` e por isso a sobreposição parcial não foi escolhida.Além disso,há uma possibilidade de um usuário não ser nem `Cliente` e nem `Instrutor`.

### Academia:O Smart-Fit-DB representa um sistema capaz de gerenciar múltiplas unidades,cada uma com atributos referentes ao registro(CNPJ),endereço e formas de contato.

### Fatura_Mensal:O Smart-Fit-DB é um sistema que simula transações financeiras.Devido a todo cliente se matricular e assinar um plano,é necessário que haja uma entidade que represente essas transações:cada matrícula e assinatura são mensais e precisam ser representadas como faturas.

### Turma:No Smart-Fit-DB múltiplos clientes podem estar em múltiplas turmas,e cada turma só pode ter um único instrutor.Essa decisão foi feita pra organizar os dados de uma forma mais concisa,pois a entidade `Turma` no DER possuí um atributo identificador de um `Instrutor`,mas não de um cliente.

### Plano_Assinatura:Cada `Cliente` recebe um `Plano_Assinatura` único de acordo com a sua `Matricula`.

# Migrações

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

#### Esta migração refatora o campo `Telefone_Contato` de `Cliente` e `Instrutor` a fim de evitar redundâncias nos dados.

### Oitava Migração

``` SQL
ALTER TABLE Equipamento ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ);

ALTER TABLE Cliente DROP COLUMN Turma_ID;

ALTER TABLE Turma RENAME COLUMN Turno TO Turno_Turma;

````

### Esta migração corresponde à quarta modelagem.Ela adiciona o atributo `Academia_ID` à tabela `Equipamento`,a fim de seguir o relacionamento **1:N**,e remove o atributo `Turma_ID` da tabela `Cliente` para que possa seguir a cardinalidade do relacionamento.Além disso,ela renomeia o atributo `Turno_Turma` da tabela `Turma`.

### Nona Migração

``` SQL
ALTER TABLE Usuario ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ);

ALTER TABLE Plano_Assinatura ADD COLUMN Matricula_ID INT REFERENCES Matricula (ID_Matricula);

ALTER TABLE Pagamento RENAME TO Fatura_Mensal;

ALTER TABLE Fatura_Mensal RENAME COLUMN ID_Pagamento TO ID_Fatura;

ALTER TABLE Fatura_Mensal RENAME COLUMN Valor_Total TO Valor_Fatura;

ALTER TABLE Fatura_Mensal RENAME COLUMN Data_Pagamento TO Data_Vencimento;

ALTER TABLE Fatura_Mensal RENAME CONSTRAINT Check_Data_Pagamento TO Check_Data_Vencimento;

ALTER TABLE Fatura_Mensal ADD COLUMN Data_Fechamento DATE NOT NULL;

```

### Esta migração corresponde à quinta modelagem.Ela adiciona o atributo `Academia_ID` à tabela `Usuario` a fim de seguir o relacionamento 1:N e o atributo `Matricula_ID` à tabela `Plano_Assinatura`,a fim de seguir com o relacionamento 1:N e tornar cada plano "único" pra cada usuário.Além disso,ele renomeia a tabela `Pagamento` para `Fatura_Mensal` e refatora as suas colunas e restrições para que correspondam às regras de negócios de uma tabela de fatura.

### Décima Migração

``` SQL

CREATE TABLE Cliente_Turma (							         
  Cliente_ID VARCHAR(11) REFERENCES Cliente (CPF_Cliente),
  Turma_ID INT REFERENCES Turma (ID_Turma),
  PRIMARY KEY(Cliente_ID,Turma_ID)
);

```

### Esta migração corresponde à quinta modelagem.Ela cria uma tabela `Cliente_Turma` para armazenar informações relacionais de uma forma muito mais eficaz em comparação às FKs.



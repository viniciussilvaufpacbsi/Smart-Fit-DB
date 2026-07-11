-- Schema Inicial

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
  Valor_Total NUMERIC(5,2) NOT NULL,
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

-- Migração 001

ALTER TABLE Usuario ADD COLUMN Email_Usuario VARCHAR(100) UNIQUE NOT NULL;

ALTER TABLE Cliente ADD COLUMN Turma_ID INT REFERENCES Turma(ID_Turma) ON DELETE RESTRICT;

ALTER TABLE Pagamento ADD COLUMN Matricula_ID INT REFERENCES Matricula(ID_Matricula) ON DELETE CASCADE;

ALTER TABLE Plano_Exercicios ADD COLUMN Instrutor_ID VARCHAR(6) REFERENCES Instrutor(CREF) ON DELETE CASCADE;

ALTER TABLE Plano_Exercicios ADD COLUMN Turma_ID INT REFERENCES Turma(ID_Turma) ON DELETE CASCADE;

-- Migração 002

ALTER TABLE Plano_Exercicios RENAME COLUMN Periodo_Exercicios TO Duracao_Exercicio;

ALTER TABLE Plano_Exercicios RENAME COLUMN Tipo_Exercicio TO Modalidade_Exercicio;

-- Migração 003

ALTER TABLE TURMA ADD CONSTRAINT Check_Turma_Turno CHECK(Turno IN ('Manhã','Tarde','Noite'));

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Nome_Plano CHECK(Nome_Plano IN ('Smart','Fit','Black'));

ALTER TABLE Pagamento ADD CONSTRAINT Check_Forma_Pagamento CHECK(Forma_Pagamento IN ('Dinheiro','Pix','Crédito','Débito'));

ALTER TABLE Instrutor ADD CONSTRAINT Check_Especialidade_Instrutor CHECK (Especialidade IN (
'Yoga','Pilates','Spinning','Zumba',
'Musculação','Hipertrofia','Emagrecimento','Fortalecimento','Condicionamento','Alongamento e Flexibilidade',
'Karatê','Jiu-jitsu','Capoeira','Kung Fu','Taekwondo'));

-- Migração 004

ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Modalidade_Exercicio CHECK (Modalidade_Exercicio IN (
 'FITDANCE','ZUMBA','BODY COMBAT','BODY BALANCE','SMART CORE',
 'ALONGAMENTO','SMART FIGHT','SMART BIKE'));

-- Migração 005

ALTER TABLE Equipamento ADD CONSTRAINT Check_Preco_Equipamento CHECK (Valor_Equipamento > 0);

ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Quantidade_Exercicio CHECK (Quantidade_Exercicios > 0);

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Vencimento_Plano CHECK (Data_Vencimento > CURRENT_DATE);

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Valor_Plano CHECK (Valor_Plano > 0);

ALTER TABLE Pagamento ADD CONSTRAINT Check_Data_Pagamento CHECK (Data_Pagamento > CURRENT_DATE);

ALTER TABLE Pagamento ADD CONSTRAINT Check_Valor_Pagamento CHECK (Valor_Total > 0);

-- Migração 006

ALTER TABLE Academia DROP COLUMN Endereco_Academia;

ALTER TABLE Academia ADD COLUMN Unidade_Federativa_Academia VARCHAR(2) NOT NULL;

ALTER TABLE Academia ADD COLUMN Cidade_Academia VARCHAR(50) NOT NULL;

ALTER TABLE Academia ADD COLUMN Bairro_Academia VARCHAR(50) NOT NULL;

ALTER TABLE Academia ADD COLUMN Rua_Academia VARCHAR(50) NOT NULL;

-- Migração 007

ALTER TABLE Cliente ADD CONSTRAINT Unique_Telefone_Cliente UNIQUE (Telefone_Contato);

ALTER TABLE Instrutor ADD CONSTRAINT Unique_Telefone_Instrutor UNIQUE(Telefone_Contato);

-- Migração 008

ALTER TABLE Equipamento ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE SET NULL ON UPDATE RESTRICT;

ALTER TABLE Cliente DROP COLUMN Turma_ID;

ALTER TABLE Turma RENAME COLUMN Turno TO Turno_Turma;

-- Migração 009

ALTER TABLE Usuario ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Plano_Assinatura ADD COLUMN Matricula_ID INT REFERENCES Matricula(ID_Matricula) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Pagamento RENAME TO Fatura_Mensal;

ALTER TABLE Fatura_Mensal RENAME COLUMN ID_Pagamento TO ID_Fatura;

ALTER TABLE Fatura_Mensal RENAME COLUMN Data_Pagamento TO Data_Vencimento;

ALTER TABLE Fatura_Mensal RENAME CONSTRAINT Check_Data_Pagamento TO Check_Data_Vencimento;

ALTER TABLE Fatura_Mensal RENAME COLUMN Valor_Total TO Valor_Fatura;

ALTER TABLE Fatura_Mensal ADD COLUMN Data_Fechamento DATE NOT NULL;

-- Migração 010

CREATE TABLE Cliente_Turma (
  Cliente_ID VARCHAR(11) REFERENCES Cliente (CPF_Cliente),
  Turma_ID INT REFERENCES Turma (ID_Turma),
  PRIMARY KEY(Cliente_ID,Turma_ID)
);

-- Migração 011

ALTER TABLE Fatura_Mensal DROP COLUMN Matricula_ID;

ALTER TABLE Plano_Assinatura DROP COLUMN Matricula_ID;

ALTER TABLE Academia DROP COLUMN Unidade_Federativa_Academia;

-- Migração 012

ALTER TABLE Plano_Exercicios ADD COLUMN Equipamento_ID INT REFERENCES Equipamento (ID_Equipamento) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE Plano_Assinatura ADD COLUMN Cliente_ID VARCHAR(11) REFERENCES Cliente (CPF_Cliente) ON DELETE CASCADE ON UPDATE RESTRICT;

-- Migração 013

ALTER TABLE Plano_Assinatura ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Matricula ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Plano_Exercicios ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE;

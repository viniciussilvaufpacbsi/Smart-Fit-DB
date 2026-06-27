/*
=================================================================================================================================================
                                                     O B S E R V A Ç Ã O
Desculpem o equívoco,a mensagem de commit diz "Primeira Migração",mas na verdade esse arquivo não é a primeira migração mas sim a primeira versão.

A primeira migração ocorre a partir do arquivo chamado de "smart-fit-versao-001.sql".

Novamente,desculpem o equívoco,mas infelizmente não dá pra mudar uma mensagem de commit.
===================================================================================================================================================
*/

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
  Valor_Plano NUMERIC(4,2) NOT NULL,
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


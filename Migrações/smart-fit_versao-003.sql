--                                         TERCEIRA MIGRAÇÃO
CREATE TABLE Plano_Exercicios (
  ID_Plano SERIAL PRIMARY KEY,
  Tipo_Exercicio VARCHAR(200) NOT NULL,
  Quantidade_Exercicios INT NOT NULL,
  Periodo_Exercicios VARCHAR(20) NOT NULL,
  Turma_ID INT REFERENCES Turma(ID_Turma) ON DELETE CASCADE,
  Instrutor_ID VARCHAR(6) REFERENCES Instrutor(CREF) ON DELETE CASCADE
);

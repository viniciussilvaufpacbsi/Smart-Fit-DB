--    DÉCIMA MIGRAÇÃO

CREATE TABLE Cliente_Turma (							         
  Cliente_ID VARCHAR(11) REFERENCES Cliente (CPF_Cliente),
  Turma_ID INT REFERENCES Turma (ID_Turma),
  PRIMARY KEY(Cliente_ID,Turma_ID)
);

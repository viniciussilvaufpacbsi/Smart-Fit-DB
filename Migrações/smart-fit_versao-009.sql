--												NONA MIGRAÇÃO

ALTER TABLE Usuario ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ);

ALTER TABLE Plano_Assinatura ADD COLUMN Matricula_ID INT REFERENCES Matricula (ID_Matricula);

ALTER TABLE Pagamento RENAME TO Fatura_Mensal;

ALTER TABLE Fatura_Mensal RENAME COLUMN ID_Pagamento TO ID_Fatura;

ALTER TABLE Fatura_Mensal RENAME COLUMN Valor_Total TO Valor_Fatura;

ALTER TABLE Fatura_Mensal RENAME COLUMN Data_Pagamento TO Data_Vencimento;

ALTER TABLE Fatura_Mensal RENAME CONSTRAINT Check_Data_Pagamento TO Check_Data_Vencimento;

ALTER TABLE Fatura_Mensal ADD COLUMN Data_Fechamento DATE NOT NULL;

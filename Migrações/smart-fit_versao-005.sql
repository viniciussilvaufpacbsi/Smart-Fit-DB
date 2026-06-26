ALTER TABLE Equipamento ADD CONSTRAINT Check_Preco_Equipamento CHECK (Valor_Equipamento > 0);

ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Quantidade_Exercicio CHECK (Quantidade_Exercicios > 0);

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Vencimento_Plano CHECK (Data_Vencimento > CURRENT_DATE);

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Valor_Plano CHECK (Valor_Plano > 0);

ALTER TABLE Pagamento ADD CONSTRAINT Check_Data_Pagamento CHECK (Data_Pagamento > CURRENT_DATE);

ALTER TABLE Pagamento ADD CONSTRAINT Check_Valor_Pagamento CHECK (Valor_Total > 0);

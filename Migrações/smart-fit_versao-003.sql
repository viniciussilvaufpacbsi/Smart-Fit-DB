--                                         TERCEIRA MIGRAÇÃO

ALTER TABLE Plano_Exercicios RENAME COLUMN Tipo_Exercicio TO Modalidade_Exercicio;

ALTER TABLE Plano_Exercicios RENAME COLUMN Periodo_Exercicio TO Duracao_Exercicio;

ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Modalidade_Exercicio CHECK (Modalidade_Exercicio IN (
 'FITDANCE','ZUMBA','BODY COMBAT','BODY BALANCE','SMART CORE',
 'ALONGAMENTO','SMART FIGHT','SMART BIKE'));

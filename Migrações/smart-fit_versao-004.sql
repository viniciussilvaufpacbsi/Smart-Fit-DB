--                                        QUARTA MIGRAÇÃO

ALTER TABLE Plano_Exercicios ADD CONSTRAINT Check_Modalidade_Exercicio CHECK (Modalidade_Exercicio IN (
 'FITDANCE','ZUMBA','BODY COMBAT','BODY BALANCE','SMART CORE',
 'ALONGAMENTO','SMART FIGHT','SMART BIKE'));

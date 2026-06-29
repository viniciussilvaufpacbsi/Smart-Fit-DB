--                                                SEGUNDA MIGRAÇÃO

ALTER TABLE Plano_Exercicios RENAME COLUMN Periodo_Exercicio TO Duracao_Exercicio;

ALTER TABLE Plano_Exercicios RENAME COLUMN Tipo_Exercicio TO Modalidade_Exercicio;

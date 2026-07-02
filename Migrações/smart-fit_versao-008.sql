--                                    OITAVA MIGRAÇÃO          

ALTER TABLE Equipamento ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ) ON DELETE CASCADE;

ALTER TABLE Cliente DROP COLUMN Turma_ID;

ALTER TABLE Turma RENAME COLUMN Turno TO Turno_Turma;

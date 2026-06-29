--                                    OITAVA MIGRAÇÃO          

ALTER TABLE Equipamento ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ);

ALTER TABLE Cliente DROP COLUMN Turma_ID;

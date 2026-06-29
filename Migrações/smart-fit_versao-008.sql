--                                    OITAVA MIGRAÇÃO          

ALTER TABLE Equipamento ADD COLUMN Academia_ID VARCHAR(14) REFERENCES Academia(CNPJ);

--                                          SÉTIMA MIGRAÇÃO

ALTER TABLE Cliente ADD CONSTRAINT Unique_Telefone_Cliente UNIQUE (Telefone_Contato);

ALTER TABLE Instrutor ADD CONSTRAINT Unique_Telefone_Instrutor UNIQUE(Telefone_Contato);

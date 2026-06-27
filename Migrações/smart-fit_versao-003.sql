--                                         TERCEIRA MIGRAÇÃO

ALTER TABLE TURMA ADD CONSTRAINT Check_Turma_Turno CHECK(Turno IN ('Manhã','Tarde','Noite'));

ALTER TABLE Plano_Assinatura ADD CONSTRAINT Check_Nome_Plano CHECK(Nome_Plano IN ('Smart','Fit','Black'));

ALTER TABLE Pagamento ADD CONSTRAINT Check_Forma_Pagamento CHECK(Forma_Pagamento IN ('Dinheiro','Pix','Crédito','Débito'));

ALTER TABLE Instrutor ADD CONSTRAINT Check_Especialidade_Instrutor CHECK (Especialidade IN (
'Yoga','Pilates','Spinning','Zumba',
'Musculação','Hipertrofia','Emagrecimento','Fortalecimento','Condicionamento','Alongamento e Flexibilidade',
'Karatê','Jiu-jitsu','Capoeira','Kung Fu','Taekwondo'));

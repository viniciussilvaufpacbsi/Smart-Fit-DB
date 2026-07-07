INSERT INTO Academia (CNPJ,Nome_Academia,Cidade_Academia,Bairro_Academia,Rua_Academia,Telefone_Contato) VALUES 

('38785963763719','Pátio Belém','Belém','Batista Campos','Tv.Padre Eutíquo,1078','9198754978');

INSERT INTO Equipamento (Nome_Equipamento,Tipo_Equipamento,Condicao_Equipamento,Valor_Equipamento,Academia_ID) VALUES 

('Peitoral Dorsal','Peitoral','Excelente',2499.90,'38785963763719'),

('Leg Press Horizontal','Leg Press','Excelente',2899.99,'38785963763719'),

('Rosca Scott','Rosca','Excelente',2599.90,'38785963763719'),

('Glúteo 4 Apoios','Glúteo 4 Apoios','Excelente',2199.99,'38785963763719'),

('Prancha Abdominal','Prancha Abdominal','Excelente',2099.90,'38785963763719'),

('Supino Regulável Profissional','Supino','Bom',1999.90,'38785963763719');

INSERT INTO Usuario (Nome_Usuario,Senha_Usuario,Email_Usuario,Academia_ID) VALUES 

('MiguelSZ','ABCD123','Miguel.Souza@smart.fit.com','38785963763719'),

('AnaM','WRT124','Ana.Maria@gmail.com','38785963763719'),

('GabiS89','YTR24563','Gabrielle.Silveira@gmail.com','38785963763719'),

('RenanO','TRTS12','Renan.Oliveira@smart.fit.com','38785963763719'),

('RonaldoSantos','ERT5423','Ronaldo.Santos@smart.fit.com','38785963763719'),

('AnaLet','ERFVE1','Ana.Leticia@gmail.com','38785963763719'),

('GabrielS123','SDNW213','Gabriel.Santos@gmail.com','38785963763719'),

('GustavoL1M@','OIE24D1','Gustavo.Lima@gmail.com','38785963763719'),

('ThiagoCardoso77','34REW12','Thiago.Cardoso@gmail.com','38785963763719');

INSERT INTO Instrutor (CREF,Nome_Instrutor,Especialidade,Telefone_Contato,Usuario_ID) VALUES 

('328684','Miguel Souza Augusto','Musculação','91936729388',1),

('687341','Renan Oliveira Lima','Fortalecimento','91986534095',4),

('978642','Ronaldo Santos Carvalho','Condicionamento','9198483261',5);

INSERT INTO Cliente (CPF_Cliente,Nome_Cliente,Telefone_Contato,Usuario_ID) VALUES 

('01534812052','Ana Maria Oliveira','91953612395',2),

('01075312834','Gabrielle Silveira Teixeira','91984639187',3),

('01135647891','Ana Letícia Lima','91986532045',6),

('01134856832','Gabriel Santos Oliveira','91986734521',7),

('01234678913','Gustavo Henrique Lima','91945631809',8),

('01341986341','Thiago Cardoso Santos','91983245821',9);

INSERT INTO Matricula (Cliente_ID) VALUES 

('01534812052'),('01075312834'),('01135647891'),

('01134856832'),('01234678913'),('01341986341');

INSERT INTO Turma (Nome_Turma,Turno_Turma,Instrutor_ID) VALUES 

('Musculação - Pátio Belém - Noite','Noite','328684'),

('Fortalecimento - Pátio Belém - Tarde','Tarde','687341'),

('Condicionamento - Pátio Belém - Manhã','Manhã','978642');

INSERT INTO Plano_Exercicios (Modalidade_Exercicio,Quantidade_Exercicios,Duracao_Exercicio,Instrutor_ID,Turma_ID,Equipamento_ID) VALUES

('SMART CORE',15,'30 Minutos','328684',1,2),

('SMART CORE',30,'45 Minutos','328684',2,1),

('SMART CORE',50,'25 Minutos','328684',1,6),

('SMART CORE',30,'45 Minutos','687341',2,3),

('SMART CORE',30,'30 Minutos','687341',2,2),

('SMART CORE',40,'30 Minutos','978642',3,3),

('SMART CORE',10,'30 Minutos','687341',2,5),

('SMART CORE',25,'20 Minutos','328684',2,4),

('SMART CORE',30,'30 Minutos','687341',3,2);

INSERT INTO Plano_Assinatura (Nome_Plano,Valor_Plano,Data_Vencimento,Cliente_ID) VALUES 

('Fit',59.90,'2026-08-09','01534812052'),

('Smart',159.90,'2026-08-12','01075312834'),

('Black',199.90,'2026-08-15','01135647891'),

('Smart',159.90,'2026-08-18','01134856832'),

('Fit',59.90,'2026-08-21','01234678913'),

('Black',199.90,'2026-08-24','01341986341');

INSERT INTO Fatura_Mensal (Data_Fechamento,Data_Vencimento,Valor_Fatura,Forma_Pagamento,Cliente_ID,Plano_ID) VALUES 

('2026-08-02','2026-08-09',59.90,'Débito','01534812052',1),

('2026-08-05','2026-08-12',159.90,'Crédito','01075312834',2),

('2026-08-08','2026-08-15',199.90,'Crédito','01135647891',3),

('2026-08-11','2026-08-18',159.90,'Pix','01134856832',4),

('2026-08-14','2026-08-21',59.90,'Dinheiro','01234678913',5),

('2026-08-17','2026-08-24',199.90,'Crédito','01341986341',6);

INSERT INTO Cliente_Turma (Cliente_ID,Turma_ID) VALUES 

('01534812052',1),('01534812052',3),

('01075312834',3),('01075312834',2),

('01135647891',3),('01135647891',1),

('01134856832',3),('01134856832',2),

('01234678913',1),('01234678913',2),

('01341986341',1),('01341986341',2),('01341986341',3);

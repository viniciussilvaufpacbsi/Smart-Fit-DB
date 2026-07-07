INSERT INTO Academia (CNPJ,Nome_Academia,Cidade_Academia,Bairro_Academia,Rua_Academia,Telefone_Contato) VALUES 

('41567893428914','Boulevard','Belém','Reduto','Av Visc.De Souza Franco,776','9198003475');

INSERT INTO Equipamento (Nome_Equipamento,Tipo_Equipamento,Condicao_Equipamento,Valor_Equipamento,Academia_ID) VALUES 

('Step Chair Combo','Chair','Excelente',5000.00,'41567893428914'),

('Cadillac Classic','Cadillac','Excelente',10000.00,'41567893428914'),

('Ladder Barrel Classic','Barrel','Excelente',3000.00,'41567893428914'),

('Zumba Tonning Stick','Bastão de Zumba','Excelente',89.90,'41567893428914');

INSERT INTO Usuario (Nome_Usuario,Senha_Usuario,Email_Usuario,Academia_ID) VALUES 

('JoaoP','ABC123','Joao.Pedro@gmail.com','41567893428914'),

('CarlosN','WXYZ','Carlos.Nascimento@smart.fit.com','41567893428914'),

('MariaSouza','123456','Maria.Souza@gmail.com','41567893428914'),

('AnaC32','RTY345','Ana.Clara@gmail.com','41567893428914'),

('GabiS765','WERT21','Gabriella.Silva@gmail.com','41567893428914'),

('YasTX23','YSTXQ12','Yasmim.Teixeira@smart.fit.com','41567893428914'),

('LeandroC','NMBF23','Leandro.Costa@gmail.com','41567893428914');

INSERT INTO Instrutor (CREF,Nome_Instrutor,Especialidade,Telefone_Contato,Usuario_ID) VALUES 

('456523','Carlos Nascimento da Silva','Pilates','91935015825',2),

('231675','Yasmim Teixeira','Zumba','91975238421',6);

INSERT INTO Cliente (CPF_Cliente,Nome_Cliente,Telefone_Contato,Usuario_ID) VALUES 

('01457831195','João Pedro dos Santos','91927306798',1),

('01156914398','Maria Souza dos Anjos','9192761341',3),

('01347938215','Ana Clara Pedroso','91986732541',4),

('01486735127','Gabriella Nascimento Silva','91985673219',5),

('01057534028','Leandro Nascimento Costa','91986534521',7);

INSERT INTO Matricula (Cliente_ID) VALUES 

('01457831195'),('01156914398'),('01347938215'),

('01486735127'),('01057534028');

INSERT INTO Turma (Nome_Turma,Turno_Turma,Instrutor_ID) VALUES 

('Pilates - Boulevard - Manhã','Manhã','456523'),

('Zumba - Boulevard - Noite','Noite','231675');

INSERT INTO Plano_Exercicios (Modalidade_Exercicio,Quantidade_Exercicios,Duracao_Exercicio,Instrutor_ID,Turma_ID,Equipamento_ID) VALUES

('BODY BALANCE',12,'45 Minutos','456523',1,3),

('FITDANCE',25,'30 Minutos','231675',2,4);

INSERT INTO Plano_Assinatura (Nome_Plano,Valor_Plano,Data_Vencimento,Cliente_ID) VALUES 

('Smart',159.90,'2026-08-03','01457831195'),

('Fit',59.90,'2026-08-06','01156914398'),

('Black',199.90,'2026-08-09','01347938215'),

('Fit',59.90,'2026-08-12','01486735127'),

('Smart',159.90,'2026-08-15','01057534028');

INSERT INTO Fatura_Mensal (Data_Fechamento,Data_Vencimento,Valor_Fatura,Forma_Pagamento,Cliente_ID,Plano_ID) VALUES 

('2026-07-26','2026-08-03',159.90,'Pix','01457831195',1),

('2026-07-29','2026-08-06',59.90,'Crédito','01156914398',2),

('2026-08-02','2026-08-09',199.90,'Dinheiro','01347938215',3),

('2026-08-05','2026-08-12',59.90,'Pix','01486735127',4),

('2026-08-08','2026-08-15',159.90,'Crédito','01057534028',5);

INSERT INTO Cliente_Turma (Cliente_ID,Turma_ID) VALUES 

('01457831195',2),('01156914398',2),

('01347938215',2),('01486735127',2),

('01057534028',1);

INSERT INTO Academia (CNPJ,Nome_Academia,Cidade_Academia,Bairro_Academia,Rua_Academia,Telefone_Contato) VALUES 

('41567893428914','Boulevard','Belém','Reduto','Av Visc.De Souza Franco,776','9198003475'),

('38785963763719','Pátio Belém','Belém','Batista Campos','Tv.Padre Eutíquo,1078','9198754978'),

('74328457128032','Shopping Castanheira','Belém','Castanheira','Rodovia BR 316','91937528419'),

('11589453820327','Mário Covas','Ananindeua','Coqueiro','Rodovia Mário Covas, nº 575','91985046532');

INSERT INTO Equipamento (Nome_Equipamento,Tipo_Equipamento,Condicao_Equipamento,Valor_Equipamento,Academia_ID) VALUES 

('Step Chair Combo','Chair','Excelente',5000.00,'41567893428914'),

('Cadillac Classic','Cadillac','Excelente',10000.00,'41567893428914'),

('Ladder Barrel Classic','Barrel','Excelente',3000.00,'41567893428914'),

('Zumba Tonning Stick','Bastão de Zumba','Excelente',89.90,'41567893428914'),

('Peitoral Dorsal','Peitoral','Excelente',2499.90,'38785963763719'),

('Leg Press Horizontal','Leg Press','Excelente',2899.99,'38785963763719'),

('Rosca Scott','Rosca','Excelente',2599.90,'38785963763719'),

('Glúteo 4 Apoios','Glúteo 4 Apoios','Excelente',2199.99,'38785963763719'),

('Prancha Abdominal','Prancha Abdominal','Excelente',2099.90,'38785963763719'),

('Supino Regulável Profissional','Supino','Bom',1999.90,'38785963763719'),

('Esteira Ergométrica Elétrica C/Inclinação ','Esteira Ergométrica Elétrica','Excelente',1900.00,'74328457128032'),

('Esteira Elétrica Dobrável Bivolt','Esteira Dobrável','Excelente',650.00,'74328457128032'),

('Esteira Elétrica Inteligente','Esteira Elétrica','Excelente',1800.00,'74328457128032'),

('Bicicleta Ergométrica Horizontal','Bicicleta Ergométrica','Excelente',1150.00,'74328457128032'),

('Bicicleta Spinning Com Roda de Inércia','Bicicleta Spinning','Excelente',1399.99,'74328457128032'),

('Luva Maximum','Luva','Excelente',275.00,'11589453820327'),

('Capacete Protetor C/Grade','Capacete Protetor','Excelente',320.00,'11589453820327'),

('Caneleira Classic','Caneleira','Excelente',365.00,'11589453820327'),

('Saco de Pancada Profissional ','Saco de Pancada','Excelente',120.00,'11589453820327');


INSERT INTO Usuario (Nome_Usuario,Senha_Usuario,Email_Usuario,Academia_ID) VALUES 

('JoaoP','ABC123','Joao.Pedro@gmail.com','41567893428914'),

('CarlosN','WXYZ','Carlos.Nascimento@smart.fit.com','41567893428914'),

('MariaSouza','123456','Maria.Souza@gmail.com','41567893428914'),

('AnaC32','RTY345','Ana.Clara@gmail.com','41567893428914'),

('GabiS765','WERT21','Gabriella.Silva@gmail.com','41567893428914'),

('YasTX23','YSTXQ12','Yasmim.Teixeira@smart.fit.com','41567893428914'),

('LeandroC','NMBF23','Leandro.Costa@gmail.com','41567893428914'),

('MiguelSZ','ABCD123','Miguel.Souza@smart.fit.com','38785963763719'),

('AnaM','WRT124','Ana.Maria@gmail.com','38785963763719'),

('GabiS89','YTR24563','Gabrielle.Silveira@gmail.com','38785963763719'),

('RenanO','TRTS12','Renan.Oliveira@smart.fit.com','38785963763719'),

('RonaldoSantos','ERT5423','Ronaldo.Santos@smart.fit.com','38785963763719'),

('AnaLet','ERFVE1','Ana.Leticia@gmail.com','38785963763719'),

('GabrielS123','SDNW213','Gabriel.Santos@gmail.com','38785963763719'),

('GustavoL1M@','OIE24D1','Gustavo.Lima@gmail.com','38785963763719'),

('ThiagoCardoso77','34REW12','Thiago.Cardoso@gmail.com','38785963763719'),

('MariO1','VXEq1','Marianna.Oliveira@gmail.com','74328457128032'),

('JuhM15','XSWQ1','Julianna.Magalhes@gmail.com','74328457128032'),

('LuuhC65','QWRTV3','Luciana.Camargo@gmail.com','74328457128032'),

('CarlosEduardo189','DFWD1','Carlos.Eduardo@gmail.com','74328457128032'),

('EduardoA785','SDF34','Eduardo.Araujo@gmail.com','74328457128032'),

('CarlosNascimento2026','Smart MC2345','Carlos.Nascimento@gmail.com','11589453820327'),

('GioSilva25','Muay2026','Giovanna.Silva25@gmail.com','11589453820327'),

('Bruno3026','BrunoJiu','Bruno.Correa.26@gmail.com','11589453820327'),

('RafaeL33','RafaK59','Rafael.Lima@gmail.com','11589453820327');

INSERT INTO Instrutor (CREF,Nome_Instrutor,Especialidade,Telefone_Contato,Usuario_ID) VALUES 

('456523','Carlos Nascimento da Silva','Pilates','91935015825',2),

('231675','Yasmim Teixeira','Zumba','91975238421',6),

('328684','Miguel Souza Augusto','Musculação','91936729388',8),

('687341','Renan Oliveira Lima','Fortalecimento','91986534095',11),

('978642','Ronaldo Santos Carvalho','Condicionamento','9198483261',12),

('348913','Carlos Eduardo Sampaio','Emagrecimento','91973476218',20),

('856932','Eduardo Araújo Côrrea','Spinning','91985635814',21),

('483679','Carlos Nascimento dos Santos','Kung Fu','91986675249',22),

('695343','Rafael Lima Côrrea','Karatê','91946683215',25);

INSERT INTO Cliente (CPF_Cliente,Nome_Cliente,Telefone_Contato,Usuario_ID) VALUES 

('01457831195','João Pedro dos Santos','91927306798',1),

('01156914398','Maria Souza dos Anjos','9192761341',3),

('01347938215','Ana Clara Pedroso','91986732541',4),

('01486735127','Gabriella Nascimento Silva','91985673219',5),

('01057534028','Leandro Nascimento Costa','91986534521',7),

('01534812052','Ana Maria Oliveira','91953612395',9),

('01075312834','Gabrielle Silveira Teixeira','91984639187',10),

('01135647891','Ana Letícia Lima','91986532045',13),

('01134856832','Gabriel Santos Oliveira','91986734521',14),

('01234678913','Gustavo Henrique Lima','91945631809',15),

('01341986341','Thiago Cardoso Santos','91983245821',16),

('01147936721','Marianna Oliveira dos Santos','91984635239',17),

('01348932683','Julianna Oliveira de Magalhães','91943257483',18),

('01312638961','Luciana Camargos dos Santos','91947839154',19),

('01048936327','Giovanna Côrrea da Silva','91984574384',23),

('01089543578','Bruno Leonardo Magalhães','91956748369',24);


INSERT INTO Matricula (Cliente_ID,Academia_ID) VALUES 

('01457831195','41567893428914'),

('01156914398','41567893428914'),

('01347938215','41567893428914'),

('01486735127','41567893428914'),

('01057534028','41567893428914'),

('01534812052','38785963763719'),

('01075312834','38785963763719'),

('01135647891','38785963763719'),

('01134856832','38785963763719'),

('01234678913','38785963763719'),

('01341986341','38785963763719'),

('01147936721','74328457128032'),

('01348932683','74328457128032'),

('01312638961','74328457128032'),

('01048936327','11589453820327'),

('01089543578','11589453820327');

INSERT INTO Turma (Nome_Turma,Turno_Turma,Instrutor_ID) VALUES 

('Pilates - Boulevard - Manhã','Manhã','456523'),

('Zumba - Boulevard - Noite','Noite','231675'),

('Musculação - Pátio Belém - Noite','Noite','328684'),

('Fortalecimento - Pátio Belém - Tarde','Tarde','687341'),

('Condicionamento - Pátio Belém - Manhã','Manhã','978642'),

('Castanheira - Emagrecimento - Tarde','Tarde','348913'),

('Castanheira - Spinning - Noite','Noite','856932'),

('Kung Fu - Mário Covas - Noite','Noite','483679'),

('Karatê - Mário Covas - Tarde','Tarde','695343');

INSERT INTO Plano_Exercicios (Modalidade_Exercicio,Quantidade_Exercicios,Duracao_Exercicio,Instrutor_ID,Turma_ID,Equipamento_ID,Academia_ID) VALUES

('BODY BALANCE',12,'45 Minutos','456523',1,3,'41567893428914'),

('FITDANCE',25,'30 Minutos','231675',2,4,'41567893428914'),

('SMART CORE',15,'30 Minutos','328684',3,6,'38785963763719'),

('SMART CORE',30,'45 Minutos','328684',4,5,'38785963763719'),

('SMART CORE',50,'25 Minutos','328684',4,10,'38785963763719'),

('SMART CORE',30,'45 Minutos','687341',5,7,'38785963763719'),

('SMART CORE',30,'30 Minutos','687341',4,6,'38785963763719'),

('SMART CORE',40,'30 Minutos','978642',5,7,'38785963763719'),

('SMART CORE',10,'30 Minutos','687341',4,9,'38785963763719'),

('SMART CORE',25,'20 Minutos','328684',4,8,'38785963763719'),

('SMART CORE',30,'30 Minutos','687341',5,6,'38785963763719'),

('SMART BIKE',30,'45 Minutos','348913',6,14,'74328457128032'),

('SMART BIKE',30,'30 Minutos','856932',7,15,'74328457128032'),

('SMART FIGHT',50,'45 Minutos','483679',8,19,'11589453820327'),

('SMART FIGHT',30,'45 Minutos','695343',9,17,'11589453820327');

INSERT INTO Plano_Assinatura (Nome_Plano,Valor_Plano,Data_Vencimento,Cliente_ID,Academia_ID) VALUES 

('Smart',159.90,'2026-08-03','01457831195','41567893428914'),

('Fit',59.90,'2026-08-06','01156914398','41567893428914'),

('Black',199.90,'2026-08-09','01347938215','41567893428914'),

('Fit',59.90,'2026-08-12','01486735127','41567893428914'),

('Smart',159.90,'2026-08-15','01057534028','41567893428914'),

('Fit',59.90,'2026-08-09','01534812052','38785963763719'),

('Smart',159.90,'2026-08-12','01075312834','38785963763719'),

('Black',199.90,'2026-08-15','01135647891','38785963763719'),

('Smart',159.90,'2026-08-18','01134856832','38785963763719'),

('Fit',59.90,'2026-08-21','01234678913','38785963763719'),

('Black',199.90,'2026-08-24','01341986341','38785963763719'),

('Black',199.90,'2026-08-15','01147936721','74328457128032'),

('Fit',59.90,'2026-08-18','01348932683','74328457128032'),

('Smart',159.90,'2026-08-21','01312638961','74328457128032'),

('Smart',159.90,'2026-08-03','01048936327','11589453820327'),

('Black',199.90,'2026-08-05','01089543578','11589453820327');

INSERT INTO Fatura_Mensal (Data_Fechamento,Data_Vencimento,Valor_Fatura,Forma_Pagamento,Cliente_ID,Plano_ID) VALUES 

('2026-07-26','2026-08-03',159.90,'Pix','01457831195',1),

('2026-07-29','2026-08-06',59.90,'Crédito','01156914398',2),

('2026-08-02','2026-08-09',199.90,'Dinheiro','01347938215',3),

('2026-08-05','2026-08-12',59.90,'Pix','01486735127',4),

('2026-08-08','2026-08-15',159.90,'Crédito','01057534028',5),

('2026-08-02','2026-08-09',59.90,'Débito','01534812052',6),

('2026-08-05','2026-08-12',159.90,'Crédito','01075312834',7),

('2026-08-08','2026-08-15',199.90,'Crédito','01135647891',8),

('2026-08-11','2026-08-18',159.90,'Pix','01134856832',9),

('2026-08-14','2026-08-21',59.90,'Dinheiro','01234678913',10),

('2026-08-17','2026-08-24',199.90,'Crédito','01341986341',11),

('2026-08-08','2026-08-15',199.90,'Pix','01147936721',12),

('2026-08-11','2026-08-18',199.90,'Crédito','01348932683',13),

('2026-08-14','2026-08-21',59.90,'Dinheiro','01312638961',14),

('2026-08-03','2026-08-10',159.90,'Crédito','01048936327',15),

('2026-08-05','2026-08-12',199.90,'Crédito','01089543578',16);

INSERT INTO Cliente_Turma (Cliente_ID,Turma_ID) VALUES 

('01457831195',2),('01156914398',2),

('01347938215',2),('01486735127',2),('01057534028',1),

('01534812052',3),('01534812052',5),

('01075312834',5),('01075312834',4),

('01135647891',5),('01135647891',1),

('01134856832',5),('01134856832',4),

('01234678913',3),('01234678913',4),

('01341986341',3),('01341986341',4),('01341986341',5),

('01147936721',6),('01147936721',7),

('01348932683',7),('01312638961',6),

('01048936327',8),('01089543578',9);

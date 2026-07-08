INSERT INTO Academia (CNPJ,Nome_Academia,Cidade_Academia,Bairro_Academia,Rua_Academia,Telefone_Contato) VALUES 

('74328457128032','Shopping Castanheira','Belém','Castanheira','Rodovia BR 316','91937528419');

INSERT INTO Equipamento (Nome_Equipamento,Tipo_Equipamento,Condicao_Equipamento,Valor_Equipamento,Academia_ID) VALUES 

('Esteira Ergométrica Elétrica C/Inclinação ','Esteira Ergométrica Elétrica','Excelente',1900.00,'74328457128032'),

('Esteira Elétrica Dobrável Bivolt','Esteira Dobrável','Excelente',650.00,'74328457128032'),

('Esteira Elétrica Inteligente','Esteira Elétrica','Excelente',1800.00,'74328457128032'),

('Bicicleta Ergométrica Horizontal','Bicicleta Ergométrica','Excelente',1150.00,'74328457128032'),

('Bicicleta Spinning Com Roda de Inércia','Bicicleta Spinning','Excelente',1399.99,'74328457128032');

INSERT INTO Usuario (Nome_Usuario,Senha_Usuario,Email_Usuario,Academia_ID) VALUES

('MariO1','VXEq1','Marianna.Oliveira@gmail.com','74328457128032'),

('JuhM15','XSWQ1','Julianna.Magalhes@gmail.com','74328457128032'),

('LuuhC65','QWRTV3','Luciana.Camargo@gmail.com','74328457128032'),

('CarlosEduardo189','DFWD1','Carlos.Eduardo@gmail.com','74328457128032'),

('EduardoA785','SDF34','Eduardo.Araujo@gmail.com','74328457128032');

INSERT INTO Instrutor (CREF,Nome_Instrutor,Especialidade,Telefone_Contato,Usuario_ID) VALUES 

('348913','Carlos Eduardo Sampaio','Emagrecimento','91973476218',4),

('856932','Eduardo Araújo Côrrea','Spinning','91985635814',5);

INSERT INTO Cliente (CPF_Cliente,Nome_Cliente,Telefone_Contato,Usuario_ID) VALUES 

('01147936721','Marianna Oliveira dos Santos','91984635239',1),

('01348932683','Julianna Oliveira de Magalhães','91943257483',2),

('01312638961','Luciana Camargos dos Santos','91947839154',3);

INSERT INTO Matricula (Cliente_ID) VALUES 

('01147936721'),('01348932683'),('01312638961');

INSERT INTO Turma (Nome_Turma,Turno_Turma,Instrutor_ID) VALUES 

('Castanheira - Emagrecimento - Tarde','Tarde','348913'),

('Castanheira - Spinning - Noite','Noite','856932');

INSERT INTO Plano_Exercicios (Modalidade_Exercicio,Quantidade_Exercicios,Duracao_Exercicio,Instrutor_ID,Turma_ID,Equipamento_ID) VALUES

('SMART BIKE',30,'45 Minutos','348913',1,4),

('SMART BIKE',30,'30 Minutos','856932',2,5);

INSERT INTO Plano_Assinatura (Nome_Plano,Valor_Plano,Data_Vencimento,Cliente_ID) VALUES 

('Black',199.90,'2026-08-15','01147936721'),

('Fit',59.90,'2026-08-18','01348932683'),

('Smart',159.90,'2026-08-21','01312638961');

INSERT INTO Fatura_Mensal (Data_Fechamento,Data_Vencimento,Valor_Fatura,Forma_Pagamento,Cliente_ID,Plano_ID) VALUES 

('2026-08-08','2026-08-15',199.90,'Pix','01147936721',1),

('2026-08-11','2026-08-18',199.90,'Crédito','01348932683',2),

('2026-08-14','2026-08-21',59.90,'Dinheiro','01312638961',3);

INSERT INTO Cliente_Turma (Cliente_ID,Turma_ID) VALUES 

('01147936721',1),('01147936721',2),

('01348932683',2),('01312638961',1);

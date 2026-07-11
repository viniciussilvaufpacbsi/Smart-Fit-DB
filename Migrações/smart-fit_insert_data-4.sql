INSERT INTO Academia (CNPJ,Nome_Academia,Cidade_Academia,Bairro_Academia,Rua_Academia,Telefone_Contato) VALUES 

('11589453820327','Mário Covas','Ananindeua','Coqueiro','Rodovia Mário Covas, nº 575','91985046532');

INSERT INTO Equipamento (Nome_Equipamento,Tipo_Equipamento,Condicao_Equipamento,Valor_Equipamento,Academia_ID) VALUES 

('Luva Maximum','Luva','Excelente',275.00,'11589453820327'),

('Capacete Protetor C/Grade','Capacete Protetor','Excelente',320.00,'11589453820327'),

('Caneleira Classic','Caneleira','Excelente',365.00,'11589453820327'),

('Saco de Pancada Profissional ','Saco de Pancada','Excelente',120.00,'11589453820327');

INSERT INTO Usuario (Nome_Usuario,Senha_Usuario,Email_Usuario,Academia_ID) VALUES 

('CarlosNascimento2026','Smart MC2345','Carlos.Nascimento@gmail.com','11589453820327'),

('GioSilva25','Muay2026','Giovanna.Silva25@gmail.com','11589453820327'),

('Bruno3026','BrunoJiu','Bruno.Correa.26@gmail.com','11589453820327'),

('RafaeL33','RafaK59','Rafael.Lima@gmail.com','11589453820327');

INSERT INTO Instrutor (CREF,Nome_Instrutor,Especialidade,Telefone_Contato,Usuario_ID) VALUES 

('483679','Carlos Nascimento dos Santos','Kung Fu','91986675249',1),

('695343','Rafael Lima Côrrea','Karatê','91946683215',4);

INSERT INTO Cliente (CPF_Cliente,Nome_Cliente,Telefone_Contato,Usuario_ID) VALUES 

('01048936327','Giovanna Côrrea da Silva','91984574384',2),

('01089543578','Bruno Leonardo Magalhães','91956748369',3);

INSERT INTO Matricula (Cliente_ID,Academia_ID) VALUES 

('01048936327','11589453820327'),

('01089543578','11589453820327');

INSERT INTO Turma (Nome_Turma,Turno_Turma,Instrutor_ID) VALUES 

('Kung Fu - Mário Covas - Noite','Noite','483679'),

('Karatê - Mário Covas - Tarde','Tarde','695343');

INSERT INTO Plano_Exercicios (Modalidade_Exercicio,Quantidade_Exercicios,Duracao_Exercicio,Instrutor_ID,Turma_ID,Equipamento_ID,Academia_ID) VALUES

('SMART FIGHT',50,'45 Minutos','483679',1,4,'11589453820327'),

('SMART FIGHT',30,'45 Minutos','695343',2,2,'11589453820327');

INSERT INTO Plano_Assinatura (Nome_Plano,Valor_Plano,Data_Vencimento,Cliente_ID,Academia_ID) VALUES 

('Smart',159.90,'2026-08-03','01048936327','11589453820327'),

('Black',199.90,'2026-08-05','01089543578','11589453820327');

INSERT INTO Fatura_Mensal (Data_Fechamento,Data_Vencimento,Valor_Fatura,Forma_Pagamento,Cliente_ID,Plano_ID) VALUES 

('2026-08-03','2026-08-10',159.90,'Crédito','01048936327',1),

('2026-08-05','2026-08-12',199.90,'Crédito','01089543578',2);

INSERT INTO Cliente_Turma (Cliente_ID,Turma_ID) VALUES 

('01048936327',1),('01089543578',2);

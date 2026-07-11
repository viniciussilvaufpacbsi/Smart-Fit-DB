-- Quais são os planos de exercícios oferecidos pela Smart Fit de Ananindeua?

SELECT P.Modalidade_Exercicio AS "Exercício" FROM Plano_Exercicios P 
INNER JOIN Academia A ON P.Academia_ID = A.CNPJ WHERE A.Cidade_Academia = 'Ananindeua';

-- Qual é o cliente mais antigo da Smart Fit de Ananindeua?

SELECT C.Nome_Cliente AS "Cliente",MAX(U.Data_Cadastro) AS "Maior Tempo" FROM Cliente C 
INNER JOIN Usuario U ON C.Usuario_ID = U.ID_Usuario 
INNER JOIN Academia A ON U.Academia_ID = A.CNPJ 
WHERE A.Cidade_Academia ='Ananindeua' GROUP BY "Cliente";

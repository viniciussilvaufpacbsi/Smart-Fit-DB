# Smart-Fit-DB
## Trabalho:Projeto de Bancos de Dados I  
## Orientador:Gustavo Henrique Lima Pinto 
## Equipe:Vinicius da Silva e Silva e João de Deus da Conceição Neto
## Curso:Sistemas de Informação
## Instituição:Universidade Federal do Pará

# Sistema Escolhido
## Nome do Sistema:Smart-Fit-DB
## Descrição do Sistema:O Smart-Fit-DB é um banco de dados relacional desenvolvido para PostgreSQL a fim de simular um schema semelhante ao da rede de academias Smart Fit.Nele,cada usuário pode se cadastrar como um cliente ou um instrutor,realizando tarefas diferentes.Todo cliente precisa realizar uma matrícula e assinar um plano de serviço,o qual oferece três opções:Smart,Fit e Black.Além disso,todo cliente precisa participar de uma turma,a qual é determinada pelos exercícios que precisa fazer.Todo instrutor é responsável por uma turma de acordo com a sua especialidade e cada turma precisa seguir um plano de exercícios.Um plano de exercícios é determinado por um instrutor e está associado a uma única turma.Além disso,os planos de exercícios possuem uma determinada duração e estão associados com uma modalidade.
## Objetivo do Sistema:O objetivo do Smart-Fit-DB é de ser apenas um exercício acadêmico de modelagem.Não há nenhuma intenção comercial e todas as semelhanças são apenas para seguir o propósito de simular o modelo de dados da forma mais fiél possível,sem violar os direitos autorais da Smart Fit. 

# A Modelagem
## Uma Breve Descrição:Os DERs foram desenvolvidos utilizando a ferramenta BR Modelo Web.Cada versão representa um estágio do sistema,o qual é evoluído de forma incremental.
## Decisões de Modelagem
### Usuário:A entidade "Usuário" é uma especialização por disjunção parcial.Escolheu-se tal abordagem por ser mais simples.Além disso,há uma possibilidade de que um usuário não seja nem "Cliente" e nem "Instrutor".
### Academia:A entidade "Academia" representa um franqueado da rede e por isso foi incluída.

# As Migrações
## Informações:O arquivo chamado de "smart-fit_versao-000.sql" representa a primeira versão do sistema.Ele não é uma migração.Cada versão incrementada após ele é uma migração.
## Funcionamento:Para rodar as migrações insira as alterações dentro de "smart-fit_versao-000.sql" e execute-o.

# Funcionamento do Sistema
## Execução:Para rodar o schema e as suas migrações,vá no DB-Fiddle,selecione a última versão do PostgreSQL,copie e cole todos os códigos e execute-os.

# Perspectiva do Sistema:O Smart-Fit-DB é só um simples exercício acadêmico.Ainda falta framework,dockerfile e padrões de segurança contra SQL Injection.

OBSERVAÇÃO:Este arquivo serve apenas explicar as mudanças dos DERs.Esse arquivo não explica decisões de modelagem,relacionamentos ou restrições.

**Academia-DB-1**:Representa a visão geral do sistema.Nela,observa-se a escolha inicial de aplicar especialização por sobreposição parcial na entidade `Usuario`.

**Academia-DB-2**:

*Adições*:`Turma_ID` em `Cliente`;`Instrutor_ID` e `Turma_ID` em Plano_Exercicios`;`Matricula_ID` em `Pagamento`;`Email_Usuario` em `Usuario`.

*Modificações*:Altera a especialização para disjunção parcial;Renomeia `Periodo_Exercicio` para `Duracao_Exercicio` e `Tipo_Exercicio` para `Modalidade_Exercicio`.

**Academia-DB-3**:

*Adições*:`Academia_ID` em `Equipamento`;`Unidade_Federativa_Academia,Cidade_Academia,Bairro_Academia,Rua_Academia` em `Academia`

*Remoções*:`Endereco_Academia` de `Academia`

**Academia-DB-4**:Ajusta os relacionamentos nas entidades `Cliente,Matricula,Instrutor,Turma` e `Plano_Exercicios`.

# OBSERVAÇÃO:Este arquivo serve apenas descrever as mudanças dos DERs,ele não explica decisões de modelagem,relacionamentos ou restrições.

## Smart-Fit_DB-1

### Descricão:Representa a visão geral do sistema.Nele,existe a especialização por sobreposição parcial em Usuario.

## Smart-Fit_DB-2

### Adições:Turma_ID em Cliente,Instrutor_ID e Turma_ID em Plano_Exercicios,Matricula_ID em Pagamento e Email_Usuario em Usuario.

### Modificações

#### 1.Altera a especialização para ser do tipo disjunção parcial

#### 2.Renomeia Periodo_Exercicios para Duracao_Exercicio e Tipo_Exercicio para Modalidade_Exercicio.

## Smart-Fit_DB-3

### Adições:

#### 1.Academia_ID em Equipamento

#### 2.Unidade_Federativa_Academia,Cidade_Academia,Bairro_Academia e Rua_Academia em Academia.

### Remoções:

#### Endereco_Academia de Academia.

## Smart-Fit_DB-4

### Alterações:

#### 1.Ajusta os relacionamentos das entidades Cliente,Matricula,Instrutor,Turma e Plano_Exercicios:

##### Cliente -> Matricula 1:1

##### Instrutor -> Turma 1:N 

##### Instrutor -> Plano_Exercicios 1:N

##### Turma -> Plano_Exercicios 1:N

#### 2.Renomeia Turno de Turma para Turno_Turma

### Remoções:

#### 1.Turma_ID de Cliente

#### 2.Endereco_Academia de Academia

### Adições

#### 1.Academia_ID em Equipamento

#### 2.Unidade_Federativa_Academia em Academia

#### 3.Cidade_Academia em Academia

#### 4.Bairro_Academia em Academia

#### 5.Rua_Academia em Academia

## Smart-Fit_DB-5

### Alterações

#### 1.Renomeia Pagamento para Fatura_Mensal

#### 2.Renomeia ID_Pagamento para ID_Fatura

#### 3.Renomeia Data_Pagamento para Data_Vencimento

#### 4.Renomeia Valor_Total para Valor_Fatura

### Adições

#### 1.Data_Fechamento em Fatura_Mensal

#### 2.Academia_ID em Usuario

#### 3.Matricula_ID em Plano_Assinatura







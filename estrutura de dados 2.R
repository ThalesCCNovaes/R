#Estrutura de dados 2

#vetor
escolaridade = c("fundamental", "médio","superior")
escolaridade

escolaridade[1]

escolaridade[2]

escolaridade[3]

summary(escolaridade)
summary(escolaridade_fator)

table(escolaridade) #Classificação dos valores

#ANALISE DE TENSÃO ELÉTRICA EM RESIDÊNCIAS

tensao_casas = c(110,220,110,110,110,110,220)
tensao_casas
summary(tensao_casas)

tensao_casas_fator = as.factor(tensao_casas)
tensao_casas_fator
summary(tensao_casas_fator) #cinco variaveis 110, 2 variavies 220




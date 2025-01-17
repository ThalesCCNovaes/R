#tratamento de dados#

library(dplyr)
setwd("~/base de dados R/dados-covid-sp-master/data")

#abrir arquivo
covid_sp = read.csv("dados_covid_sp.csv", sep = ";") #sep = separador de elementos na tabela (por ponto e virgula)
View(covid_sp)

#renomeando variaveis por coluna
covid_sp_alterado = rename(covid_sp, municipio = nome_munic)
View(covid_sp_alterado)

covid_sp_alterado = rename(covid_sp_alterado, data = datahora,
                           rotulo_mapa = map_leg, codigo_mapa = map_leg_s)
View(covid_sp_alterado)

#exlcusao de coluna por nome
covid_sp_alterado$cod_ra = NULL #ao colocar o $ ele já indica as colunas

#exclusao de coluna por numero 
covid_sp_alterado = select(covid_sp_alterado, -c(21)) #coluna Area #select = seleciona uma coluna especifica (0,1,2,3...21)

#excluir varias colunas por nome
covid_sp_alterado = subset(covid_sp_alterado, select = -c(codigo_ibge, cod_drs)) #-c = concatenar MENOS os selecionados a frente

#excluir varias colunas por numero
covid_sp_alterado = select(covid_sp_alterado, -c(14,15)) #pelas colunas selecionadas
covid_sp_alterado = select(covid_sp_alterado, -c(17:15)) #pelo intervalo de colunas selecionadas

#excluir uma linha (por numero)
covid_sp_alterado = slice(covid_sp_alterado, -c(239660)) #slice = por linha
covid_sp_alterado = slice(covid_sp_alterado, -c(239661:239666)) #Pelo intervalo de linhas

#excluir varias linhas (por nome)
covid_sp_alterado = covid_sp_alterado %% filter(municipio!="ignorado")
View(covid_sp_alterado)


#verificando valores missing (ausentes)
#NA = Valores ausentes
#NAN = not a number (valores indefinidos)

sapply(covid_sp_alterado, function(x)sum(is.na(x)))
sapply(covid_sp_alterado, function(x)sum(is.nan(x)))
View(covid_sp_alterado)

covid_sp_alterado2 = replace(x = covid_sp_alterado, list = is.na(covid_sp_alterado),
                             values = 54) 
 
covid_sp_alterado2$semana_epidem[covid_sp_alterado2$semana_epidem==54] = 2021 #no conjunto de dados COVSPALTERADO2, na coluna semana_epidem, neste conjunto, na coluna, onde estiver igual a 54, receberá 2021

#Verificação da tipagem dos atributos (variaveis)
# Character(caracteres)
# integer (numero inteiros)
# numeric ou double (reais)
# logical (TURE OR FALSE)
# complex (complexos)
# factor (fator: classes, sequencia de valores definidos por niveis)
# date (data)

str(covid_sp_alterado2) #tipos de dados que o R reconheceu
#ou
glimpse(covid_sp_alterado2) #tipos de dados que o R reconheceu

#transformação da tipagem de atributos
covid_sp_alterado2$semana_epidem = as.integer(covid_sp_alterado2$semana_epidem)
glimpse(covid_sp_alterado2)

covid_sp_alterado2$data = as.Date(covid_sp_alterado2$data, format = "%d/%m/%y") #alterando data para Day/month/year
glimpse(covid_sp_alterado2)



#Alterar varias variaveis de uma unica vez
covid_sp_alterado2[1:14] = lapply(covid_sp_alterado2[1:4], as.character)
glimpse(covid_sp_alterado2)

covid_sp_alterado2$data = as.Date(covid_sp_alterado2$data, format = "%y/%m/%d")
glimpse(covid_sp_alterado2)


#criação de colunar
covid_sp_alterado2["idoso(%)"]=100*covid_sp_alterado2%pop_60/covid_sp_alterado2$pop #na tabela covid2, a porcentagem de idoso (criada) vai receber 100*a populacao de 60
View(covid_sp_alterado2)

#exporacao de arquivos
write.table(covid_sp_alterado2, file="covid_sp_tratado.csv", sep=",")
















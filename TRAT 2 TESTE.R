##################################
###    TRATAMENTO DOS DADOS    ###
##################################

# BAIXAR PACOTES, CASO ELES AINDA NÃO ESTEJAM BAIXADOS
if(!require(dplyr)) install.packages("dplyr") 

# CARREGAR PACOTES
library(dplyr)

# BUSCAR DIRETÓRIO (PASTA COM OS ARQUIVOS)
setwd("C:/Users/USER/Desktop/Cursos_Udemy/linguagem_R_para_dados")

# ABRIR ARQUIVO
covid_sp <- read.csv('dados_covid_sp.csv', sep = ";")
View(covid_sp)

covid_sp <- read.csv2('dados_covid_sp.csv', sep = ";", encoding="UTF-8")
View(covid_sp)
head(covid_sp)







# Renomeando variáveis (colunas)
covid_sp_alterado <- rename(covid_sp, municipio = nome_munic)
View(covid_sp_alterado)


covid_sp_alterado <- rename(covid_sp_alterado, data = datahora,
                            rotulo_mapa = map_leg,codigo_mapa = map_leg_s)
View(covid_sp_alterado)

# EXCLUIR UMA COLUNA (POR NOME)
covid_sp_alterado$cod_ra <- NULL

# EXCLUIR UMA COLUNA (POR NÚMERO)
covid_sp_alterado <- select(covid_sp_alterado, -c(21))

# EXCLUIR VÁRIAS COLUNAS (POR NOME)
covid_sp_alterado <- subset(covid_sp_alterado, select = -c(codigo_ibge, cod_drs))

# EXCLUIR VÁRIAS COLUNAS (POR NÚMERO)
covid_sp_alterado <- select(covid_sp_alterado, -c(14,15))

covid_sp_alterado <- select(covid_sp_alterado, -c(17:19))


# EXCLUIR UMA LINHA (POR NÚMERO)
covid_sp_alterado <- slice(covid_sp_alterado, -c(239660))

covid_sp_alterado <- slice(covid_sp_alterado, -c(239661:239666))

# EXCLUIR VÁRIAS LINHAS (POR NOME)
covid_sp_alterado <- covid_sp_alterado %>% filter(municipio!="Ignorado")
View(covid_sp_alterado)







# Verificando valores missing (Ausentes)
# NA = valores ausentes
# NAN = not a number(valores indefinidos)
sapply(covid_sp_alterado, function(x) sum(is.na(x)))
sapply(covid_sp_alterado, function(x) sum(is.nan(x)))


covid_sp_alterado2 <- replace(x = covid_sp_alterado,list = is.na(covid_sp_alterado),
                              values = 54)

covid_sp_alterado2$semana_epidem[covid_sp_alterado2$semana_epidem == 54] <- 2021


#VERIFICAÇÃO DA TIPAGEM DOS ATRIBUTOS (Variáveis)
# EXISTEM 7 TIPOS BÁSICOS:
# character (caracteres)
# integer (números inteiros)
# numeric ou double (números reais)
# logical (falso ou verdadeiro)
# complex (números complexos)
# factor (fator: classes, sequência de valores definidos por níveis)
# date (data)
str(covid_sp_alterado2)
# OU
glimpse(covid_sp_alterado2)

#Transformação da tipagem de atributos
covid_sp_alterado2$semana_epidem <- as.integer(covid_sp_alterado2$semana_epidem)
glimpse(covid_sp_alterado2)

covid_sp_alterado2$data <- as.Date(covid_sp_alterado2$data, format ='%d/%m/%Y')
glimpse(covid_sp_alterado2)



covid_sp_alterado2$semana_epidem[covid_sp_alterado2$data >= "2021-01-01" &
                                   covid_sp_alterado2$data <= "2021-01-07" ] <- 54
View(covid_sp_alterado2)

covid_sp_alterado2$semana_epidem[covid_sp_alterado2$data >= "2021-01-08" &
                                   covid_sp_alterado2$data <= "2021-01-14"  ] <- 55


covid_sp_alterado2$semana_epidem[covid_sp_alterado2$data >= "2021-01-15" &
                                   covid_sp_alterado2$data <= "2021-01-21"  ] <- 56


# Alterar várias variáveis de uma única vez
covid_sp_alterado2[5:8] <- lapply(covid_sp_alterado2[5:8], as.character)
glimpse(covid_sp_alterado2)

covid_sp_alterado2[5:6] <- lapply(covid_sp_alterado2[5:6], as.integer)
glimpse(covid_sp_alterado2)

covid_sp_alterado2[7:8] <- lapply(covid_sp_alterado2[7:8], as.numeric)
str(covid_sp_alterado2)






# Criação de colunas
covid_sp_alterado2["idoso(%)"]<-100*covid_sp_alterado2$pop_60/covid_sp_alterado2$pop
View(covid_sp_alterado2)

#Exportação de arquivos
write.table(covid_sp_alterado2, file ="covid_sp_tratado.txt", sep = ",")


# Opção de exportação de arquivos
install.packages("readr", dependencies = TRUE)
library("readr")
write_delim(covid_sp_alterado2, "covid_sp_tratado.csv", delim = ",")


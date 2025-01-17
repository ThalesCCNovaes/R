#Importação de data frames

setwd("C:/Users/thale/OneDrive/Área de Trabalho/R PROJECTS")

#Arquivo TXT

df1 = read.table("partks.txt") #ler a tabela .txt
df1
View(df1)

#Arquivo CSV
df2 = read.csv("mola.csv") #ler o arquivo csv.
df2
View(df2)


df3 = read.csv("questoes.csv")
View(df3)

df3 = read.csv("questoes.csv", encoding = "latin-1") #Ler na linguagem correta (acentuações podem bugar na tabela)

df3 = read.csv("questoes.csv", encoding = "iso-8859-1")

df3 = read.csv("questoes.csv", encoding = "UTF-8")


#Arquivo EXCEL
install.packages("readxl")
library(readxl)

df4 = read_xlsx("registro.xlsx")
View(df4)








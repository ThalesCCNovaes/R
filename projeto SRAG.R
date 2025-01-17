#Sindrome Respiratoria Aguda Grave SRAG -> 2020

#Carregar pacotes
library(dplyr)
library(rstatix)
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
if(!require(plotly)) install.packages("plotly")
library(plotly)

#Buscar diretorio (pasta com arquivos)

setwd("~/base de dados R/dados-covid-sp-master/data")

#arbir arquivo
srag_sp = read.csv("SRAG_2020.csv", sep = ";")
View(srag_sp)

#Excluir colunas
srag_sp_mod = select(srag_sp, -c(51:133))
srag_sp_mod = select(srag_sp_mod, -c(5:8))
View(srag_sp_mod)


srag_sp_mod = select(srag_sp_mod, -c(6,8))

glimpse(srag_sp_mod)

srag_sp_mod$DT_NOTIFIC = as.Date(srag_sp_mod$DT_NOTIFIC, format = "%m/%d/%y")

#renomeando variaveis (colunas)
srag_sp_mod = rename(srag_sp_mod, sexo = CS_SEXO, idade = NU_IDADE_N)
View(srag_sp_mod)
                     
#Verificando valores missing (ausentes)
#NA = valores ausentes
#NAN = Not a number (valor indefinido)
sapply(srag_sp_mod, function(x) sum(is.na(x))) #soma dos numeros NA
sapply(srag_sp_mod, function(x) sum(is.nan(x))) #soma dos numeros NAN


?graphics
library(help = "graphics")

#grafico de barras
table(srag_sp_mod$sexo)

grafico_barras = table(srag_sp_mod$sexo)
barplot(grafico_barras, col = "yellow", main="Quantidade por sexo") #main = titulo

#com o ggplot2

ggplot(srag_sp_mod, aes(x=sexo))+
  geom_bar(fill = "red")+ labs(titlle="quantidade por sexo",
                               subtitle ="SRAG",
                               x="sexo", y="Contagem")

#Grafico por raça
sapply(srag_sp_mod, function(x) sum(is.na(x)))
sapply(srag_sp_mod, function(x) sum(is.nan(x)))
srag_sp_mod$CS_RACA[which(is.na(srag_sp_mod$CS_RACA))] = 9
View(srag_sp_mod)

#Mudando raça de numero para texto
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 1] = "Branca"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 2] = "Preta"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 3] = "Amarela"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 4] = "Parda"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 5] = "Indigena"
srag_sp_mod$CS_RACA[srag_sp_mod$CS_RACA == 9] = "Ignorado"

#contagem
table(srag_sp_mod$CS_RACA)

grafico_barras=table(srag_sp_mod$CS_RACA)
barplot(grafico_barras, col="yellow", main ="Quantidade por sexo")

#COM O GGPLOT2
ggplot(srag_sp_mod, aes(x = CS_RACA))+
  geom_bar(fill ="red")+ labs(title="Quantidade por raça",
                              subtitle = "SRAG",
                              x = "Raça", y = "Contagem")


#grafico por raça, sexo e região

sapply(srag_sp_mod, function(x) sum(is.na(x)))
srag_sp_mod$CS_ZONA[which(is.na(srag_sp_mod$CS_ZONA))] = 9


srag_sp_mod$CS_ZONA[srag_sp_mod$CS_ZONA == 1] = "Urbana"
srag_sp_mod$CS_ZONA[srag_sp_mod$CS_ZONA == 2] = "Rural"
srag_sp_mod$CS_ZONA[srag_sp_mod$CS_ZONA == 3] = "Periurbana"
srag_sp_mod$CS_ZONA[srag_sp_mod$CS_ZONA == 4] = "Ignorado"

table(srag_sp_mod$CS_ZONA)

ggplot (srag_sp_mod, aes(x=CS_RACA, y=sexo, fill = factor(CS_ZONA)))+
  geom_col(position = "dodge")+
  labs(title = "Região por sexo e raça",
       x = "Raça",
       y = "Sexo",
       fill = "Região")+
  coord_flip()        #mudar a coordenada de vertical para horizontal

#graficos de barras empilhado

grafico = aggregate(idade ~ sexo + CS_ZONA, data=srag_sp_mod, FUN=mean)

ggplot(grafico, aes(x = CS_ZONA, y = idade, fill = factor(sexo)))+
  geom_col(position = "stack")


#grafico com plotly (GRAFICO INTERATIVO)

srag_sp_mod %>% plot_ly(x = ~ CS_RACA) %>%
  layout(xaxis = list(title = "Raça"),
         yaxis = list(title ="Quantidade"))


#boxplot para idade

#idade
srag_sp_mod$idade[srag_sp_mod$TP_idade == 2] = 0
srag_sp_mod$idade[srag_sp_mod$TP_idade == 1] = 0

summary(srag_sp_mod$idade)
boxplot(srag_sp_mod$idade)

srag_sp_mod %>% identify_outliers(idade)
outliers = c(boxplot.stats(srag_sp_mod$idade)$out)
srag_atual = srag_sp_mod[-c(which(srag_sp_mod$idade %in% outliers)),]

summary(srag_atual$idade)
boxplot(srag_atual$idade)

#Com o GGPLOT2
srag_sp_mod %>% filter(!is.na(idade)) %>%
  ggplot(aes(x= " ", y = idade))+
  geom_boxplot(width = .3, outlier.colour = "purple")


srag_sp_mod %>% filter(!is.na(idade)) %>%
  ggplot(aes(x= " ", y = idade))+
  geom_boxplot(width = 2.0, outlier.colour = "red")

#COM PLOTLY
plot_ly(srag_sp_mod, y = srag_sp_mod$idade,
        type = "box") %>%
        layout(title = "BLOXPLOT POR IDADE",
               yaxis = list(title = "idade"))

#BLOXPLOT COLETIVO
par(mfrow=c(1,2)) #Graficos na mesma linha
boxplot(srag_atual$idade, ylab="idade sem outliers")
boxplot(srag_sp_mod$idade, ylab="idade sem outliers")


par(mfrow=c(1,2)) #Graficos 1 linha e 2 colunas
boxplot(idade ~ sexo, srag_atual, ylab="Idade", xlab="Sexo")
boxplot(idade ~ CS_RACA, srag_atual, ylab="Idade", xlab="Raça")

par(mfrow=c(2,2)) #Graficos 1 linha e 2 colunas
boxplot(idade ~ sexo, srag_atual, ylab="Idade", xlab="Sexo")
boxplot(idade ~ CS_RACA, srag_atual, ylab="Idade", xlab="Raça")
boxplot(srag_atual$idade, ylab="idade sem outliers")
boxplot(idade ~ CS_ZONA, srag_atual, ylab="Idade", xlab="Regiao")

par(mfrow=c(1,1))


#GGPLOT2
ggplot(srag_atual, aes(x=factor(sexo), y = idade))+
  geom_boxplot(fill = "dodgerblue")+
  labs(y= "sexo",
       x= "idade",
       title = "Distribuição das idades por sexo")


#COM PLOTLY
plot_ly(srag_atual, y = srag_atual$idade, color = srag_atual$sexo,
        type = "box") %>%
        layout(title = "BOXPLOT POR IDADE")




#HISTOGRAMA PARA IDADE
par(mfrow=c(1,1))
hist(srag_atual$idade, col = "blue", main = "SRAG POR IDADE",
     xlab = "Distribuição das idades", ylab = "Frequência")

hist(srag_atual$idade, probability =T , col="brown")
lines(density(srag_atual$idade), col = "orange")

#criando a função moda
moda = function(m){
  valor_unico = unique(m) #busca o valor unico para a coluna valor
  valor_unico[which.max(tabulate(match(m, valor_unico)))] #tabular (contabilizar quantas vezes o valor unico aparece) e buscar o maior valor
}
moda(srag_atual$idade)

#QQPLOT (GRAFICO DE DISTRIBUIÇÃO NORMAL)
qqnorm(srag_atual$idade, col = "gray")
qqline(srag_atual$idade, col = "red")

library(nortest)
#Teste de normalidade Shapiro-Wilk
shapiro.test(srag_atual$idade)
#OBS: Erro por ser maior que 5000 amostragens 

#Anderson-Darling
ad.test(srag_atual$idade)

#Distribuição não é normal

#COM GGPLOT2
ggplot(data=srag_atual, aes(x=idade))+
  geom_histogram(fill = "red", bins = 25)+ labs(title = "Histograma da idade",
                                                subtitle = "SRAG",
                                                x= "idade", y ="contagem")
#COM O PLOTLY
plot_ly(x = srag_atual$idade, type = "histogram") %>%
  layout(title = "HISTOGRAMA POR IDADE",
         xaxis = list(title = "Idade"),yaxis = list(title = "Quantidade"))



#Grafico de dispersão

plot(srag_atual$DT_NOTIFIC, srag_atual$idade,
     title("Casos de SRAG por mês e por idade"),col = "purple")

scatter.smooth(srag_atual$DT_NOTIFIC, srag_atual$iidade)

# COM O GGPLOT2 (2 variaveis)
ggplot(srag_atual, aes(x= DT_NOTIFIC, y = idade))+
  geom_point()+
  labs(title = "Relação data de notificação e idade",
       x= "Data de notificação",
       y= "Idade")














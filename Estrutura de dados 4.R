#Esturura de dados - Listas e DATA FRAME

#É uma tabela de dados onde cada linha representa um registros e as colunas
#representam os atributos ou variaveis.
#Pode ter numeros e caracteres juntos (essa é a principal diferença com relação a matrizes)

mes_numero = c(1,2,3,4,5,6,7,8,9,10,11,12)
mes_nome= c("janeiro","fevereiro","março","abril","maio","junho",
              "julho","agosto","setembro","outrubro","novembro","dezembro")
ano = c(2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021)
data.frame(mes_numero,mes_nome,ano)

data.frame = data.frame(mes_numero,mes_nome,ano)
data.frame
View(data.frame) #ver a tabela criada

#Data frame pertencente ao R
df <- mtcars #df = date frame 
df
VieW(mtcars)

df2 = airquality
df2
View(airquality)

?airquality #? = perguntar algo nativo do R, por exemplo, essa base que ai está
?datasets #bases de dados do R

library(help = "datasets") #Informação sobre o pacote ‘datasets’

df3 = iris
View(df3)

nrow(df3)
ncol(df3)
dim(df3)
summary(df3)
 
#Listas#

#Podem conter elementos de diferentes tipos (tipo especial de vetor)

nome = c("Luciano","Pedro","Joyce","Maria")
idade = c(46,38,27,29)
curso = c("Estatistica","Linguagem R","Redes Neurais","Python")
lista = list(nome,idade,curso)
lista

#objeto da lista, basta colocar entre colchetes
lista[2]

#nomeando os termos da lista
lista2 = list(nome=c("Luciano","Pedro","Joyce","Maria"),
              idade = c(46,38,27,29),
              curso = c("Estatistica","Linguagem R","Redes Neurais","Python")
              )
lista2

lista2[3] #Terceiro elemento incluido na lista = Curso










































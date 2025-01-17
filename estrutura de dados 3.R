#Estrutura de Dados MATRIZES


#conjunto ,de regostros com linhas e colunas
#CONTENDO APENAS NUMEROS OU APENAS CARACTERES 

matriz = matrix(c(1,5,10,30,15,8),nrow=3,ncol=2,byrow=TRUE) #NROW= Nº LINHAS; NCOL = Nº COLUNA; BYROW = POR LINHA; TRUE = PARA PREENCHER COM ALGO AS LINHAS
matriz

matriz = matrix(c(4,8,23,33,11,93),nrow=3,ncol=2,byrow=FALSE)
matriz

#TRUE = LINHA A LINHA
#FALSE = COLUNA POR COLUNA

matriz = matrix(c(4,8,23,33,11,93),nrow=2,ncol=3,byrow=TRUE)
matriz

matriz [2,2] #achar o elemento da nrow2 da ncol2


vetorA = c(2,5,8)
vetorB = c(3,6,9)
matriz2 = rbind(vetorA,vetorB) #rbind = ligar vetorA e vetorB
matriz2 #dois vetores se tornaram 1 matriz

matriz3= matrix(2:9, ncol=2) #gerar matriz de intervalo de 2 a 9 com 2 colunas
matriz3

dim(matriz3)#dimensao da matriz
nrow(matriz3)#nº de linhas
ncol(matriz3)#nº de colunas

#nomear linhas e colunas
dimnames(matriz3) = list(c("Linha1","Linha2","linha3","linha4"),
                        c("coluna1","coluna2"))
matriz3
                          

matriz4=matrix(2:13,nrow=4,byrow=TRUE,
               dimnames = list(c("Linha1","Linha2","linha3","linha4"),
                               c("coluna1","coluna2","coluna3"))
)
matriz4

matriz4=matrix(2:13,nrow=4,byrow=FALSE,
               dimnames = list(c("Linha1","Linha2","linha3","linha4"),
                               c("coluna1","coluna2","coluna3"))
)

#Calculo de matriz

produto = 2*matriz4  #valores de matriz4 multiplicados por 2
produto


matriz5 = matrix(c(1,5,15,8),nrow=2,ncol=2,byrow=TRUE)
matriz5
matriz6 = matrix(c(2,4,6,10),nrow=2,ncol=2,byrow=TRUE)
matriz6

soma = matriz5+matriz6
soma

subtracao = matriz5-matriz6
subtracao


#Multiplicação Matricial

produto_matriz = matriz5 %*% matriz6 # %*% = operador para multiplicar matriz linha a linha coluna a coluna
produto_matriz

#Média das linhas ou Colunas
matriz5 = matrix(c(1,5,15,8), nrow=2, ncol=2, byrow=TRUE)
matriz5

media_coluna = colMeans(matriz5) #media da coluna
media_coluna

media_linha = rowMeans(matriz5) #media da linha
media_linha

soma_colunas = colSums(matriz5)
soma_colunas

soma_linhas = rowSums(matriz5)
soma_linhas

#Matriz com caracteres
matriz7= matrix(c("Segunda","Terça","Quarta","Quinta"),nrow=2,ncol=2,byrow=TRUE)
matriz7














#Estrutura de dados e vetores

# sequencia de valores numericos ou caracteres

vetor = c(1,2,3,4,5,6,7); #c = concatenar os numeros a frente na variável Vetor
length(vetor)

dias = c("SEGUNDA","TERÇA","QUARTA","QUINTA","SEXTA","SABADO","DOMINGO")
length(dias)

juntar = c(vetor,dias)
juntar
class(juntar)


gastos_dia = c(100,300,50,900,300,150,320)
ordem_crescente = sort(gastos_dia)
total = sum(gastos_dia)
min(gastos_dia) #descreve o min, sem atribuir a variavel
max(gastos_dia) #descreve o max, sem atribuir a variavel
minimo = min(gastos_dia) #descreve o min, atribuindo a variavel
maximo = max(gastos_dia) #descreve o max, atribuindo a variavel


mean(gastos_dia) #mean = média

limite = (gastos_dia <=300)
limite


intervalo = (3:8) #criando vetor de 3 a 8 (1,2,3,4,5,6,7,8)
intervalo

passo = seq(2,40,by=5) #sequencia de 2 a 40, subindo de 5 em 5
passo

repeticao = rep(2,8) #repetir o numero 2 em 8 vezes
repeticao

repeticao_multipla = rep(c(3,5),c(4,6)) #Recebe ambas as multiplicações, executando 3 cinco vezes e 4 seis vezes
repeticao_multipla

#each = cada
repeticao_programada = rep(3:5, each=3) #repete 3x os valores do intervalo (no caso, de 3 a 5)
repeticao_programada

repeticao_programada_2 = rep(3:6,3) #repete a sequencia de 3 a 6 três vezes
repeticao_programada_2

vetor2 = c(2,4,6,8,10,12)
vetor3 = c(vetor2,14) #recebe o vetor de cima (vetor2) + o 14
vetor3

vetor3 = as.interger(vetor3) #converter vetor inteiro no tipo de variavel

vetor4 = c(vetor3,"pares")
vetor4
class(vetor4)

posicao = vetor3[2] #printar a posicao especifica do vetor
posicao

posicao_inexistente = vetor2[7]
posicao_inexistente

posicao_excluida = vetor2[-3]
posicao_excluida



















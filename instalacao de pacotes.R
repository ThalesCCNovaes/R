#Instalação e carregamento de pacotes no R

# o R possui pacotes basicos ja baixados e carregados
# Tem pacotes já baixados, mas que devem ser carregados (pacotes recomendados)
# Possui pacotes para serem baixados e carregados (pacotes contribuidos)


# https://cran.rstudio.com/

install.packages("argo")

library(argo)

?argo

#BAIXAR PACOTES, CASO ELES AINDA NAO ESTEJAM BAIXADOS
if(!require(argo)) install.packages("argo")

#CARREGAR PACOTES
library(argo)

#REMOVER PACOTES
remove.packages()

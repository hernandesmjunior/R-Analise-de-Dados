
### DADOS DE FUNCION�RIOS DE UMA COMPANHIA

require(dplyr)

dados <- read.csv("CompanhiaMB.csv", header=TRUE)

View(dados)

df <- data.frame(dados)

# representa��o de vari�veis qualitativas


# representa��o tabular

tab = table(df$estado_civil)
tab


tab.rel = table(df$estado_civil)/sum(tab)
tab.rel


tab = table(df$instrucao)
tab


tab.rel = table(df$instrucao)/sum(tab)
tab.rel


# gr�fico padr�o do R

barplot(tab, col=c('red','pink','purple'), main='Gr�fico de barras de grau de instru��o')



# gr�fico de pareto

install.packages("qicharts2")

require(qicharts2)


paretochart(df$instrucao, title='Gr�fico de Pareto de grau de instru��o')



# gr�fico de setores

pie(tab, main='Gr�fico de setores para grau de instru��o')



# pacote tidyverse

install.packages("tidyverse")

require(tidyverse)


ggplot(data=df) + 
        geom_bar(mapping=aes(x=estado_civil, fill=estado_civil)) 



ggplot(data=df) +
  geom_bar(mapping=aes(x=instrucao, fill=instrucao))



ggplot(data=df) +
  geom_bar(mapping=aes(x=regiao, fill=regiao)) +
  labs(title='Gr�fico de barras de regi�o')


ggplot(data=df) + 
  geom_boxplot(
    mapping=aes(y=salario, x=estado_civil, fill=estado_civil)) +
  labs(title='Sal�rios por estado civil')
  


# basic piechart

ggplot(data=df,aes(x="", y='estado civil', fill=estado_civil)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  labs(title='Gr�fico de setores de estado civil') +
  theme_void()
  


















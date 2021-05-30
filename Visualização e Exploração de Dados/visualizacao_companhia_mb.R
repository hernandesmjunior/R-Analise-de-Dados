
### DADOS DE FUNCIONÁRIOS DE UMA COMPANHIA

require(dplyr)

dados <- read.csv("CompanhiaMB.csv", header=TRUE)

View(dados)

df <- data.frame(dados)

# representação de variáveis qualitativas


# representação tabular

tab = table(df$estado_civil)
tab


tab.rel = table(df$estado_civil)/sum(tab)
tab.rel


tab = table(df$instrucao)
tab


tab.rel = table(df$instrucao)/sum(tab)
tab.rel


# gráfico padrão do R

barplot(tab, col=c('red','pink','purple'), main='Gráfico de barras de grau de instrução')



# gráfico de pareto

install.packages("qicharts2")

require(qicharts2)


paretochart(df$instrucao, title='Gráfico de Pareto de grau de instrução')



# gráfico de setores

pie(tab, main='Gráfico de setores para grau de instrução')



# pacote tidyverse

install.packages("tidyverse")

require(tidyverse)


ggplot(data=df) + 
        geom_bar(mapping=aes(x=estado_civil, fill=estado_civil)) 



ggplot(data=df) +
  geom_bar(mapping=aes(x=instrucao, fill=instrucao))



ggplot(data=df) +
  geom_bar(mapping=aes(x=regiao, fill=regiao)) +
  labs(title='Gráfico de barras de região')


ggplot(data=df) + 
  geom_boxplot(
    mapping=aes(y=salario, x=estado_civil, fill=estado_civil)) +
  labs(title='Salários por estado civil')
  


# basic piechart

ggplot(data=df,aes(x="", y='estado civil', fill=estado_civil)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  labs(title='Gráfico de setores de estado civil') +
  theme_void()
  


















#R Estatística Descritiva
#
#Uma boa forma de iniciar uma análise descritiva adequada é verificar os tipode de variáveis disponíveis. Variáveis podem ser classificadas da seguinte forma:
#

#qualitativas (Nom)
#nominais
#Exemplos:Sexo, cor dos olhos, fumante/não fumante e doente/sadio e dicotômicas(casado ou solteiro)

install.packages(c("scales","tidyverse"))
require(ggplot2)
require(dplyr)
require(scales)
require(plotly)
require(gridExtra)

sexo=c("M","F")
cor=c("Preto","Castanho","Azul","Verde")
cigarro=c("Fumante","Não Fumante")
doente=c("Doente","Sadio")
estado_civil=c("Solteiro(a)","Casado(a)")

a_sexo=sample(sexo,size=100, replace=TRUE)
a_cor_olhos=sample(cor,size=100, replace=TRUE)
a_fumante=sample(cigarro,size=100, replace=TRUE)
a_doente=sample(doente,size=100, replace=TRUE)
a_estado_civil=sample(estado_civil,size=100, replace=TRUE)
a_dummy_estado_civil=ifelse(a_estado_civil=="Solteiro(a)","1","0")

variaveis_categoricas_nominais=data.frame(a_sexo,
                                          a_cor_olhos,
                                          a_fumante,
                                          a_doente,
                                          a_estado_civil,
                                          a_dummy_estado_civil)
variaveis_categoricas_nominais

View(variaveis_categoricas_nominais)

#ggplot geral
#Elementos de um gráfico ggplot

#1. Base de dados que será utilizada
#2. Geometria que será utilizada (Tipo de gráfico)
#3. Aesthetic mapping (A parte estética do gráfico, eixos, cores,tamanhos,textos)- Depende da geometria(tipo de gráfico) Escolhido
#4. Escala (formato, unidade de medida)
#5. Rótulos, títulos legendas, etc..

#Gráfico de Colunas ou barras verticais
grafico_coluna_geral=ggplot(variaveis_categoricas_nominais,aes(a_cor_olhos)) + 
  geom_bar(position = "dodge",fill="red") +
  ggtitle("Número de alunos por cor dos olhos")+
  xlab("Cor dos olhos") +
  ylab("Frequência simples (Quantidade de alunos)") 
  
ggplotly(grafico_coluna_geral)

#Gráfico de Colunas ou barras verticais por sexo
grafico_coluna=ggplot(variaveis_categoricas_nominais,aes(a_cor_olhos,fill=a_sexo)) + 
               geom_bar(position = "dodge") +
               ggtitle("Número de alunos por cor dos olhos e sexo")+
               labs(fill="Sexo")+
               xlab("Cor dos olhos") +
               ylab("Frequência simples (Quantidade de alunos)") 
               
ggplotly(grafico_coluna)

#Gráfico de Colunas ou barras verticais (%)
grafico_coluna_porcent=ggplot(variaveis_categoricas_nominais,aes(a_cor_olhos,fill=a_sexo)) + 
  geom_bar(position = "dodge",aes(y = (..count..)/sum(..count..))) +
  ggtitle("Número de alunos por cor dos olhos e sexo (%)")+
  scale_y_continuous(labels=percent)+
  labs(fill="Sexo")+
  xlab("Cor dos olhos") +
  ylab("Frequência simples (Quantidade de alunos)")

ggplotly(grafico_coluna_porcent)

#Gráfico de Colunas ou barras verticais empilhadas (%)
grafico_colunas_empilhadas=ggplot(variaveis_categoricas_nominais,aes(a_cor_olhos,fill=a_sexo)) + 
  geom_bar(position = 'fill') +
  ggtitle("Número de alunos por cor dos olhos e sexo")+
  scale_y_continuous(labels=percent) +
  labs(fill="Sexo")+
  xlab("Cor dos olhos") +
  ylab("Frequência simples (Quantidade de alunos)")

ggplotly(grafico_colunas_empilhadas)

#Gráfico de barras horizontais
grafico_barras_horizontais=grafico_coluna + coord_flip() 

ggplotly(grafico_barras_horizontais)

#Gráfico de barras horizontais por Sexo
grafico_barras_horizontais_por_sexo=grafico_coluna + coord_flip() + facet_grid(~a_sexo)

ggplotly(grafico_barras_horizontais_por_sexo)

grid.arrange(grafico_coluna_geral,
             grafico_coluna,
             grafico_coluna_porcent,
             grafico_barras_horizontais,
             grafico_barras_horizontais_por_sexo,
             grafico_colunas_empilhadas, nrow=3,ncol=2)


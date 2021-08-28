#R Estatística Descritiva

#Qualitativas ordinais
#Classe social, grau de instrução e estágio
#da doença. 
classe_social=c("A","B","C","D","E")
grau_instrucao=c("Ensino fundamental","Ensino médio","Ensino Superior")
estagio_doenca=c("Estágio inicial","Estágio intermediário","Estágio terminal")
meses=c("Janeiro","Fevereiro","março")
ranking=c("Primeiro","Segundo","Terceiro")

a_classe_social=sample(classe_social,size=100, replace=TRUE)
a_grau_intrucao=sample(grau_instrucao,size=100, replace=TRUE)
a_estagio_doenca=sample(estagio_doenca,size=100, replace=TRUE)
a_meses=sample(meses,size=100, replace=TRUE)
a_ranking=sample(ranking,size=100, replace=TRUE)

variaveis_categoricas_ordinais=data.frame(a_classe_social,
                                          a_grau_intrucao,
                                          a_estagio_doenca,
                                          a_meses,a_ranking)
variaveis_categoricas_ordinais
View(variaveis_categoricas_ordinais)

#pizza frequência simples
df_pizza_tab=table(variaveis_categoricas_ordinais$a_classe_social)
df_pizza=as.data.frame(df_pizza_tab)
df_pizza

pie(df_pizza$Freq,
    labels=paste(df_pizza$Var1,df_pizza$Freq),
     main="Gráfico de pizza do número de pessoas por classe social")

#pizza frequência relativa
df_pizza_porcent=prop.table(df_pizza_tab)
df_pizza_porcent=as.data.frame(df_pizza_porcent)
df_pizza_porcent

pie(df_pizza_porcent$Freq,
    labels=paste(df_pizza_porcent$Var1,df_pizza_porcent$Freq*100,"%"),
     main="Gráfico de pizza - Frequência relativa classe social (%)")

grafico_pizza_iterativo = plot_ly(df_pizza, 
             labels = ~Var1, 
             values = ~Freq, 
             type = 'pie') %>%
             layout(title = 'Frequência relativa da Classe Social (%) ')

grafico_pizza_iterativo


#ggplot geral
#Elementos de um gráfico ggplot

#1. Base de dados que será utilizada
#2. Aesthetic mapping (A parte estética do gráfico, eixos, cores,tamanhos,textos)- Depende da geometria(tipo de gráfico) Escolhido
#3. Geometria que será utilizada (Tipo de gráfico)
#4. Escala (formato, unidade de medida)
#5. Rótulos, títulos legendas, etc..

#Gráfico de Colunas ou barras verticais
grafico_coluna=ggplot(variaveis_categoricas_ordinais,aes(x=a_classe_social)) + 
  geom_bar(position = "dodge") +
  ggtitle("Número de pessoas por classe social")+
  xlab("Classe social") +
  ylab("Número de pessoas (Frequência simples)")

ggplotly(grafico_coluna)

#Gráfico de Colunas ou barras verticais com frequência relativa
grafico_coluna_porcent=ggplot(variaveis_categoricas_ordinais,aes(x=a_classe_social)) + 
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  ggtitle("Número de pessoas por classe social") +
  scale_y_continuous(labels=percent) +
  xlab("Classe social") +
  ylab("Proporção de pessoas % (Frequência Relativa)")

ggplotly(grafico_coluna_porcent)

#Gráfico de Colunas ou barras verticais empilhadas com frequência relativa e grau de instrução
grafico_coluna_empilhada=ggplot(variaveis_categoricas_ordinais,aes(x=a_classe_social,fill=a_grau_intrucao)) + 
  geom_bar(position = 'fill',show.legend = FALSE) +
  ggtitle("Número de pessoas por classe social")+
  scale_y_continuous(labels=percent) +
  xlab("Classe social") +
  ylab("Proporção de pessoas % (Frequência Relativa)")

ggplotly(grafico_coluna_empilhada)

#Gráfico de Colunas ou barras verticais com frequência relativa por grau de instrução
grafico_coluna_porcent_por_grau_instrucao=ggplot(variaveis_categoricas_ordinais,aes(x=a_classe_social,fill=a_grau_intrucao)) + 
  geom_bar(aes(y = (..count..)/sum(..count..)),show.legend = FALSE) +
  ggtitle("Número de pessoas por classe social") +
  scale_y_continuous(labels=percent) +
  xlab("Classe social") +
  ylab("Número de pessoas (Frequência simples)") +
  facet_grid(~a_grau_intrucao)

ggplotly(grafico_coluna_porcent_por_grau_instrucao)

grid.arrange(grafico_coluna,
             grafico_coluna_porcent, 
             grafico_coluna_porcent_por_grau_instrucao,
             grafico_coluna_empilhada, 
             nrow=2,ncol=2 )












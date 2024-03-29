#R Estat�stica Descritiva

#Qualitativas ordinais
#Classe social, grau de instru��o e est�gio
#da doen�a. 
classe_social=c("A","B","C","D","E")
grau_instrucao=c("Ensino fundamental","Ensino m�dio","Ensino Superior")
estagio_doenca=c("Est�gio inicial","Est�gio intermedi�rio","Est�gio terminal")
meses=c("Janeiro","Fevereiro","mar�o")
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

#pizza frequ�ncia simples
df_pizza_tab=table(variaveis_categoricas_ordinais$a_classe_social)
df_pizza=as.data.frame(df_pizza_tab)
df_pizza

pie(df_pizza$Freq,
    labels=paste(df_pizza$Var1,df_pizza$Freq),
     main="Gr�fico de pizza do n�mero de pessoas por classe social")

#pizza frequ�ncia relativa
df_pizza_porcent=prop.table(df_pizza_tab)
df_pizza_porcent=as.data.frame(df_pizza_porcent)
df_pizza_porcent

pie(df_pizza_porcent$Freq,
    labels=paste(df_pizza_porcent$Var1,df_pizza_porcent$Freq*100,"%"),
     main="Gr�fico de pizza - Frequ�ncia relativa classe social (%)")

grafico_pizza_iterativo = plot_ly(df_pizza, 
             labels = ~Var1, 
             values = ~Freq, 
             type = 'pie') %>%
             layout(title = 'Frequ�ncia relativa da Classe Social (%) ')

grafico_pizza_iterativo


#ggplot geral
#Elementos de um gr�fico ggplot

#1. Base de dados que ser� utilizada
#2. Aesthetic mapping (A parte est�tica do gr�fico, eixos, cores,tamanhos,textos)- Depende da geometria(tipo de gr�fico) Escolhido
#3. Geometria que ser� utilizada (Tipo de gr�fico)
#4. Escala (formato, unidade de medida)
#5. R�tulos, t�tulos legendas, etc..

#Gr�fico de Colunas ou barras verticais
grafico_coluna=ggplot(variaveis_categoricas_ordinais,aes(x=a_classe_social)) + 
  geom_bar(position = "dodge") +
  ggtitle("N�mero de pessoas por classe social")+
  xlab("Classe social") +
  ylab("N�mero de pessoas (Frequ�ncia simples)")

ggplotly(grafico_coluna)

#Gr�fico de Colunas ou barras verticais com frequ�ncia relativa
grafico_coluna_porcent=ggplot(variaveis_categoricas_ordinais,aes(x=a_classe_social)) + 
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  ggtitle("N�mero de pessoas por classe social") +
  scale_y_continuous(labels=percent) +
  xlab("Classe social") +
  ylab("Propor��o de pessoas % (Frequ�ncia Relativa)")

ggplotly(grafico_coluna_porcent)

#Gr�fico de Colunas ou barras verticais empilhadas com frequ�ncia relativa e grau de instru��o
grafico_coluna_empilhada=ggplot(variaveis_categoricas_ordinais,aes(x=a_classe_social,fill=a_grau_intrucao)) + 
  geom_bar(position = 'fill',show.legend = FALSE) +
  ggtitle("N�mero de pessoas por classe social")+
  scale_y_continuous(labels=percent) +
  xlab("Classe social") +
  ylab("Propor��o de pessoas % (Frequ�ncia Relativa)")

ggplotly(grafico_coluna_empilhada)

#Gr�fico de Colunas ou barras verticais com frequ�ncia relativa por grau de instru��o
grafico_coluna_porcent_por_grau_instrucao=ggplot(variaveis_categoricas_ordinais,aes(x=a_classe_social,fill=a_grau_intrucao)) + 
  geom_bar(aes(y = (..count..)/sum(..count..)),show.legend = FALSE) +
  ggtitle("N�mero de pessoas por classe social") +
  scale_y_continuous(labels=percent) +
  xlab("Classe social") +
  ylab("N�mero de pessoas (Frequ�ncia simples)") +
  facet_grid(~a_grau_intrucao)

ggplotly(grafico_coluna_porcent_por_grau_instrucao)

grid.arrange(grafico_coluna,
             grafico_coluna_porcent, 
             grafico_coluna_porcent_por_grau_instrucao,
             grafico_coluna_empilhada, 
             nrow=2,ncol=2 )












# EXPLORA��O E AN�LISE DE DADOS


# CARREGAR PACOTES


library(dplyr)
if(!require(rstatix)) install.packages("rstatix") 
library(rstatix)



# BUSCAR DIRET�RIO (PASTA COM OS ARQUIVOS)

setwd("C:/Users/Luciano/Desktop/Linguagem_R/dados-covid-sp-master/data")



# ABRIR ARQUIVO

covid_sp_tratado <- read.csv2('covid_sp_tratado.csv', sep = ";", encoding="UTF-8")
View(covid_sp_tratado)

covid_sp_tratado <- read.csv2('covid_sp_tratado.csv', sep = ",")
View(covid_sp_tratado)

glimpse(covid_sp_tratado)

covid_sp_tratado <- read.csv('covid_sp_tratado.csv', sep = ",")
View(covid_sp_tratado)

glimpse(covid_sp_tratado)

covid_sp_tratado$data <- as.Date(covid_sp_tratado$data, format ='%Y-%m-%d')
glimpse(covid_sp_tratado)

covid_sp_tratado$idoso <- as.numeric(covid_sp_tratado$idoso)
glimpse(covid_sp_tratado)



# Excluir coluna idoso(%)

covid_sp_tratado <- select(covid_sp_tratado, -c(18))



# Renomeando a coluna idoso

covid_sp_tratado <- rename(covid_sp_tratado, porcentagem_idoso = idoso)






# Filtro por linha (cidade)

# campinas

covid_campinas <- covid_sp_tratado %>% filter(municipio=="Campinas")
View(covid_campinas)

covid_campinas["dens_demografica"] <- covid_campinas$pop/covid_campinas$area
View(covid_campinas)

covid_campinas["area"] <- covid_campinas$area/100

covid_campinas["dens_demografica"] <- covid_campinas$pop/covid_campinas$area
View(covid_campinas)



# Guarulhos

covid_guarulhos <- covid_sp_tratado[which(covid_sp_tratado$municipio=="Guarulhos"), ]

covid_guarulhos["area"] <- covid_guarulhos$area/100

covid_guarulhos["dens_demografica"] <- covid_guarulhos$pop/covid_guarulhos$area
View(covid_guarulhos)








# AN�LISES ESTAT�STICAS

# medidas de centralidade

# m�dia
mean(covid_campinas$obitos_novos)
mean(covid_campinas$casos_novos)

summarise_at(covid_campinas, vars(obitos_novos, casos_novos), mean)

mean(covid_guarulhos$obitos_novos)
mean(covid_guarulhos$casos_novos)

# m�dia m�vel
plot(covid_campinas$data,covid_campinas$casos_mm7d, title("M�DIA M�VEL"), col = "red")
plot(covid_campinas$data,covid_campinas$obitos_mm7d, title("M�DIA M�VEL"), col = "purple")




# mediana
median(covid_campinas$obitos_novos)
median(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), median)

median(covid_guarulhos$obitos_novos)
median(covid_guarulhos$casos_novos)


# Moda

# criando uma fun��o
moda <- function(m) {
  valor_unico <- unique(m) #Busca o valor �nico para a coluna.
  valor_unico[which.max(tabulate(match(m, valor_unico)))] #tabular (contabilizar quantas vezes o valor �nico aparece) e buscar o maior valor
}

# obten��o da moda
moda(covid_campinas$obitos_novos)
moda(covid_campinas$casos_novos)

summarise_at(covid_campinas, vars(obitos_novos, casos_novos), moda)

moda(covid_guarulhos$obitos_novos)
moda(covid_guarulhos$casos_novos)




covid_julho_campinas <- covid_campinas %>% filter(mes==7)
moda(covid_julho_campinas$obitos_novos)
moda(covid_julho_campinas$casos_novos)
summarise_at(covid_julho_campinas, vars(obitos_novos, casos_novos), moda)

mean(covid_julho_campinas$obitos_novos)
mean(covid_julho_campinas$casos_novos)

# histograma

hist(covid_julho_campinas$obitos_novos, col="blue")
hist(covid_julho_campinas$casos_novos, col="red")

hist(covid_campinas$obitos_novos, col="blue")
hist(covid_campinas$casos_novos, col="red")

hist(covid_guarulhos$obitos_novos, col="green")
hist(covid_guarulhos$casos_novos, col="yellow")






# Medidas de posi��o

# m�nimo
min(covid_campinas$obitos_novos)
min(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), min)

min(covid_guarulhos$obitos_novos)
min(covid_guarulhos$casos_novos)




# m�ximo
max(covid_campinas$obitos_novos)
max(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), max)

max(covid_guarulhos$obitos_novos)
max(covid_guarulhos$casos_novos)



# amplitude Total

range(covid_campinas$obitos_novos)
range(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), range)

range(covid_guarulhos$obitos_novos)
range(covid_guarulhos$casos_novos)



# quartis

quantile(covid_campinas$obitos_novos)
quantile(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), quantile)

quantile(covid_guarulhos$obitos_novos)
quantile(covid_guarulhos$casos_novos)



# amplitude Interquartil

IQR(covid_campinas$obitos_novos)
IQR(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), IQR)

IQR(covid_guarulhos$obitos_novos)
IQR(covid_guarulhos$casos_novos)




summary(covid_campinas$obitos_novos)
summary(covid_campinas$casos_novos)

summary(covid_guarulhos$obitos_novos)
summary(covid_guarulhos$casos_novos)


# boxplot

summary(covid_julho_campinas$obitos_novos)
boxplot(covid_julho_campinas$obitos_novos)

summary(covid_julho_campinas$casos_novos)
boxplot(covid_julho_campinas$casos_novos)

summary(covid_campinas$casos_novos)
boxplot(covid_campinas$casos_novos)

summary(covid_guarulhos$casos_novos)
boxplot(covid_guarulhos$casos_novos)

# Tratando os outliers

# identificando e excluindo todos os outliers

covid_guarulhos %>% identify_outliers(casos_novos)

outliers = c(boxplot.stats(covid_guarulhos$casos_novos)$out)

covid_guarulhos_sem_outliers <- covid_guarulhos[-c(which(covid_guarulhos$casos_novos %in% outliers)),  ]

boxplot(covid_guarulhos_sem_outliers$casos_novos)


# excluindo alguns outliers

covid_campinas %>% identify_outliers(casos_novos)
covid_campinas_sem_outliers<-covid_campinas %>% filter(data != "2020-06-19")

boxplot(covid_campinas_sem_outliers$casos_novos)


# O summary resulta em resumo estat�stico
# de todas as vari�veis num�ricas/inteiras
summary (covid_guarulhos)





# Medidas de Dispers�o

# vari�ncia


var(covid_campinas$obitos_novos)
var(covid_campinas$casos_novos)

var(covid_guarulhos$obitos_novos)
var(covid_guarulhos$casos_novos)

var(covid_julho_campinas$obitos_novos)
var(covid_julho_campinas$casos_novos)



# desvio padr�o

sd(covid_campinas$obitos_novos)
sd(covid_campinas$casos_novos)

sd(covid_guarulhos$obitos_novos)
sd(covid_guarulhos$casos_novos)

sd(covid_julho_campinas$obitos_novos)
sd(covid_julho_campinas$casos_novos)









# TESTES DE NORMALIDADE

# Existem 4 testes de normalidade principais (num�ricos) e dois testes gr�ficos:
# Shapiro-Wilk (limite de 5000 amostras)
# Anderson-Darling
# Kolmogorov_Smirnov
# Cramer-Von Mises
# Histograma
# QQplot

# N�vel de signific�ncia DE 0,05(5%) ou n�vel de confian�a de 95%(MAIS UTILIZADO):
# Quando o par�metro p > 0,05 (distribui��o normal).


if(!require(nortest)) install.packages("nortest")
library(nortest)

# histograma

hist(covid_campinas$casos_novos, probability=T, col="blue")
lines(density(covid_campinas$casos_novos) , col="red")

# grafico de distribui��o

qqnorm(covid_campinas$casos_novos)
qqline(covid_campinas$casos_novos)

# shapiro-wilk

shapiro.test(covid_campinas$casos_novos)

# anderson darling

ad.test(covid_campinas$casos_novos)

# kolmogorovsmirnov

ks.test(covid_campinas$casos_novos, pnorm)

lillie.test(covid_campinas$casos_novos)

# cramer von mises

cvm.test(covid_campinas$casos_novos)


# CORRELA��O LINEAR
# "pearson" para dados param�tricos(normalidade e homocedasticidade))
# "spearman" (volume grande de dados n�o param�tricos)
# "kendall" (volume pequeno de dados n�o param�tricos)

plot(covid_campinas$casos,covid_campinas$obitos)
cor(covid_campinas$casos,covid_campinas$obitos,method = "spearman")

regressao <- lm(formula= obitos ~ casos, data=covid_campinas) #modelo de regress�o
regressao$coefficients
summary(regressao)


# Equa��o: obitos=51.67+0,0337*casos
# Coeficiente de determina��o (ajustado): 0,9832



# GR�FICO DE LINHA 

if(!require(ggplot2)) install.packages("ggplot2") 
library(ggplot2)
if(!require(ggpubr)) install.packages("ggpubr") #equa��o da reta no gr�fico
library(ggpubr)

ggplot(data = covid_campinas, mapping = aes(x = casos, y = obitos)) +
  geom_point() +
  ggtitle("Regress�o linear do n�mero de �bitos causados pela COVID-19 na cidade de Campinas/SP") +
  geom_smooth(method = "lm", col = "red") +
  stat_regline_equation(aes(label = paste(..eq.label.., ..adj.rr.label..,
                            sep = "*plain(\" ,   \")~~")), label.x = 15000,
                            label.y = 1800) +
  theme_gray()








### REPRESENTAÇÃO DE DADOS QUANTITATIVOS


install.packages('plotrix')

library(plotly)
library(ggplot2)
library(plotrix)

# temperaturas observadas em uma cidade

temp <- c(11.4,13,13.2,13.4,14.1,14.4,15.3,15.5,
          15.6,15.8,16,16.2,16.2,16.6,16.7,16.7,
          17.1,17.2,17.4,17.5,17.6,17.7,18.5,19.4)


hist(temp, breaks=8)


# representação dos dados

hist(temp, col='lightgreen', main='Histograma de X')


temp1=data.frame(temp)


plot_ly(data=temp1, x=~temp, type='histogram')


plot_ly(data=temp1, x=~temp, type='box')



# boxplot

idades <- c(16,18,20,20,21,21,23,25,25,40)

boxplot(idades, col='coral')

idades_df <- data.frame(idades)

# boxplot com plotly


plot_ly(data=idades_df, y=~idades, type='box')


###################################################

# leitura dos dados da Companhia MB

dados <- read.csv('CompanhiaMB.csv', header=T)


View(dados)

df <- data.frame(dados)


# histograma e boxplot com ggplot2

ggplotly(
  
ggplot(data=df)+
  geom_boxplot(aes(y=salario,x=estado_civil, fill=estado_civil)) +
  labs(title='Salários em relação ao estado civil')

)

ggplotly(

ggplot(data=df) +
  geom_histogram(aes(x=salario), fill='lightblue', bins=8, col='black')+
  labs(title='Histograma de salários')

)

###################################################

# gráfico de linhas verticais

x <- c(5,2,4,5,4,4,1,4,5,5,1,2,1,5,3,5,5,5,5,4)

n <- length(x)

freq_abs = table(x)
freq_rel = (freq_abs/ n) *100


plot(freq_abs, type='h',pch=20, xlab='Notas do Produto')



# gráfico de barras

barplot(freq_abs, main='Gráfico debarras para notas',col='lightblue')


# gráfico de pontos


dotplot.mtb(x, main='Notas do produto comestível')


data <- as.data.frame(x)

ggplot(data=data) +
  geom_dotplot(aes(x=x), binwidth=0.5, fill='lightblue') +
  labs(title='Gráfico de pontos para as notas',
       x='Notas',
       y='Frequência')


###################################################

# histograma


x = as.vector(co2)


hist(x, col='coral', main='Histograma de CO2')
hist(x, right=F,freq=F)
hist(x, right=F,freq=F, main='', xlab=expression(CO[2](ppm)), ylab='Densidade')


par(mfrow=c(2,2))


hist(x, right=F,freq=F,breaks=30,col='coral')
hist(x, right=F,freq=F,breaks=19,col='lightgreen')
hist(x, right=F,freq=F,breaks=30,col='purple')
hist(x, right=F,freq=F,breaks=30,col='orange')



###################################################

# gráfico de linha


par(mfrow=c(1,1))


class(AirPassengers)

plot(AirPassengers, col='Blue', lwd=2)








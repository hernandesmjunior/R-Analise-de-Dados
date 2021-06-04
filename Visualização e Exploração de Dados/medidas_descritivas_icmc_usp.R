### MEDIDAS DESCRITIVAS DE DADOS QUANTITATIVOS

# considerando o conjunto de dados

x <- c(15,23,30,16,10,15,14,11,10,25,26,26,30,41,40,54,32,20,74,29,50,90,1,13,65,4,12,11,20)


# medidas resumo

summary(x)


# gráficos padrões do R

hist(x, col='lightgreen', main='Histograma dex')

plot(density(x), main='Densidade alisada de x', lwd=2, col=2)


# média

mean(x)


# média aparada

mean(x,trim=0.2)



# mediana

median(x)



# desvio padrão

sd(x)



# variância

var(x)


############################################

# assimetria e curtose


media = mean(x)

mediana = median(x)

f = density(x)

moda = f$x[which(f$y==max(f$y))]

moda


plot(density(x), main='Densidade alisada de x', lwd=2)

xx <- c(media, media)
yy <- c(0,1)

polygon(xx,yy,col='white',border='red',lty=2, lwd=2)
text(media+3, 0.01, 'media', col='red', srt=90, cex=1.2)


xx <- c(mediana, mediana)
yy <- c(0,1)
polygon(xx,yy,col='white',border='blue',lty=2, lwd=2)
text(mediana-3, 0.01, 'mediana', col='blue', srt=90, cex=1.2)


xx <- c(moda,moda)
yy <- c(0,1)
polygon(xx,yy,col='white',border='purple',lty=2, lwd=2)
text(moda-3, 0.015, 'moda', col='purple', srt=90, cex=1.2)



############################################

# medidas separatrizes


# quantis

quantile(x, 0.05)

quantile(x, 0.95)


# quartis

quantile(x, 0.25)

quantile(x, 0.75)



############################################

# assimetria

skewness(x)


# curtose

kurtosis(x) # o resultado caracterizou uma distribuição leptocurtica



############################################

# cálculo dos momentos amostrais

install.packages('moments')

library(moments)


momentos_centrais <- all.moments(x,4,central=T)
momentos_centrais


momentos_nao_centrais <- all.moments(x,4,central=F)
momentos_nao_centrais



############################################

# média geométrica

install.packages('psych')

library(psych)

geometric.mean(c(1.80, 1.17, 1.43))



# média harmônica

harmonic.mean(c(60,40))

### MEDIDAS DE CONCENTRAÇÃO E DESIGUALDADE

install.packages('ineq')

library(ineq)

###########################################

# curva de lorenz

clorenz <- Lc(c(1,1,2,6,30))

plot(clorenz, main='Curva de Lorenz', col=4)

####

clorenz <- Lc(c(1,1,2,6,300))

plot(clorenz, main='Curva de Lorenz', col=4)

####

clorenz <- Lc(c(1,1,2,2,2))

plot(clorenz, main='Curva de Lorenz', col=4)

###########################################

# índice de gini

x <- c(0,3.75)

clorenz <- Lc(x)

plot(clorenz, main='Curva de Lorenz', col=4)

G = Gini(x)
text(0.2, 0.9, 'G=0.5', cex=1.5)

#####

x <- c(1/12,1/12,1/12,9/12)

clorenz=Lc(x)

plot(clorenz, main='Curva de Lorenz', col=4)
G=Gini(x)
text(0.2, 0.9, 'G=0.5', cex=1.5)


###########################################

# discrepância máxima

jmax = which.max(clorenz$p - clorenz$L)
Lmax = clorenz$p[jmax] - clorenz$L[jmax]


plot(clorenz, main='Curva de Lorenz', col=4)


segments(clorenz$p[jmax], clorenz$L[jmax],
         clorenz$p[jmax], clorenz$p[jmax],
         lty=2, col='blue')

text(clorenz$p[jmax]+0.07,
     clorenz$L[jmax]+0.3, label='Lmax')


###########################################

# exemplo bilionários

install.packages('gglorenz')

library(gglorenz)


View(billionaires)

ggplot(billionaires, aes(TNW)) +
  stat_lorenz()+
  annotate_ineq(billionaires$TNW) +
  geom_abline(linetype='dashed') +
  labs(title='Índice de Gini de patrimônio',
       x='Patrimônio líquido',
       y=' ',
       caption='Dados de 2021')



ggplot(billionaires, aes(TNW)) +
  stat_lorenz(desc=T)+
  geom_abline(linetype='dashed') +
  annotate_ineq(billionaires$TNW) +
  labs(title='Índice de Gini do patrimônio de bilionários') +
  















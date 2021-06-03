### MEDIDAS DE TENDÊNCIA CENTRAL

install.packages("e1071")

require(e1071)

##################################################

# amostra0

c0=c(2,3,6,9)

c0


# média

mean(c0)


# mediana

median(c0)



# gráficos

barplot(c0)

hist(c0)

hist(c0, probability = T)

lines(density(c0))

skewness(c0)

kurtosis(c0)

# pelo R, temos que se
# k>0, leptocurtica
# k=0, Mesocúrtica
# k<0, platicúrtica


##################################################

# amostra1

c1=c(7,1,5,2,3,1,6)


# média

mean(c1)


# mediana

median(c1)


# moda

as.numeric(names(table(c1))[table(c1)==max(table(c1))])


barplot(c1)

hist(c1)

hist(c1, probability=T)

lines(density(c1))

kurtosis(c1)

##################################################

# amostra2


c2 <- c(1,2,3,8,7,8,9)


# média

mean(c2)


# mediana

median(c2)


# moda

as.numeric(names(table(c2))[table(c2)==max(table(c2))])



barplot(c2)

hist(c2)

hist(c2, probability=T)

skewness(c2)

kurtosis(c2)

summary(c2)




















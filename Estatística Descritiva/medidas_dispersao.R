### MEDIDAS DE DISPERSÃO

iris

View(iris)


#############################################

# amostra0

a0 <-  iris$Sepal.Length


# amplitude amostral

h0 <- diff(range(a0))

h0


# variância amostral

var(a0)


# desvio padrão amostral

sd(a0)



# coeficiente de variação amostral


cv <-  sd(a0)/mean(a0)*100
cv



#############################################

# amostra1


a1 <- iris$Petal.Length


# amplitude amostral

h1 <- diff(range(a1))
h1


# variância amostral

var(a1)


# desvio padrão amostral

sd(a1)


# coeficiente de variação amostral

cv1 <-  sd(a1)/mean(a1)*100
cv1


#############################################

# comparação


plot(a0)

abline(h=mean(a0))


plot(a1)







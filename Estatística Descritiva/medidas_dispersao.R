### MEDIDAS DE DISPERS�O

iris

View(iris)


#############################################

# amostra0

a0 <-  iris$Sepal.Length


# amplitude amostral

h0 <- diff(range(a0))

h0


# vari�ncia amostral

var(a0)


# desvio padr�o amostral

sd(a0)



# coeficiente de varia��o amostral


cv <-  sd(a0)/mean(a0)*100
cv



#############################################

# amostra1


a1 <- iris$Petal.Length


# amplitude amostral

h1 <- diff(range(a1))
h1


# vari�ncia amostral

var(a1)


# desvio padr�o amostral

sd(a1)


# coeficiente de varia��o amostral

cv1 <-  sd(a1)/mean(a1)*100
cv1


#############################################

# compara��o


plot(a0)

abline(h=mean(a0))


plot(a1)







# TRATAMENTO DE DADOS

if(!require(dplyr)) install.packages("dplyr")

# carregar pacotes

library(dplyr)


# buscar diretorio

setwd("C:/Users/herna/OneDrive/Linguagem R/R para análise de dados/Tratamento e Exploração - Projeto 1/dados-covid-sp-master/data")

# abrir arquivo

covid_sp <- read.csv('dados_covid_sp.csv', sep=";")
View(covid_sp)

covid_sp <- read.csv2('dados_covid_sp.csv', sep=";", encoding ="UTF-8")
View(covid_sp)


# renomeando variáveis

covid_sp_alterado <- rename(covid_sp, municipio = nome_munic)
View(covid_sp_alterado)

covid_sp_alterado <- rename(covid_sp_alterado, data = datahora,
                            rotulo_mapa = map_leg,
                            codigo_mapa = map_leg_s)
View(covid_sp_alterado)


# excluir coluna (por nome)

covid_sp_alterado$cod_ra <- NULL


# excluir coluna (por número)

covid_sp_alterado <- select(covid_sp_alterado, -c(21))


# excluir várias colunas(por nome)

covid_sp_alterado <- subset(covid_sp_alterado, select = -c(codigo_ibge, cod_drs))


# excluir várias colunas (por número)

covid_sp_alterado <- select(covid_sp_alterado, -c(14,15))

covid_sp_alterado <- select(covid_sp_alterado, -c(17:19))


# excluir uma linha (por número)

covid_sp_alterado <- slice(covid_sp_alterado, -c(239660))

covid_sp_alterado <- slice(covid_sp_alterado, -c(239661:239666))


# excluir várias linhas (por nome)

covid_sp_alterado <- covid_sp_alterado %>% filter(municipio!="Ignorado")




# VALORES MISSING

# NA = valores ausentes / NAN = valor indefinido

sapply(covid_sp_alterado,function(x) sum(is.na(x)))
sapply(covid_sp_alterado,function(x) sum(is.nan(x)))


# substituir os valores missing

if(!require(tidyr)) install.packages("tidyr")
library(tidyr)

covid_sp_alterado2 <- covid_sp_alterado %>% mutate_all(replace_na,54)
View(covid_sp_alterado2)


# ou

covid_sp_alterado2 <- replace(x=covid_sp_alterado, list = is.na(covid_sp_alterado),
                              values = 54)

covid_sp_alterado2$semana_epidem[covid_sp_alterado2$data>='2021-01-01'&
                                 covid_sp_alterado2$data<='2021-01-07' ]<-54



# VERIFICAÇÃO DA TIPAGEM DOS ATRIBUTOS

str(covid_sp_alterado2)


# tranformação da tipagem de atributos

covid_sp_alterado2$semana_epidem <- as.integer(covid_sp_alterado2$semana_epidem)
str(covid_sp_alterado2)

covid_sp_alterado2$data <- as.Date(covid_sp_alterado2$data, format='%Y-%m-%d')
str(covid_sp_alterado2)


# criação de nova coluna

covid_sp_alterado2["idoso(%)"] <- 100*covid_sp_alterado2$pop_60/covid_sp_alterado2$pop
View(covid_sp_alterado2)


# exportação de arquivos

write.table(covid_sp_alterado2,file="covid_sp_tratado.csv", sep=",")






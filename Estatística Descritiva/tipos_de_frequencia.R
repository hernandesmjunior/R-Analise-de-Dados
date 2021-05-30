### TIPOS DE FREQUÊNCIA

install.packages("Hmisc")
require(Hmisc) # pode também usar o library

# primeira forma de criar um vetor

idade = c(10,10,10,10,30,30,30,30,30,30,30,
          30,50,50,50,50,70,70,70,90)

idade


# segunda forma de criar o vetor

idade = c(rep(10,4), rep(30,8), rep(50,4), rep(70,3), 90)

idade


# encontrando as frequências simples

frequencia_simples=table(idade)

frequencia_simples


# visual excel

dados_simples = data.frame(frequencia_simples)

dados_simples


# frequência acumulada

frequencia_acumulada = cumsum(frequencia_simples)

frequencia_acumulada


# adicionando coluna com acumulada

dados_simples$frequencia_acumulada = frequencia_acumulada

dados_simples


# frequência relativa simples

frequencia_relativa_simples = frequencia_simples/sum(frequencia_simples)

frequencia_relativa_simples


# adicionando a frequência relativa simples

dados_simples$frequencia_relativa_simples = frequencia_relativa_simples

dados_simples


# frequencia relativa acumulada

frequencia_relativa_acumulada = frequencia_acumulada/sum(frequencia_simples)


# adicionando a frequencia relativa acumulada

dados_simples$frequencia_relativa_acumulada = frequencia_relativa_acumulada

dados_simples


# encontrando automaticamente a frequencia simples e relativa simples

describe(idade)



####### ENCONTRANDO OS VALORES DE OUTRA FORMA

require(dplyr)


head(dados_simples)


dados_simples %>% head()


dados_simples_tidy = dados_simples %>% 
                     mutate(frequencia_acumulada = cumsum(Freq),
                            frequencia_relativa_simples=Freq/sum(Freq),
                            frequencia_relativa_acumulada=cumsum(frequencia_relativa_simples))

dados_simples_tidy








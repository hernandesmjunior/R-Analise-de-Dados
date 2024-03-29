### VISUALIZA��O DE DADOS DA COVID-19 NAS CIDADES BRASILEIRAS


library(tidyverse)
library(qicharts2)
library(plotly)


dados_cidades <-read.csv('covid_cidades.csv', header=T, encoding = 'UTF-8')

names(dados_cidades) # verificando os nomes das vari�veis

nrow(dados_cidades) # verificando o n�mero de observa��es

ncol(dados_cidades) # verificando o n�mero de vari�veis

View(dados_cidades)


###################################

# agrupando os dados por estado

# group_by

dados <- dados_cidades %>%
         group_by(state) %>%
         summarise(confirmed = sum(confirmed),
                   deaths = sum(deaths))

View(dados)


###################################

# representa��o tabular


tab <- dados$deaths

names(tab) <-levels(dados$state)


tab.rel <- dados$deaths / sum(tab)

names(tab.rel) <- levels(dados$state)


###################################

# gr�ficos padr�es do R


barplot(tab, col='lightblue')


barplot(tab.rel, col='lightblue')


###################################

# gr�fico de pareto


x <- rep(dados$state, dados$deaths)


paretochart(x, 
            title='Gr�fico de Pareto para mortes')



###################################

# gr�ficos do plotly

# gr�fico de setor

fig <- plot_ly(dados, labels = ~state, values= ~deaths, type='pie')

fig <- fig %>% layout(title='Estado')

fig


# gr�fico de barras de mortes

fig <- plot_ly(dados,
               x= ~state,
               y= ~deaths,
               name = 'Mortes por estado',
               type = 'bar'
               )
fig


# refazendo os gr�ficos com estados onde o n�mero de mortes � maior que 9000

# filter

dados_mais9mil <- dados %>% 
                  filter(deaths>9000)


View(dados_mais9mil)


fig <- plot_ly(dados_mais9mil, 
              x= ~state,
              y= ~deaths,
              type = 'bar') 

fig <- fig %>% layout(title='Mortes por estado')

fig  
  
  
# criando uma coluna com as regi�es usando o tibble


dados$regiao = 'Norte'
dados$regiao[dados$state %in% c("RS","PR","SC")] = 'Sul'
dados$regiao[dados$state %in% c("SP","MG","RJ","ES")] = 'Sudeste'
dados$regiao[dados$state %in% c("GO","MT","MS","DF")] = 'Centro-Oeste' 
dados$regiao[dados$state %in% c("CE","PI","BA","RN","PB","PE","SE","AL","MA")] = 'Nordeste'  

dados = dados[order(dados$regiao),]


###################################

# filtrando dados apenas da regi�o sudeste

dados_sudeste <- dados %>% 
                filter(regiao=='Sudeste')


View(dados_sudeste)






















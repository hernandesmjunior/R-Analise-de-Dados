### VISUALIZAÇÃO DE DADOS DA COVID-19 NAS CIDADES BRASILEIRAS


library(tidyverse)
library(qicharts2)
library(plotly)


dados_cidades <-read.csv('covid_cidades.csv', header=T, encoding = 'UTF-8')

names(dados_cidades) # verificando os nomes das variáveis

nrow(dados_cidades) # verificando o número de observações

ncol(dados_cidades) # verificando o número de variáveis

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

# representação tabular


tab <- dados$deaths

names(tab) <-levels(dados$state)


tab.rel <- dados$deaths / sum(tab)

names(tab.rel) <- levels(dados$state)


###################################

# gráficos padrões do R


barplot(tab, col='lightblue')


barplot(tab.rel, col='lightblue')


###################################

# gráfico de pareto


x <- rep(dados$state, dados$deaths)


paretochart(x, 
            title='Gráfico de Pareto para mortes')



###################################

# gráficos do plotly

# gráfico de setor

fig <- plot_ly(dados, labels = ~state, values= ~deaths, type='pie')

fig <- fig %>% layout(title='Estado')

fig


# gráfico de barras de mortes

fig <- plot_ly(dados,
               x= ~state,
               y= ~deaths,
               name = 'Mortes por estado',
               type = 'bar'
               )
fig


# refazendo os gráficos com estados onde o número de mortes é maior que 9000

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
  
  
# criando uma coluna com as regiões usando o tibble


dados$regiao = 'Norte'
dados$regiao[dados$state %in% c("RS","PR","SC")] = 'Sul'
dados$regiao[dados$state %in% c("SP","MG","RJ","ES")] = 'Sudeste'
dados$regiao[dados$state %in% c("GO","MT","MS","DF")] = 'Centro-Oeste' 
dados$regiao[dados$state %in% c("CE","PI","BA","RN","PB","PE","SE","AL","MA")] = 'Nordeste'  

dados = dados[order(dados$regiao),]


###################################

# filtrando dados apenas da região sudeste

dados_sudeste <- dados %>% 
                filter(regiao=='Sudeste')


View(dados_sudeste)






















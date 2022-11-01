#Apriori

#Data Preprocessing
library(arules)
dataset <- read.csv('Market_Basket_Optimisation.csv', 
                    header = F)
dataset <- read.transactions('Market_Basket_Optimisation.csv',
                             sep = ',', 
                             rm.duplicates = T)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

#Training Apriori Model on Dataset

rules <- apriori(dataset, 
                 parameter = list(support = 0.004, confidence = 0.2))
#We choose that support value by considering the products that are brought
#at least 3 times a day
#(3*7)/7501 = 0.003(round)

#Visualizing The Results
inspect(sort(rules, by = 'lift')[1:10])

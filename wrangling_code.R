##Input the data sets downloaded from gapminder
library(tidyverse)
library(kableExtra)
men<-tibble(read.csv("/Users/christinasun/Desktop/men.csv"))
men
women<-tibble(read.csv("/Users/christinasun/Desktop/women.csv"))
women
##tidy data
kable(men) %>% kable_styling(font_size = 12)
#There are three variables: country, year, proportion
men_new<-men %>% pivot_longer(!Country, names_to ="year", values_to ="proportion") %>% kable() %>% kable_styling(font_size = 12)
print(men_new)
women_new<-women %>% pivot_longer(!country, names_to ="year", values_to ="proportion") %>% kable() %>% kable_styling(font_size = 12)
print(women_new)

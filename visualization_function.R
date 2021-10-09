##Input the data sets downloaded from Gapminder.
men<-tibble(read.csv("/Users/christinasun/Desktop/men.csv"))
men
women<-tibble(read.csv("/Users/christinasun/Desktop/women.csv"))
women
##Choose the data of two countries--United States & China, with classification of men & women, combine the two rows into one data frame.
men1<-tibble(men) %>% filter(Country == "United States")
men1
men2<-tibble(men) %>% filter(Country == "China")
men2
a<-rbind(men1,men2)
a

data_men<-tibble(read.csv("/Users/christinasun/Desktop/final1.csv"))
data_men

women1<-tibble(women) %>% filter(country == "United States")
women1
women2<-tibble(women) %>% filter(country == "China")
women2
b<-rbind(women1,women2)
b

data_women<-tibble(read.csv("/Users/christinasun/Desktop/final2.csv"))
data_women

##Plot the mapping for each part.
library(ggplot2)
library(cowplot)

men_UnitedStates<-ggplot(data=data_men)+aes(x=Year,y=X0)+geom_point(alpha=0.3)+ylab("Proportion")+xlab("United States")+geom_hline(yintercept = mean(data_men$X0),lty=2,col="blue")+geom_smooth(fill="blue",color="darkblue",size=1)

men_China<-ggplot(data=data_men)+aes(x=Year,y=X1)+geom_point(alpha=0.3)+ylab("Proportion")+xlab("China")+geom_hline(yintercept = mean(data_men$X1),lty=2,col="red")+geom_smooth(fill="red",color="red",size=1)

plot_grid(men_UnitedStates,men_China,ncol=1,nrow=2)

mean(data_men$X0)
mean(data_men$X1)

women_UnitedStates<-ggplot(data=data_women)+aes(x=Year,y=X0)+geom_point(alpha=0.3)+ylab("Proportion")+xlab("United States")+geom_hline(yintercept = mean(data_women$X0),lty=2,col="blue")+geom_smooth(fill="blue",color="darkblue",size=1)

women_China<-ggplot(data=data_women)+aes(x=Year,y=X1)+geom_point(alpha=0.3)+ylab("Proportion")+xlab("China")+geom_hline(yintercept = mean(data_women$X1),lty=2,col="red")+geom_smooth(fill="red",color="red",size=1)

plot_grid(women_UnitedStates,women_China,ncol=1,nrow=2)

mean(data_women$X0)
mean(data_women$X1)

plot_grid(men_UnitedStates,women_UnitedStates,ncol = 1,nrow = 2)
plot_grid(men_China,women_China,ncol = 1,nrow = 2)

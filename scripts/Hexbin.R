data(diamonds)
library(ggplot2)
data(package=.packages(all.available = TRUE))
data(diamonds)
str(diamonds)
dim(diamonds)
?diamonds
#very basic Scatter 
plot(diamonds$carat,diamonds$price)
#improved Scatter
plot(diamonds$carat,diamonds,col=rgb(0,0,1,0,1),pch=16,
     main="Scatter Plot:Carat vs Price")
#HEXBIN USING BASE R
install.packages('hexbin')
library(hexbin)
hb<-hexbin(diamonds$carat,diamonds$price,xbins=40)
plot(hb,main="Hexbin Plot")
#basic hexbin 
ggplot(diamonds,aes(x=carat,y=price))+geom_hex()
#labled Hexbin plot
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  labs(title="Hexagon Binning:DiamondStructure",x="carat",y="price")+
  theme_minimal()
ggplot(diamonds,aes(carat,price))+geom_hex(bins=10)+theme_minimal()  

#addcolor palatte
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=40)+
  scale_fill_gradient(low="grey",high="black")+
  theme_minimal()
#color meaning:
ggplot(diamonds,aes(carat,price))+geom_hex(bins = 20)+
  scale_fill_viridis_c(name="count")+
  labs(title="Density Structure of Diamonds",x="carat",y="Price")+
  theme_minimal()

#facted hexbin
ggplot(diamonds,aes(carat,price))+geom_hex()+scale_fill_viridis_c()+
  facet_wrap(~cut)+
  theme_minimal()

#log scale hexbin 
ggplot(diamonds,aes(carat,price))+geom_hex()+scale_fill_viridis_c()+
  scale_y_log10()+
  theme_minimal()
#Accessing information about the Dataset
?VADeaths
#Checking the type of the Dataset
class(VADeaths)

help(class)
va_df <- as.data.frame(VADeaths)
class(va_df)

#creating a view of the DataSet in the form of a Table
View(va_df)

#creating new column in the dataframe
va_df$AgeGroups <- row.names(VADeaths)
View(va_df)
help(reshape)
va_df

#changing the data into "Long" format using "reshape" function 
va_long = reshape(va_df,
                  direction = "long",
                  varying = colnames(VADeaths),
                  v.names = "DeathRate",
                  timevar = "Population",
                  times = colnames(VADeaths)
)
View(va_long)

#building a basic Histogram
#png("Basic_hist.png")
hist(va_long$DeathRate)
#dev.off()
help(hist)

#changing the title and labels
hist(va_long$DeathRate,
     main = "Basis Histogram of VA Deathrates",
     xlab = "VA Deathrates",
     ylab = "Frequency",
     labels = TRUE)

#changing the color and border of histogram
hist(va_long$DeathRate,
     main = "Basis Histogram of VA Deathrates",
     xlab = "VA Deathrates",
     ylab = "Frequency",
     labels = TRUE,
     col = "skyblue",
     border = "red",
     #xlim = c(-80,80)
)

#changing the Number of bins/ bin = width
hist(va_long$DeathRate,
     breaks = 5,
     main = "Basis Histogram of VA Deathrates",
     xlab = "VA Deathrates",
     ylab = "Frequency",
     labels = TRUE,
     col = "skyblue",
     border = "red",
)

#data
#Asthetics---> x,y
#Geometry
#Facets
#Statistics
#Coordinates
#themes
#labels

library(ggplot2)
ggplot(
  va_long,
  aes(x=DeathRate)
)+
  geom_histogram(
    bins = 10,
    fill="pink", 
    col="red")+
  labs(
    title = "GGPLOT-Histogram",
    y = "Frequency")+
  #facet_wrap(~Population)
  theme_dark()
#load the dataset
?AirPassengers

#verify the dataset
class(AirPassengers)
View(AirPassengers)


#Covert the data set into dataframe
ap_df <- data.frame(
  year = time(AirPassengers),
  passengers = as.numeric(AirPassengers)
)
ap_df

ap_df_months <- data.frame(
  year = floor(time(AirPassengers)),
  month = cycle(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)
ap_df_months

#Basic plot
plot(AirPassengers)

#plot with title, Axis labels and color
?plot
plot(AirPassengers,
     main = "Air passengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col = "blue"
)

#changing the line width
plot(AirPassengers,
     type = 'l',
     lwd = 2,
     main = "Air passengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col = "purple"
)


plot(AirPassengers,
     type = 'l',
     lwd = 2,
     main = "Air passengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col = "purple"
)
points(AirPassengers,
       type = 'o',
       pch = 17,
       cex = 1.2,
       col = "pink")
grid()

# GGPLOT2

library(ggplot2)

ggplot(ap_df, 
       aes(year, passengers)) +
  geom_line(color = "purple", lwd=0.5) +
  geom_point(color = "red") +
  labs(
    title = "Air passengers Trend Analysis",
    caption = "Using Air Passengers Dataset",
    subtitle = "From 1949-1960",
    x = "year",
    y = "No. of Passengers",
  )+
  geom_point(color = 'red')
theme_minimal()


ggplot(ap_df, 
       aes(year, passengers)) +
  geom_line(color = "purple", lwd=0.5) +
  geom_point(color = "red") +
  labs(
    title = "Air passengers Trend Analysis",
    caption = "Using Air Passengers Dataset",
    subtitle = "From 1949-1960",
    x = "year",
    y = "No. of Passengers",
  )+
  geom_point(color = 'pink')+
  geom_smooth(se=FALSE, color = 'blue')
theme_minimal()
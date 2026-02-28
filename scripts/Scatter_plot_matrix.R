data(iris)
str(iris)
View(iris)

plot(iris$Sepal.Length,iris$Sepal.Width)

plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  main =  "sepalLength vs SepalWidth",
  xlab = "SepalLength(cm)",
  ylab = "SepalWidth(cm)",
  col = "blue",
  pch = 16
)

plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col = as.numeric(iris$Species),
  pch = 16,
  main = "Sepal Dimensions by Species"
)

legend(
  "topright",
  legend = levels(iris$Species),
  col = 1.3,
  pch = 16
)

plot (
  iris$Sepal.Length,
  iris$Sepal.Width,
  col = as.numeric(iris$Species),
  pch = 16,
  cex = iris$Petal.Length/max(iris$Petal.Length),
  main = "Multivariate Scatter Plot (Color + Size )"
)


pairs(
  iris[,1:4],
  col = as.numeric(iris$Species),
  pch = 16,
  main = "Scatter Plot Matrix of iris Dataset"
  
)


library(ggplot2)
ggplot(irirs , aes(x=Sepal.Length,y=sepal.Width,color = Species))+
  geom_point(size = 2)+
  theme_minimal()
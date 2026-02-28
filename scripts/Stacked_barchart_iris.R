iris
?iris
library(ggplot2)
class(iris)
head(iris)
str(iris)
View(iris)

barplot(table(iris$Species),
        main = "Count of Iris Species",
        ylab = "No. of flowers",
        xlab = "Species",
        col = "lavender"
)

mean_sepal <- tapply(iris$Sepal.Length, iris$Species, mean)
mean_sepal

barplot(
  mean_sepal,
  col = "pink",
  main = "Average Sepal Length by Species",
  ylab = "Length of mean sepal"
)

group_means <- rbind(
  Sepal = tapply(iris$Sepal.Length, iris$Species, mean),
  Petal = tapply(iris$Petal.Length, iris$Species, mean),
  Sepal1 = tapply(iris$Sepal.Width, iris$Species, mean),
  Petal2 = tapply(iris$Petal.Width, iris$Species, mean)
)
group_means

barplot(
  group_means,
  beside = TRUE,
  col = c("lavender", "pink"),
  legend.text = TRUE,
  main = "Grouped Bar Chart: Sepal vs Petal Length"
)

barplot(
  group_means,
  beside = FALSE,
  col = c("lavender", "pink", "skyblue", "lightgreen"),
  legend.text = TRUE,
  main = "Stacked Bar Chart: Sepal vs Petal Length"
)

group_mean <- rbind(
  Sepal = tapply(iris$Sepal.Width, iris$Species, mean),
  Petal = tapply(iris$Petal.Width, iris$Species, mean)
)
barplot(
  group_mean,
  beside = FALSE,
  col = c("lavender", "pink"),
  legend.text = TRUE,
  main = "Stacked Bar Chart: Sepal vs Petal Width"
)

ggplot(iris, aes(x=Species))+
  geom_bar()

# LAYER 7: STYLED BAR CHART (ggplot2)
ggplot(iris, aes(x = Species)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Distribution of Iris Species",
    y = "Count"
  ) +
  theme_minimal()

# Mean Sepal Length per Species
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    fill = "pink"
  ) +
  labs(
    title = "Mean Sepal Length by Species",
    y = "Mean Sepal Length"
  ) +
  theme_minimal()
# stat_summary() performs aggregation

# LAYER 9: GROUPED BAR CHART (ggplot2)
ggplot(iris, aes(x = Species, fill = Species)) +
  geom_bar(position = "dodge") +
  theme_minimal()

# Or with aggregated values:
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = "dodge"
  ) +
  theme_minimal()
# Easy comparison across categories


# LAYER 10: STACKED BAR CHART (ggplot2)
# Count-based stacked bar chart
ggplot(iris, aes(x = Species, fill = Species)) +
  geom_bar(position = "stack") +
  theme_minimal()


# Stacked bar with another categorical variable (example)
ggplot(iris, aes(x = Species, fill = cut(Sepal.Length,50))) +
  geom_bar(position = "stack") +
  labs(fill = "Sepal Length Group") +
  theme_minimal()
# Shows sub-category composition



# Or with aggregated values:
library(tidyr)

iris_long <- pivot_longer(
  iris,
  cols = c(Sepal.Length, Petal.Length),
  names_to = "Measurement",
  values_to = "Value"
)

# Plot
ggplot(iris_long, aes(x = Species, y = Value, fill = Measurement)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = "stack"
  ) +
  labs(
    title = "Stacked Bar Chart of Mean Measurements (Iris)",
    y = "Mean Value"
  ) +
  theme_minimal()
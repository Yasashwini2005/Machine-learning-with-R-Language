# Load necessary libraries
library(datasets)  # Load datasets package for accessing built-in datasets
library(dplyr)     # Load dplyr package for data manipulation
library(ggplot2)   # Load ggplot2 package for data visualization

# Load the Iris dataset
data("iris")

# Print the entire Iris dataset to inspect its structure and contents
iris

iris$Sepal.Length# print the whole sepal length coloumn
iris$Species[1:5]# print the first five values of species column

# Print summary statistics of the Iris dataset
summary(iris)

# Calculate mean, median, min, and max of Sepal.Length using dplyr
summarize(iris, mean(Sepal.Length))
summarize(iris, median(Sepal.Length))
summarize(iris, min(Sepal.Length))
summarize(iris, max(Sepal.Length))
#u can use the above function for other variables as well

# Check for missing values in the Iris dataset
iris %>%
  summarize_all(~ sum(is.na(.)))

# Create scatter plots and histograms for data visualization

# Scatter plot of Sepal.Length vs. Sepal.Width
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()#specifically used for scatterplot

# Scatter plot of Petal.Length vs. Petal.Width
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point()

# Scatter plot of Sepal.Length vs. Petal.Length
ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point()

# Histogram of Sepal.Length
ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram()#specifically used for histogram

# Histogram of Sepal.Width
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram()

# Histogram of Petal.Length
ggplot(data = iris, aes(x = Petal.Length)) +
  geom_histogram()

# Histogram of Petal.Width
ggplot(data = iris, aes(x = Petal.Width)) +
  geom_histogram()

#there are other plots as well u just nees to add +geom_boxplot() / +geom_line
#instead of geom_histogram()


# Scatter plot of Sepal.Length vs. Sepal.Width with facets for each species
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~Species)#individual scatterplots for each uniques variable in species variable
#the scatterplot will be of sepel.length vs sepel.width

# Scatter plot of Petal.Length vs. Petal.Width with facets for each species
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point() +
  facet_wrap(~Species)

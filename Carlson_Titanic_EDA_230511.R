# Load required packages
library(tidyverse)
library(ggplot2)

# Load data
titanic <- read.csv("TitanicPassengerList.csv", stringsAsFactors = FALSE)

head(titanic)

# Check for missing data
sum(is.na(titanic$age))

# Remove missing data
titanic <- na.omit(titanic)

# Count and mean ages
titanic %>%
  summarize(count = n(),
            mean_age = mean(age))

titanic %>%
  filter(sex == "female") %>%
  summarize(count = n(),
            mean_age = mean(age))

titanic %>%
  filter(sex == "male") %>%
  summarize(count = n(),
            mean_age = mean(age))

# Histogram of ages
ggplot(titanic, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "white") +
  labs(title = "Age Distribution of Titanic Passengers",
       subtitle = "Histogram of Ages",
       x = "Age",
       y = "Count")

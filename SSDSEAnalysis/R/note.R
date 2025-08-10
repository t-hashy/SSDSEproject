#' @title {SSDSE Data analytics project}
#' @description {This is a data science project on the course of Data Science class of the 1st grade, 2025.}
#' @author {Takahiro Hashimoto}
#' @date {`r Sys.Date()`}

# Load necessary libraries ----
library(dplyr)
library(ggplot2)


# Import the data ----
df <- readRDS("data/df_consumption_veg.rds")

# Check the data
glimpse(df)

# EDA ----

# Create a bar plot of vegetable consumption by prefecture
ggplot(df, aes(x = 都道府県, y = 食料.合計.)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Vegetable Consumption by Prefecture",
       x = "Prefecture",
       y = "Vegetable Consumption (kg/person/year)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(df, aes(x = 世帯人員, y = 食料.合計., label = 都道府県)) +
  geom_text() +
  geom_smooth(aes(label = NULL)) +
  scale_y_continuous( labels = scales::comma) +
  theme_classic() 

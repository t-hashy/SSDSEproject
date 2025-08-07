#' @title {SSDSE Data analytics project}
#' @description {This is a data science project on the course of Data Science class of the 1st grade, 2025.}
#' @author {Takahiro Hashimoto}
#' @date {`r Sys.Date()`}

# Load necessary libraries ----
library(dplyr)
library(readr)
library(ggplot2)


# Import the data ----
# Read the CSV file, specifying Shift-JIS encoding due to special characters
df_consumption_raw <- read.csv("data/SSDSE-C-2025.csv", fileEncoding = "sjis", skip = 1)

# Display the first few rows of the data frame
head(df_consumption_raw)
glimpse(df_consumption_raw)


# Select specific columns from the raw data frame
selected_col_names <- colnames(df_consumption_raw)[c(2:5, 74:104)]
df_consumption_veg <- df_consumption_raw[, selected_col_names]

# Shape the data frame
df_consumption_veg <- df_consumption_veg %>%
  mutate(across(where(is.character), as.factor)) |>
  filter(!都道府県 %in% c("全国", "合計"))

# Display the first few rows and structure of the new data frame
head(df_consumption_veg)
dim(df_consumption_veg)
glimpse(df_consumption_veg)

# Save the data
saveRDS(df_consumption_veg, "data/df_consumption_veg.rds")

# Load the saved data frame
readRDS("data/df_consumption_veg.rds") |>
  glimpse()

# EDA ----
# Create a bar plot of vegetable consumption by prefecture
ggplot(df_consumption_veg, aes(x = 都道府県, y = X05.野菜.海藻)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Vegetable Consumption by Prefecture",
       x = "Prefecture",
       # y = "Vegetable Consumption (kg/person/year)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
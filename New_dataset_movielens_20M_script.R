library(tidyverse)
library(readr)
data_raw<- read_csv(file.choose())
data_raw
final_movielens_20M_data<- data_raw %>% distinct() %>%
  mutate(
    userId = as.integer(userId),
    movieId = as.integer(movieId),
    rating = as.numeric(rating)
  ) %>% filter(movieId > 250 & rating > 2.5) %>%
  select(userId,movieId,rating)
final_movielens_20M_data
write.csv(final_movielens_20M_data,
          'New_dataset_movielens_20M_data.csv',
          row.names = FALSE)
getwd()

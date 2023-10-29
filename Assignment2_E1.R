
library(tidyverse)
library(magrittr)
library(dplyr, warn.conflicts = FALSE)
options(dplyr.summarise.inform = FALSE)

# import the datasets in repo which are from R built-in datasets but processed with some column sequence swap
swiss <- read.csv("./Assignment2_repo/data/swiss.csv")
show(swiss)


# defining a function with a single argument `data` that performs transformations on it
data_transform <- function(data){
  
  # convert data to tibble and drop NA value
  data <- data %>% as_tibble() %>% drop_na()
  
  last_col <-  ncol(data) # in all given dataset in repo, the last column is for the response variable
  last_col_name <- names(data)[last_col]
  # take the absolute value and then the natural logarithm of y
  data <- data %>% mutate(y_log = log(abs(data[[last_col]]))) 
  
  return(data)
  
}

data_transform(swiss)
# head(data_transform(swiss))
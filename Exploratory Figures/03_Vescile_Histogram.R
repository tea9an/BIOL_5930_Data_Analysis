library(tidyverse)
library(conflicted)
conflict_prefer("filter", "dplyr")
conflict_prefer("lag", "dplyr")
library(ggplot2)

X02_Dataset_Hyphae <- read_csv("Data/02_Dataset_Hyphae.csv")

hist(X02_Dataset_Hyphae$Vesicles, main='Vesicle Distribution', xlab="Total Vesciles")

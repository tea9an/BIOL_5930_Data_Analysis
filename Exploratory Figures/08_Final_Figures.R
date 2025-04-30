library(tidyverse)
library(conflicted)
conflict_prefer("filter", "dplyr")
conflict_prefer("lag", "dplyr")
library(ggplot2)
library(ggpubr)
scatterdata <- read_csv("Data/02_Dataset_Nitro.csv")

ggplot(data = scatterdata, mapping = aes(x = Nitrate, y = Arbuscules)) + geom_point()+ 
  labs(x = "Nitrate (ug/g dry soil)",
       y = "Arbuscules (total)") +
  geom_smooth(method = "lm") +
  stat_cor()

scatterdata$BurnStatus <- factor(levels = c("None", "Medium", "High"))
ggplot(scatterdata, aes(scatterdata, x=BurnStatus, y=Nitrate, fill =BurnStatus
                        )) + 
  geom_bar(stat="identity") +
  labs(x = "Burn Status",
       y = "Nitrate (ug/g dry soil)") +
  stat_compare_means(label.y = 20) +
  scale_fill_brewer(palette = "Set1")

ggplot(scatterdata, aes(scatterdata, x=Urbanization, y=Nitrate, fill=Urbanization)) + 
  geom_bar(stat="identity") +
  labs(x = "Level of Urbanization",
       y = "Nitrate (ug/g dry soil)") +
  stat_compare_means(label.x = 1.7, label.y = 20) +
  scale_fill_brewer(palette = "Paired")
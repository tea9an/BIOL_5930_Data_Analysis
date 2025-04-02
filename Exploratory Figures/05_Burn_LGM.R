library(tidyverse)
library(ggplot2)
scatterdata <- read_csv("Data/02_Dataset_Scatter.csv")

ggplot(data = scatterdata, mapping = aes(x = Phosphate, y = Arbuscules, colour = `Burn Status`)) + geom_point()+ 
  labs(x = "Phosphate (ug/g dry soil",
       y = "Arbuscules (total)",
       color = "Level of Urbanization",
       title = "Burn Impact on AMF Morphology and Soil Nutrients") +
  geom_smooth(method = "lm")

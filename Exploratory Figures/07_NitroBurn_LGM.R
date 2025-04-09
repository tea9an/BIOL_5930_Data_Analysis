library(tidyverse)
library(ggplot2)
scatterdata <- read_csv("Data/02_Dataset_Nitro.csv")

ggplot(data = scatterdata, mapping = aes(x = Nitrate, y = Arbuscules, colour = `Burn Status`)) + geom_point()+ 
  labs(x = "Nitrate (ug/g dry soil)",
       y = "Arbuscules (total)",
       color = "Burn Status",
       title = "Burn Impact on AMF Morphology and Soil Nutrients") +
  geom_smooth(method = "lm")

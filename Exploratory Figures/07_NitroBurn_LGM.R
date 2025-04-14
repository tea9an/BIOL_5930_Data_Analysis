#making scatterplot

library(tidyverse)
library(ggplot2)
scatterdata <- read_csv("Data/02_Dataset_Nitro.csv")

scatterdata$BurnStatus <- as.factor(scatterdata$BurnStatus)
scatterdata$PLANTID <- as.factor(scatterdata$PLANTID)
scatterdata$Urbanization <- as.factor(scatterdata$Urbanization)

ggplot(data = scatterdata, mapping = aes(x = Nitrate, y = Arbuscules, colour = `BurnStatus`)) + geom_point()+ 
  labs(x = "Nitrate (ug/g dry soil)",
       y = "Arbuscules (total)",
       color = "BurnStatus",
       title = "Burn Impact on AMF Colonization and Soil Nutrients") +
  geom_smooth(method = "lm")

#scatterplot, regression, & linear model on JUST nitrate on arbuscules, p = 0.0325 = SIGNIFICANT
ggplot(data = scatterdata, mapping = aes(x = Nitrate, y = Arbuscules)) + geom_point()+ 
  labs(x = "Nitrate (ug/g dry soil)",
       y = "Arbuscules (total)",
       title = "Impact of Nitrate Conc. on AMF Colonization") +
  geom_smooth(method = "lm") +

# working with Cristy on LMM fitting

library(dplyr)
library(plyr)
library(ggplot2)

summary <- plyr::ddply(scatterdata, c("BurnStatus", "Urbanization"), plyr::summarise, N = length(unique(PLANTID)))
summary                            

library(lme4)
mod <- lmer(Arbuscules ~ Nitrate * BurnStatus + (1|PLANTID), data=scatterdata)
summary(mod)
anova(mod)
aov(mod)
mod2 <- lmer(Arbuscules ~ Nitrate  * Urbanization + (1|PLANTID), data=scatterdata)
summary(mod2)
anova(mod2)


# found no significant interactions

mod3 <- lmer(Arbuscules ~ PLANTID * Nitrate + (1|Urbanization), data=scatterdata)
summary(mod3)

# scatterplot, looks bad with plant ID
ggplot(data = scatterdata, mapping = aes(x = Nitrate, y = Arbuscules, colour = `PLANTID`)) + geom_point()+ 
  labs(x = "Nitrate (ug/g dry soil)",
       y = "Arbuscules (total)",
       color = "PLANTID",
       title = "Burn Impact on AMF Colonization and Soil Nutrients") +
  geom_smooth(method = "lm")
justnitrate <- lm(Arbuscules ~ Nitrate, data=scatterdata)
summary(justnitrate)

# barplots of nitrate on Y to burn/urban on X

library(ggplot2)

ggplot(scatterdata, aes(scatterdata, x=BurnStatus, y=Nitrate)) + 
  geom_bar(stat="identity") +
  labs(x = "Burn Status",
       y = "Nitrate (ug/g dry soil)",
       title = "Burn Impact on Soil Nitrate Comp")


ggweekdata<- read.csv("ts_sst_data_weeks.csv")
df <- ggweekdata
df$year <- as.factor(df$year)
head(df, 3)

library(dplyr)
df.summary2 <- df %>%
  group_by(year, weeks) %>%
  summarise(
    sd = sd(Temperature),
    Temperature = mean(Temperature)
  )
df.summary2


p<- ggplot(df, aes(year, Temperature, color = weeks)) +
  geom_jitter(position = position_jitter(0.2)) + 
  geom_line(aes(group = weeks),data = df.summary2) +
  geom_errorbar(aes(ymin = Temperature-sd, ymax = Temperature+sd),
                data = df.summary2, width = 0.2)

 library(plotly)

ggplotly(p)



write
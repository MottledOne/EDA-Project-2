setwd("C:/Users/Benjamin/Downloads/exdata_data_NEI_data/")
library(tidyverse)

rm(list =ls())
NEI <- readRDS("summarySCC_PM25.rds")
code_clss <- readRDS("Source_Classification_Code.rds")

Total_Emissions <- NEI %>% 
  group_by(year) %>% 
  summarize(total = sum(Emissions))

with(Total_Emissions, plot(year, total, type = "l"))
with(Total_Emissions, lines(year, total, type = "l"))

Baltimore_Emissions <- NEI %>% 
  filter(fips=="24510") %>% 
  group_by(year) %>% 
  summarize(total = sum(Emissions))

with(Baltimore_Emissions, plot(year, total, type = "l"))
with(Baltimore_Emissions, lines(year, total, type = "l"))

Baltimore_Emissions <- NEI %>% 
  filter(fips=="24510") %>% 
  group_by(year,type) %>% 
  summarize(total = sum(Emissions))

ggplot(data = Baltimore_Emissions, mapping = aes(x = year, y = total))+
  geom_line(aes(color = type))

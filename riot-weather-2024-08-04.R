# Riot weather
# A.Bailey 2024-08-04

# Load libraries
library(tidyverse)
library(sotoncolours)
library(extrafont)

# Weather data from Met Office Daily Weather Reports
#https://www.metoffice.gov.uk/research/library-and-archive/publications/daily-weather-summary
df <- read_csv("riot_data.csv")

# Plot df
df |> 
  ggplot(aes(x=date, colour = event)) +
  geom_point(aes(y = max_day_temp), colour = uos_colours[["horizon3"]], size = 2) +
  geom_line(aes(y = max_day_temp),colour = uos_colours[["horizon3"]], size =1) +
  geom_point(aes(y = rainfall), colour = uos_colours[["marine1"]], size = 2) +
  geom_line(aes(y = rainfall), colour = uos_colours[["marine1"]], size =1) +
  facet_wrap(~event, scales = "free_x") +
  scale_y_continuous(
         expression("Max. Temperature " ( degree*C)), 
         sec.axis = sec_axis(~ . * 4, name = "Precipitation (mm)")
       ) +
  theme_minimal() +
  theme(legend.position = "", 
        text = element_text(family = "Atkinson Hyperlegible", size = 12))

# Save the plot
ggsave("uk-riot-weather-2024-08-04.png", width = 8, height = 6, bg = "white")

library(tidyverse)

# agregamos el archivo CSV mediante link
file_url <- "https://data.giss.nasa.gov/gistemp/tabledata_v4/SH.Ts+dSST.csv"

read_csv(file_url, skip = 1, na = "***") %>% 
  select(year = Year, t_diff = DJF) %>% 
  ggplot(aes(year, t_diff)) + 
  geom_line(color = "gray", size = 0.5) +
  geom_point(fill = "white", color = "gray", shape = 21) +
  geom_smooth(se = FALSE, color = "black", size = 1) +
  scale_x_continuous(breaks=seq(1880, 2023, 20), expand=c(0,0))+
  scale_y_continuous(limits=c(-0.5, 1.5), expand=c(0,0))+
  labs(
    x = "YEAR",
    y = "Temperature anomaly (C°)",
    title = "GLOBAL LAND-OCEAN TEMPERATURE INDEX",
    subtitle = "Data source: NASA's Goddard Institute for Space Studies (GISS).\nCredit: NASA/GISS"
  )+
    theme_light()+
  theme(
    axis.ticks = element_blank()
    
  )

ggsave("figures/temperaturePlot.png", width=6,height=4)


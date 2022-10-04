library(tidyverse)

# agregamos el archivo CSV mediante link
file_url <- "https://data.giss.nasa.gov/gistemp/tabledata_v4/SH.Ts+dSST.csv"

read_csv(file_url, skip = 1, na = "***") %>% 
  select(year = Year, t_diff = DJF) %>% 
  ggplot(aes(year, t_diff)) + 
  geom_line(aes(color = "1"), size = 0.5, show.legend = FALSE) +
  geom_point(fill = "white", aes(color = "1"), color = "gray", shape = 21, show.legend = TRUE ) +
  geom_smooth(se = FALSE, aes(color = "2"), size=0.5, span=0.15, show.legend = FALSE) +
  scale_x_continuous(breaks=seq(1880, 2023, 20), expand=c(0,0))+
  scale_y_continuous(limits=c(-0.5, 1.5), expand=c(0,0))+
  scale_color_manual(name=NULL,
                     breaks=c(1,2),
                     values=c("gray", "black"),
                     labels=c("Media Anual", "Lowess smoothing (Regresión Local)"))+
  labs(
    x = "Año",
    y = "Anomalía de temperatura (C°)",
    title = "GLOBAL LAND-OCEAN TEMPERATURE INDEX",
    subtitle = "Fuente: NASA's Goddard Institute for Space Studies (GISS).\nCredit: NASA/GISS"
  )+
    theme_light()+
  theme(
    axis.ticks = element_blank(),
    plot.title.position = "plot",
    plot.title = element_text(margin = margin(b=10), color = "red", face="bold"),
    plot.subtitle = element_text(size=8, margin = margin(b=10)),
    legend.position = c(0.15, 0.9),
    legend.title = element_text(size=0),
    legend.key.height = unit(8, "pt"),
    legend.margin = margin(0,0,0,0)
  )


ggsave("figures/temperaturePlot.png", width=6,height=4)


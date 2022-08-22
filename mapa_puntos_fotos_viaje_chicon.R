library(leaflet)
library(sf)
library(rgdal)
library(htmlwidgets)
# devtools::install_github("environmentalinformatics-marburg/mapview", ref = "develop")
library(mapview)
library(lattice)
# install.packages("leafpop")
library(leafpop)


#data
directorio <- getwd()
file <- "/puntos_.shp"
puntos <- sf::read_sf(paste0(directorio, file))$geometry
fotos <- list.files(pattern = "*.jpg", recursive=T, full.names = TRUE)

#mapa

mapa <- leaflet(puntos) %>%
  # addTiles() %>% 
  addCircleMarkers(
    fillOpacity = 0.8, radius = 10, group = "puntos" ) %>% 
  addPopupImages(fotos, group = "puntos", width = 470) %>% 
  addProviderTiles( providers$OpenStreetMap)  #%>% # providers$Esri.WorldImagery
  # addLegend("bottomright",  # FIELD
  #           colors = 
  #           title = "Ubicacion de fotografías") # leyenda

saveWidget(mapa, file="mapa3.html", selfcontained=T, 
           libdir  = "./widget_dir" , 
           title = "Algunas ubicaciones de la salida a campo a Chicón")



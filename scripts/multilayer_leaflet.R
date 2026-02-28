library(leaflet)
library(dplyr)

#draw map
leaflet()%>%
  #Add first tile
  addTiles(group = "One")%>%
  #Add second tile
  addProviderTiles(providers$Esri.WorldImagery,group = "Two")%>%
  #Add first marker
  addMarkers(lng = 25.505206, lat = 65.9767231,group = "mark1")%>%
  #Add second marker
  addMarkers(lng = 45.445206,lat = 45.5327231,group = "Mark2")%>%
  #Add layer controls
  addLayersControl(baseGroups = c("One","Two"),
                   overlayGroups = c("mark1","mark2"),
                   options = layersControlOptions(collapsed = FALSE))
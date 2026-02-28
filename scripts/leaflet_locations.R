#load leaf lib
library(leaflet)
#create map widget
map <- leaflet()
#print map widget with tiles
map <-leaflet()%>%addTiles()
#map using the addMarkers()function
map <-leaflet()%>%
  addTiles()%>%
  addMarkers(lng=82.0670874,lat=17.0893355,
             popup="Aditya University")
#addMarkers(lng=77.1025,lat=28.7041,
#popup="Delhi,India")
#print map
map
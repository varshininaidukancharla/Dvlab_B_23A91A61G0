#the basic leaflet widgets shows an empty map widget with no tiles or markers
library(leaflet)

india_map<-leaflet()%>%
  addTiles()%>%
  setView(lng = 78.9626,lat = 20.5937, zoom = 5)
cities_data <- data.frame(
  city = c("Mumbai", "Delhi", "Bangalore", "Hyderabad", "Chennai", "Kolkata"),
  lat  = c(19.0760, 28.7041, 12.9716, 17.3850, 13.0827, 22.5726),
  lng  = c(72.8777, 77.1025, 77.5946, 78.4867, 80.2707, 88.3639),
  population = c(20411000, 32941000, 13608000, 10004000, 11324000, 14850000)
)
india_map
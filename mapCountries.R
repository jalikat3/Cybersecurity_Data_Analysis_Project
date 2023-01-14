# author: Jali Purcell December 2022
library("tidyverse") # include packages for creating the map
library("leaflet")
library("dplyr")
library("knitr")
library("htmltools")
library("htmlwidgets")

my_data <- read_csv("Book1.csv") # load the input file

rr <- tags$div(
  HTML('<a href="https://www.comparitech.com/blog/vpn-privacy/cybersecurity-by-country/">Data Source</a>'))  

# create links for outside data resources
rr2 <- tags$div(
  HTML('<a href="https://worldpopulationreview.com/country-rankings/republic-countries">Government Type Source</a>'))  
# make map from the data
my_map<- my_data %>%
  leaflet() %>%
  addTiles() %>%
  addControl(rr, position = "bottomleft")%>% # place the links on the bottom left
  addControl(rr2, position = "bottomleft")%>%
  addMarkers(my_data$`Longitude`, my_data$`Latitude`, # place markers at the longitude, latitude given for each
            # popup is the information displayed about each country
             popup=~paste(my_data$`Country`,"<br>Government Type: ",
                           my_data$`Government Type`, "<br>Cyber Security Score: ",
                           my_data$`Average Overall Score`,
                           "<br>Rank: ",
                           my_data$Rank,
                           "<br>Worst Cyber-Security Category: <br>",
                            my_data$`Notable High Category`,
                           ": ", my_data$`Notable High Value`))

my_map # displays the map


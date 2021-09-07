##polygons of current dataset found
#url here:
#Anthony Davidson
# 07092021

#libraries
library(tidyverse)
library(maptools)

#latest dataset
tab3 <- read.csv("https://raw.githubusercontent.com/green-striped-gecko/covid_canberra/main/data/last.csv")
############wrangling
tab3$Contact <- factor(tab3$Contact,levels=c(  "Close"  , "Casual", "Monitor") )
cc <- as.numeric( tab3$Contact)
ncols <- c("black","cyan")
nn <- as.numeric(factor(tab3$Status))
nn2 <- ifelse(nn==1,nn, 3)
tab3$Date <- substr(tab3$Date,1,10) #ditch day of the week
labs <- paste(tab3$Contact, tab3$Status,tab3$Exposure.Location, tab3$Street, tab3$Suburb, tab3$Date,tab3$Arrival.Time, tab3$Departure.Time, tab3$doubles, sep="<br/>") 

#clean but large dataset
tab4 <- tab3

##find all suburbs needed
dataJoin <- absmapsdata::sa12016 %>%
  filter(gcc_name_2016 == "Australian Capital Territory") %>%
  mutate(Suburb = sa2_name_2016) %>%
  left_join(tab3, by = c("Suburb")) %>%
  select(Suburb, lat, lon, Exposure.Location, geometry,Status, Contact) %>%
  na.omit() %>%
  mutate(Status = ifelse(Status == "New", "New", "Previous"),
         Contact = ifelse(Contact == "monitor", "Monitor", Contact)) %>%
  # droplevels() %>%
  st_as_sf()

# glimpse(dataJoin)

###############################################
##plot the map
colsRAW <- as.numeric(as.factor(as.character(dataJoin$Contact)))
sumNews <- table(as.factor(as.character(tab4$Contact)))

# new.plot()
plot(filter(dataJoin, Status == "New")$geometry, col = colsRAW)


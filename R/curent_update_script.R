



##import data
tab3 <- read.csv("https://raw.githubusercontent.com/green-striped-gecko/covid_canberra/main/data/last.csv")

##reduce to just new data
newtab3 <- tab3 %>%
  filter(Status == "New")

cols = c("red", "yellow", "blue")
newtab3$Contact <- factor(newtab3$Contact,levels=c(  "Close"  , "Casual", "Monitor") )
cc <- as.numeric( newtab3$Contact)
ncols <- c("black","cyan", "black")
nn <- as.numeric(factor(newtab3$Status))
nn2 <- ifelse(nn==1,nn, 3)

newtab3$Date <- substr(newtab3$Date,1,10) #ditch day of the week
labs <- paste(newtab3$Contact, newtab3$Status,newtab3$Exposure.Location, newtab3$Street, newtab3$Suburb, newtab3$Date,newtab3$Arrival.Time, newtab3$Departure.Time, newtab3$doubles, sep="<br/>") 

##add function here instead soon?
m <- leaflet(df_shared) %>% 
  addProviderTiles("Stamen.TonerLite",
                   options = providerTileOptions(opacity = 0.35)) 

##busese
busses <- readOGR(dsn = "bus", layer = "geo_export_69c76e06-1d3f-4619-be3b-b4e5789be8ca", verbose = FALSE)
## Warning in OGRSpatialRef(dsn, layer, morphFromESRI = morphFromESRI, dumpSRS =
## dumpSRS, : Discarded datum WGS84 in Proj4 definition: +proj=longlat +ellps=WGS84
## +no_defs
#search all bus lines that are mentioned

bindex <- grep("Bus Route", newtab3$Exposure.Location)
buslanes <- newtab3$Exposure.Location[bindex]

busnumbers <- gsub("Bus Route ([0-9,A-Z]+) Transport.*","\\1", buslanes)
blineindex <- which(busses$short_name %in% busnumbers)
blabs <- paste(paste0("Bus route: ", busses$short_name[blineindex]),"<strong> For bus stops and ","exposure times, please"," search the table." , sep="<br/>")
bb <- (busses[blineindex,])
coo <- coordinates(bb)
bcols <- colorRampPalette(c("purple", "green"))( length(coo))

for (ib in 1:length(coo))
{
  cood <- data.frame(coo[[ib]])
  m <- m %>% addPolylines(lng=cood[,1], lat=cood[,2], color = bcols[ib], weight   = 3, opacity = 0.3, popup  = blabs[ib])
  #add suburb data etc here
}

# m <- m %>% addCircleMarkers(lat=newtab3$lat, lng=newtab3$lon, popup = labs, weight=nn2, fillColor = cols[cc],color=ncols[nn], opacity =1,radius = 5 , fillOpacity = 0.5)

m <-   m %>%
  addCircleMarkers(lat=newtab3$lat, lng=newtab3$lon, popup = labs, weight=nn2, fillColor = cols[cc],color=ncols[nn], opacity =1,radius = 7 , fillOpacity = 0.5, clusterOptions =markerClusterOptions(spiderfyDistanceMultiplier=1.5,
                                                                                                                                                                                               iconCreateFunction=JS("function (cluster) {

    var childCount = cluster.getChildCount();

    if (childCount < 3) {
      c = 'rgba(64, 64, 64, 0.2);'
    } else if (childCount < 50) {
      c = 'rgba(184, 134, 11, 0.2);'
    } else {
      c = 'rgba(139, 0, 0, 0.2);'
    }
     return new L.DivIcon({ html: '<div style=\"background-color:'+c+'\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });
  }"))                                                  )

m

# cc <- as.numeric(as.character(newtab3$Contact))
# ??addlogo
library(leafem)
m <- leaflet(newtab3) %>%
  addProviderTiles("Stamen.TonerLite",
                   options = providerTileOptions(opacity = 1))

m <- m %>% addCircleMarkers(lat=newtab3$lat, lng=newtab3$lon, 
                            weight=nn2, 
                            opacity =1,radius = 5 , fillOpacity = 1, clusterOptions =markerClusterOptions(spiderfyDistanceMultiplier=1.5,
                                                                                                                                                            iconCreateFunction=JS("function (cluster) {

    var childCount = cluster.getChildCount();

    if (childCount < 3) {
      c = 'rgba(64, 64, 64, 0.2);'
    } else if (childCount < 50) {
      c = 'rgba(184, 134, 11, 0.2);'
    } else {
      c = 'rgba(139, 0, 0, 0.2);'
    }
     return new L.DivIcon({ html: '<div style=\"background-color:'+c+'\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });
  }"))                                                                                                                           )



##legend
legcols <- cols
leglabs <- levels(newtab3$Contact)
m <- m %>%  addLegend("bottomright", labels = leglabs, colors = legcols, opacity = 1)
m


# 
# ####################################################
# ### add bus lines mentioned
# m
# m + addLogo("./assets/img/06.jpg", alpha = 1, src = c("remote", "local"), url,
#   position = c("topleft", "topright", "bottomleft", "bottomright"),
#   offset.x = 50, offset.y = 13, width = 60, height = 60)

m



library(DT)
# bscols(
#   filter_checkbox(
#     id = "contact",
#     label = "",
#     sharedData = df_shared,
#     group = ~Contact,
#     inline=TRUE
#   ))
#bscols(  filter_select(id="dates", label="Date",sharedData = df_shared, group=~Date))

dtt <-DT::datatable(df_shared,
                    caption = 'Search for entries, (shift)click to select, this highlights the locations in the map.',selection = "multiple", rownames = FALSE, 
                    extensions = c("Buttons", "Select", "Responsive"), options = list(autoHideNavigation=FALSE, pageLength=50,
                                                                                      dom = 'Bfrtip',
                                                                                      select = TRUE, 
                                                                                      buttons = list(
                                                                                        "copy",
                                                                                        list(
                                                                                          extend = "selectNone",
                                                                                          text = "Clear"
                                                                                        )
                                                                                      ),                                   
                                                                                      initComplete = JS(
                                                                                        "function(settings, json) {",
                                                                                        "$(this.api().table().header()).css({'font-size': '50%'});",
                                                                                        
                                                                                        "}")))  %>% DT::formatStyle(columns = 1:8, fontSize='70%') 

dtt
# %>%
# addPolygons(
#   # fill
#   fillColor   = ~pal(water_km2),
#   fillOpacity = 0.7,
#   # line
#   dashArray   = "3",
#   weight      = 2,
#   color       = "white",
#   opacity     = 1,
#   # interaction
#   highlight = highlightOptions(
#     weight = 5,
#     color = "#666",
#     dashArray = "",
#     fillOpacity = 0.7,
#     bringToFront = TRUE))
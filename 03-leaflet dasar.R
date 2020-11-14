library(rgdal)

indo = readOGR(dsn = "D:/Datasets/gadm36_IDN_shp", layer = "gadm36_IDN_1")

library(leaflet)
#membuat palet
pal = colorFactor("viridis", domain=indo$NAME_1)

#membuat list untuk nama-nama provinsi
mytext = paste(
  "Provinsi :",indo$NAME_1,"<br/>"
) %>% lapply(htmltools::HTML) 


leaflet(indo) %>% 
  addTiles() %>% 
  setView(lng = 118, lat=-2.5, 4) %>% 
  #Menambah polygon pada peta berdasarkan data indo
  addPolygons(weight = 2,
              color = "white", #warna garis
              fillColor = ~pal(indo$NAME_1), #memberi warna polygon
              fillOpacity = 0.5, #ketebalan warna polygon
              label = mytext,
              labelOptions = labelOptions(
                style = list("font-weight"="normal", padding = "3px 8px"),
                textsize = "13px",
                direction = "auto",
              ),
              highlightOptions = highlightOptions(color = "black", #warna garis ketika cursor disitu
                                                  weight = 2,
                                                  bringToFront = T))
#silahkan anda sesuaikan dengan keinginan anda
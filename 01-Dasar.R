library(rgdal)

#dsn = Lokasi folder gadm36_IDN_shp
#layer = nama file shp tanpa format .shp

#indonesia per provinsi maka layer 1  ----> gadm36_IDN_1
#          per Kabupaten maka layer 2 ----> gadm36_IDN_2
#          per Kecamatan maka layer 3 ----> gadm36_IDN_3
#          per Desa maka layer 4      ----> gadm36_IDN_4

indo = readOGR(dsn = "D:/Datasets/gadm36_IDN_shp", layer = "gadm36_IDN_1")

#Bisa langsung di plot dengan base plot
plot(indo)

#jika ingin dengan ggplot2. data harus diubah menjadi data frame
#Mengubah menjadi data frame
library(ggplot2)
indonesia = fortify(indo, region = "NAME_1")
head(indonesia)

#Plot
#white warna garis batas provinsi
ggplot(indonesia) +
  geom_polygon(aes(x = long, y = lat, fill = id, group=group), color="white") +
  theme(legend.position = "none") #hapus legenda

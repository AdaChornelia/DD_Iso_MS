# data prep
## referred to IsoriX documentation for full explanation about the function etc
rawdata = read.csv(file = "GNIP_bulkdownload.csv")
head(rawdata)

#reshape the data
## preparing it to make them ready for IsoriX
rawdata$year.begin = as.numeric(format(as.Date(rawdata$Begin.of.Period), "%Y"))
rawdata$year.end = as.numeric(format(as.Date(rawdata$End.of.Period), "%Y"))
rawdata$year.span = as.numeric(rawdata$year.begin - rawdata$year.end)
rawdata$month.begin = as.numeric(format(as.Date(rawdata$Begin.of.Period), "%m"))
rawdata$month.end = as.numeric(format(as.Date(rawdata$End.of.Period), "m"))
rawdata$day.span = as.Date(rawdata$Begin.of.Period) - as.Date(rawdata$End.of.Period)
rawdata$Year = as.numeric(format(as.Date(rawdata$Date), "%Y"))
rawdata$Month = as.numeric(format(as.Date(rawdata$Date), "%m"))

#check missing data ( "|" means, read "or", "$" read dollar means subset)
rows_missing_or_unreliable_info <- is.na(rawdata$H2) |
                                   is.na(rawdata$day.span) |
                                   rawdata$day.span > -25 |
                                   rawdata$day.span < -35

#only keep the rows and collumns that we are interested in
columns_to_keep = c ("Site", "Latitude", "Longitude", "Altitude", "Year", "Month", "H2")
gnip.data = rawdata[!rows_missing_or_unreliable_info,columns_to_keep] #"!" means unary

#turn the variable site into factor
gnip.data$Site = as.factor(gnip.data$Site)

#rename the columns to conform to the general IsoriX format and check that the data seem correct
colnames(gnip.data) = c("source_ID", "lat", "long", "elev", "year", "month", "source_value")
head(gnip.data) #check
str(gnip.data) #with the data I have, currently it have 75657 obs of 7 variables

#the data structure have to be similar with GNIPDataDE (look at the first code above)

# processing the raw data
gnip.data #recall our dataset name from above raw data processing
gnip.data.agg = prepsources(data = gnip.data, long_min = 12, long_max = 34,
                        lat_min = 56, lat_max = 78) #change the value

gnip.data.agg #check data structure and ensure it follows the format

# fitting  geostat model

worldfit = isofit(data = gnip.data.agg, mean_model_fix = list(elev = TRUE, lat_abs = TRUE))
#saving
save(worldfit, file = "worldfit.rda", compress = "xz")

#loading the saved object
load(file = "worldfit.rda")

plot(worldfit)

worldfit

AIC(worldfit$mean_fit)
AIC(worldfit$disp_fit)

# get elevation data
getelev(file = "input/elevation_world_z10.tif") #adjust z value for different resolution

# import the elevation raster data
elevworld = raster("input/elevation_world_z10.tiff") #import it

elevworld #check

plot(elevworld)

# resize elevation raster

elevabc = prepraster(raster = elevworld, isofit = worldfit, aggregation_factor = 2) #use aggregation factor as low as possible, but start from large to small (10 to 1, 1 is recommended)
elevabc

# Construct the isoscape
isoscape = isoscape (raster = elevabc, isofit = worldfit)

# plot 
plot(isoscape)

plot(isoscape, which = "mean_residVar")

plot(isoscape, which = "mean_predVar")

#####
# continue to geog assignment



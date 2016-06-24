# sea_surface_temperature_10years
An interactive map representing the sea surface temperature of 2005-2015

### Approach:

* Downloading data from [NOAA](http://neo.sci.gsfc.nasa.gov/view.php?datasetId=MYD28M&date=2007-01-09) for 10 years i.e., 2005-2015
* Setting up all [libraries and utilities]
(https://gist.github.com/jothirnadh/11c9b11f10674ffea390e3e493ad86ed#step-1-preliminaries)
* Clipping the downloaded `tiff` files to responsible latitudes and longitudes

   `parallel rio clip {} clip/{/} --bounds -180.0 -70.0 180.0 70.0  ::: global/*.tif`
* Changing the projection to web mercator projection

   `parallel gdalwarp {} mercator/{/} -t_srs EPSG:3857 -co COMPRESS=DEFLATE -r bilinear -ts 2048 1138 ::: clip/*.tif`
* Selected the following colour composite for the visualization 

`#f5f5f5,#E59D73,#0089BA,#007270,#EE0000,#0D8977,#2F9F78,#54B575,#7DCA6E,#ABDD65,#DEEE5F` 

The above color composite is applied in the [pre-exising code lil code](https://github.com/mapbox/weather-data/blob/7bec12cff5f04db3f0d6be96818b9f64d9638bce/huracan/make_color.py) and save it as a text file (python make_color.py > color_ramp.txt).

* Colorize the `tiff` files

  `parallel gdaldem color-relief {} color-ramp.txt color/{/} ::: mercator/*.tif`

* Converting `tiff` to `png`

  `parallel rio convert {} pngs/{/.}.png --format PNG ::: color/*.tif`

* Animate `png` files using [`ffmpeg` library](https://gist.github.com/jothirnadh/11c9b11f10674ffea390e3e493ad86ed#animate)
* Providing Interactivity to map using [mapbox GL JS](https://www.mapbox.com/mapbox-gl-js/api/) following this [script](https://gist.github.com/jothirnadh/11c9b11f10674ffea390e3e493ad86ed#add-your-data-to-the-map)

### Outcome:

* [Interactive map representing SST from 2005-2015](http://jothirnadh.github.io/sea_surface_temperature_10years/)

[![ezgif com-optimize](https://cloud.githubusercontent.com/assets/17470597/15252227/7b703b88-194a-11e6-82fa-fbefe71bfea7.gif)](http://jothirnadh.github.io/sea_surface_temperature_10years/)

\name{PolyLines2GE}
\alias{PolyLines2GE}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Producing 2D / 3D lines / polygons in Google Earth
}
\description{
The function produces lines-based objects into Google Earth. This allows drawing open or closed polygons with custom shapes. Many parameters allow a fine tuning of the rendered objects.
}
\usage{
PolyLines2GE(coords, nesting = 0, maxAlt = 10000, goo = "Lines2GE.kml", colors = "blue", extrude = 0, fill = FALSE, lwd = 1, closepoly = FALSE)
}
\arguments{
  \item{coords}{
Array of geographical positions that define each line / polygon edges (latitude, longitude, in Decimal Degrees). The coordinates must be provided following counterclockwise order if you wish to draw closed polygons (this is actually required by Google Earth, in order to obtain a proper colors rendering).
}
  \item{nesting}{
Vector for identifying distinct lines / polygons, must correspond to "coords" and should be designated as numbers. The resulting lines / polygons are then stored into distinct folders. If used, this option expects that one color is defined for each nesting level (see color parameter below).
}
  \item{maxAlt}{
The height (ceiling altitude) of the lines / polygons (one maxAlt per line / polygon or one maxAlt for all lines / polygons). Note that point specific altitudes can be declared (maxAlt then includes the altitudes of all points in "coords")
}
  \item{goo}{
Name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
  \item{colors}{
Vector of colors (if the nesting option is used, define one color per line / polygon; if no nesting is specified, the same color is applied on all lines / polygons). Must be defined as hexadecimal values (as produced by usual R color palettes); leave to "auto" to get rainbow colors
}
  \item{extrude}{
3D rendering: 1 = extend polygon vertical faces to the ground, 0 = draw only polygon.
}
  \item{fill}{
Polygon rendering: T = fill polygon with "colors", F = draw polygon as lines, using "colors".
}
  \item{lwd}{
Lines rendering: line width (one width per line / polygon or one width for all lines / polygons).
}
  \item{closepoly}{
Polygon rendering: T = will close all polygons, F = keeps open polygons.
}
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{
\code{\link{contourLines}}
}
\examples{
###Drawing lines
###Drawing closed polygons
#Prepare fake data
pol1 = rbind(c(1,1,1e5), c(1,2,2e5), c(2,2,3e5), c(3,3,4e5))
pol2 = rbind(c(1,1,1e5), c(2,2,2e5), c(3,3,1e5), c(4,4,2e5))

coords = rbind(pol1, pol2)
nesting = rep(c(1,2), each = 4)

#data to be displayed
fakedata = cbind(nesting, coords)
colnames(fakedata) = c("nesting", "Lon", "Lat", "Alt")
fakedata

#Producing KML - all points are at the same altitude
PolyLines2GE(coords = fakedata[, 2:3], 
	nesting = fakedata[, 1], 
	colors = "auto",
	goo = "Lines2GE_V1a.kml", 
	maxAlt = 1e4, 
	fill = FALSE,
	closepoly = FALSE,
	lwd = 2,
	extrude = 0)

#Producing KML - all points, from a same line share the same altitude
PolyLines2GE(coords = fakedata[, 2:3], 
	nesting = fakedata[, 1], 
	colors = "auto",
	goo = "Lines2GE_V1b.kml", 
	maxAlt = c(1e4, 1e5), 
	fill = FALSE,
	closepoly = FALSE,
	lwd = 2,
	extrude = 0)

#Producing KML - Each point has its own altitude
PolyLines2GE(coords = fakedata[, 2:3], 
	nesting = fakedata[, 1], 
	colors = "auto",
	goo = "Lines2GE_V1c.kml", 
	maxAlt = fakedata[, 4], 
	fill = FALSE,
	closepoly = FALSE,
	lwd = 2,
	extrude = 0)



###Drawing closed polygons
#Prepare fake data
pol1 = rbind(c(1,1), c(1,2), c(2,2), c(2,1))
pol2 = (2 * pol1) - 0.5

coords = rbind(pol1, pol2)
coords = coords[ nrow(coords) : 1,]

nesting = rep(c(1,2), each = 4)

#data to be displayed
fakedata = cbind(nesting, coords)
fakedata

#Producing KML - the easy way
PolyLines2GE(coords = fakedata[, 2:3], 
	nesting = fakedata[, 1], 
	colors = "auto",
	goo = "Poly2GE_V1.kml", 
	maxAlt = 0, 
	fill = FALSE,
	closepoly = TRUE,
	lwd = 2,
	extrude = 0)

#Producing KML - the easy way, polygons at distinct heights
PolyLines2GE(coords = fakedata[, 2:3], 
	nesting = fakedata[, 1], 
	colors = "auto",
	goo = "Poly2GE_V1b.kml", 
	maxAlt = c(1e4, 1e5), 
	fill = FALSE,
	closepoly = TRUE,
	lwd = 2,
	extrude = 0)

#Producing KML - with filled polygon
PolyLines2GE(coords = fakedata[, 2:3], 
	nesting = fakedata[, 1], 
	colors = "auto",
	goo = "Poly2GE_V2.kml", 
	maxAlt = 0, 
	fill = TRUE,
	closepoly = TRUE,
	lwd = 2,
	extrude = 0)

#Producing KML - with polygon extruded from ground
PolyLines2GE(coords = fakedata[, 2:3], 
	nesting = fakedata[, 1], 
	colors = "auto",
	goo = "Poly2GE_V3.kml", 
	maxAlt = c(1e4, 1e5), 
	fill = TRUE,
	closepoly = TRUE,
	lwd = 2,
	extrude = 1)



###Drawing a contour plot using the PolyLines2GE function:
#Prepare data
data(volcano)
lat = seq(1, 6, length.out = nrow(volcano))
lon = seq(1, 6, length.out = ncol(volcano))

#Get contour lines
cont = contourLines(lat, lon, volcano, nlevels = 20)

#Convert them into Lines2GE input format
cont.data = NULL
for(i in 1:length(cont)){
  subs = cont[[i]]
  tmp = cbind(i, subs$x, subs$y)
  cont.data = rbind(cont.data, tmp)
  }

#Produce KML
PolyLines2GE(coords = cont.data[, 2:3], 
	nesting = cont.data[, 1], 
	colors = "auto",
	goo = "Contour2GE_V1.kml", 
	maxAlt = seq(1e4, 1e5, length.out = length(cont)), 
	fill = FALSE,
	closepoly = FALSE,
	lwd = 2,
	extrude = 0)

}


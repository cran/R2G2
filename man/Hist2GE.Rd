\name{Hist2GE}
\alias{Hist2GE}
\title{
Producing 3D histograms in Google Earth
}
\description{
The current implementation produces Google Earth 3D histograms to i) count the number of distinct entities (e.g. species) per spatial unit (regional species diversity) or ii) count the number of occurrences of each entity per spatial unit (regional species abundance, detailled for each species). 
}
\usage{
Hist2GE(coords, species = 0, grid, goo, nedges, orient, maxAlt = 1e+05, colors = "auto", ...)
}
\arguments{
  \item{coords}{
An array of geographical positions of observations (lines = observation, columns = lon & lat in Decimal Degrees).
}
  \item{species}{
A corresponding vector qualitatively describing each observation (typically the taxonomic species identity).
}
  \item{grid}{
The precomputed spatial grid to be used. Choose among grid50, grid500, grid5000, grid10000 or grid20000 to get the needed number of points on the earth surface, see examples below. Technically, any set of equally spaced points can be used as long as the provided grid complies with the format used in ?grid50.
}
  \item{goo}{
Name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
  \item{nedges}{
The number of desired edges (3 -> triangle, 4 -> square, etc) for drawing the histograms.
}
  \item{orient}{
The rotation factor of histograms (in degrees).
}
  \item{maxAlt}{
The maximum height (ceiling altitude) of the histograms.
}
  \item{colors}{
Vector of colors corresponding to each species (one color per species), must be defined as hexadecimal values (as produced by usual R color palettes); leave to "auto" to get rainbow colors.
}

  \item{...}{
Any additional arguments used internally.
}
}

\details{
The computations are based on a set of precomputed grids, where each cells are equally spaced and cover equal earth areas. The cell locations were obtained using the EQSP matlab library (Paul Leopardi). Each observation is first assigned to its closest neighbouring cell, then Hist2GE outputs cell-based statistics.
}
\value{
Two KML files (regional species richness and detailled species abundance) are produced in the current working directory. The function also outputs all these cell-based statistics as an array.
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{
\code{
\link{Shapes2GE}
\link{GetEdges}
\link{grid50}
}
}
\examples{
###Using Hist2GE: the easy way
#Produce fake species occurrences
coords = cbind(rnorm(210, 6.32, 5), rnorm(210, 46.75, 5))
coords = coords[order(coords[,1]), ]
species = rep(c("sp1", "sp2", "sp3"), each = 70)

#Choose grid
data(grid10000) # choose among grid50, grid500, grid5000, grid1000, grid20000
grid = grid10000

Hist2GE(coords = coords, 
	species = species,
	grid = grid, 
	goo = "Jura", 
	nedges = 6,
	orient = 45,
	maxAlt = 1e5)


###Using Hist2GE: using custom grids, when working at local scale (not accounting for earth curvature)
#Produce fake species occurrences
coords = cbind(rnorm(210, -110.954795, 0.1), rnorm(210, 32.228724, 0.1))
coords = coords[order(coords[,1]), ]
species = rep(c("sp1", "sp2", "sp3"), 70)

#Define the resolution (cell width, decimal degrees) 
cellwdth = 0.02

#And produce the desired grid automatically
lonrange = range(coords[, 1])
if(sum(sign(lonrange)) == -2){
 lonwdth = -cellwdth
 }else{
 lonwdth = cellwdth
 }

latrange = range(coords[, 2])
if(sum(sign(latrange)) == -2){
 latwdth = -cellwdth
 }else{
 latwdth = cellwdth
 }

lonLeft = lonrange[1] - 0.01 * lonrange[1]
lonRight = lonrange[2] + 0.01 * lonrange[2]
latBottom = latrange[1] - 0.01 * latrange[1]
latTop = latrange[2] + 0.01 * latrange[2]

#Produce cell coordinates along lon and lat axes
lonmarks = seq(lonLeft, lonRight, by = lonwdth)
latmarks = seq(latBottom, latTop, by = latwdth)

#Produce complete grid
lonDD = rep(lonmarks, length(latmarks))
latDD = rep(latmarks, each = length(lonmarks))
gridDD = cbind(lonDD, latDD)

#Convert it to radians centered and formated as in a "grid50" array
DD2Rad = function(lon, lat){
  lonrad = (lon + 180) * pi/180
  latrad = (lat + 90) * pi/180
  cbind(lonrad, latrad)
  }
MyGridDD = cbind(lonDD, latDD)
MyGridRad = DD2Rad(MyGridDD[, 1], MyGridDD[, 2])
MyGridRad = data.frame("Num" = 1:nrow(MyGridRad), 
                       "lon" = MyGridRad[, 1], 
                       "lat" = MyGridRad[, 2]) #this step is only cosmetic and necessary for compatibily issues.

#Run Hist2GE
Hist2GE(coords = coords, 
  species = species,
	grid = MyGridRad, 
	goo = "Tucson", 
	nedges = 4,
	orient = 45,
	maxAlt = 5e3)
  
}

\keyword{ google earth }
\keyword{ histogram }

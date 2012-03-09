\name{Pies2GE}
\alias{Pies2GE}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Producing 3D pie-charts in Google Earth
}
\description{
This function produces Google Earth 3D pie charts from geographical locations and frequency counts. The pie charts are displayed as regular n-sided polygons.
}
\usage{
Pies2GE(center, obs, nesting = 0, goo = "Pies2GE.kml", colors = "auto", nedges = 20, orient = 0, maxAlt = 10000, radius = 50000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{center}{
An array of geographical position for pies (lines = pies, columns = longitude and latitude in decimal degrees).
}
  \item{obs}{
Array of numerical and non-negative quantities that will be displayed in each the pie slices. This is is typically a pivot table with lines = pies and columns = quantities to plot within pies.
}
  \item{nesting}{
Vector for grouping the pies / pie slices into handy folders / subfolders (optional). The groups must be designated as numbers. The default nesting (nesting = 0) groups pie slices according to their color.
}
  \item{goo}{
Name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
  \item{colors}{
Vector of colors corresponding to each species (one color per species), must be defined as hexadecimal values (as produced by usual R color palettes); leave to "auto" to get rainbow colors.
}
  \item{nedges}{
The number of edges, defining the general shape of the pie (3 -> triangle, 4 -> square, etc).
}
  \item{orient}{
the rotation factor of the pie-chart (in degrees).
}
  \item{maxAlt}{
the height (ceiling altitude) of the pies.
}
  \item{radius}{
The pie radius (in meters).
}
}
\details{
The shape parameters (nedges, orient, radius and maxAlt) can be either a single value, that will be applied to all pies, or detailled values for each pie.
}
\value{
A KML file is produced in the current working directory.
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{
\code{
\link{curvy}
\link{GetEdges}
\link{FancyPies}
\link{table}
\link{aggregate}
}
}
\examples{
## Preparing fake matrix
center = cbind(1:6, 1:6)
obs = cbind(1:6, 6:1, 1:6) #actual observations to be plot as a pie chart
nesting = rep(1:3, each = 2)
 
## data to be pie-charted
fakedata = cbind(nesting, center, obs)
colnames(fakedata) = c("Group","Lon","Lat","Slice1","Slice2","Slice3")
fakedata

## Producing KML - group pie slices according to color
Pies2GE(center = fakedata[, 2:3], 
	obs = fakedata[, 4:ncol(fakedata)], 
	nesting = fakedata[, 1], 
	goo = "Pies2GE_V1.kml", 
	nedges = 20, 
	orient = 0, 
	maxAlt = 1e4, 
	radius = 5e4)

## Producing KML - as before but also tweeking the shape / radius / height and color of each pie
Pies2GE(center = fakedata[, 2:3], 
	obs = fakedata[, 4:ncol(fakedata)], 
	nesting = 0, 
	goo = "Pies2GE_V2.kml", 
	nedges = c(3, 3, 4, 4, 20, 20), 
	orient = 0, 
	colors = topo.colors(ncol(obs)),
	maxAlt = c(3e4, 3e4, 5e4, 5e4, 1e5, 1e5), 
	radius = c(3e4, 3e4, 4e4, 4e4, 5e4, 5e4))

## Producing KML - group pies according to external information (experimental)
Pies2GE(center = fakedata[, 2:3], 
	obs = fakedata[, 4:ncol(fakedata)], 
	nesting = fakedata[, 1], 
	goo = "Pies2GE_V1.kml", 
	nedges = 20, 
	orient = 0, 
	maxAlt = 1e4, 
	radius = 5e4)
}
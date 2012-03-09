\name{Shapes2GE}
\alias{Shapes2GE}
\title{
Producing 3D regular polygons in Google Earth
}
\description{
This function produces 3D regular polygons in Google Earth.
}
\usage{
Shapes2GE(center, nesting = 0, goo = "Shapes2GE.kml", nedges = 20, orient = 0, colors = "blue", maxAlt = 10000, radius = 50000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{center}{
An array of geographical position for pies (lines = pies, columns = longitude and latitude in decimal degrees).
}
  \item{nesting}{
Vector for grouping the shapes into handy folders / subfolders (optional). Must correspond to "center" and the groups should be designated as numbers.
}
  \item{goo}{
Name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
  \item{nedges}{
The number of edges, defining the general shape of the polygon (3 -> triangle, 4 -> square, etc).
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
  \item{colors}{
Vector of colors (will correspond to nesting groups, so define one color per group, and not one color per shape), must be defined as hexadecimal values (as produced by usual R color palettes); leave to "auto" to get rainbow colors.
}
}
\value{
A KML file is produced in the current working directory.
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{GetEdges, Hist2GE, Pies2GE
\code{
\link{GetEdges}
\link{Hist2GE}
\link{Pies2GE}
}
}
\examples{

######Demo script
#Preparing fake matrix
center = cbind(1:6, 1:6)
nesting = rep(1:3, each = 2)

# data to be displayed
fakedata = cbind(nesting, center)
fakedata

#Producing KML - the easy way
Shapes2GE(center = fakedata[, 2:3], 
	  nesting = 1, 
	  colors = "#0000FFFF",
	  goo = "Shapes2GE_V1.kml", 
	  nedges = 20, 
	  orient = 0, 
	  maxAlt = 1e4, 
	  radius = 5e4)

#Producing KML - the very easy way
Shapes2GE(center = fakedata[, 2:3], 
	  nesting = fakedata[, 1], 
	  colors = "auto", #just define your groups and let it get the colors
	  goo = "Shapes2GE_V1b.kml", 
	  nedges = 20, 
	  orient = 0, 
	  maxAlt = 1e4, 
	  radius = 5e4)

#Producing KML - one param per shape
Shapes2GE(center = fakedata[, 2:3], 
	  nesting = c(1, 1, 2, 3, 3, 3), 
	  colors = c("#0F00FFFF","#00FF00FF","#FF0000FF"), #do it yourself
	  goo = "Shapes2GE_V2.kml", 
	  nedges = c(3, 3, 4, 4, 5, 5), 
	  orient = 0, 
	  maxAlt = 1e4, 
	  radius = 5e4)
}
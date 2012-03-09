\name{FancyPies}
\alias{FancyPies}
\title{
Computes the edges of any regular n-sided figure in spherical coordinates and adds a pie chart within it
}
\description{
Provides coordinates for one pie chart, this function must be iterated to produce several pies.
}
\usage{
FancyPies(center, obs, nedges = 3, radius = 5e4, orient = 0, diag = FALSE)
}
\arguments{
  \item{center}{
The geographical position of the pie as c(lon, lat) in decimal degrees.
}
  \item{obs}{
Vector of numerical and non-negative quantities that will be displayed as the pie slices (typically produced using table()).
}
  \item{nedges}{
The number of desired edges (3 -> triangle, 4 -> square, etc).
}
  \item{radius}{
The pie radius (in meters).
}
  \item{orient}{
The rotation factor of the fig (in degrees).
}
  \item{diag}{
Produce diagnostic plot for checking purposes (True or False).
}
}
\details{
This function is wrapped within Pies2GE; see below.
}
\value{
Provides an array of coordinates for drawing the pie chart as polygons (lines = points delimiting the pie sectors, columns = sector number, lon, lat in decimal degrees).
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{
\code{
\link{curvy}
\link{GetEdges}
\link{Pies2GE}
}
}
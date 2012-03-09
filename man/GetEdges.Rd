\name{GetEdges}
\alias{GetEdges}
\title{
Computing the edges of any n-sided regular polygon on a sphere
}
\description{
Provides the edges coordinates for one n-sided regular polygon, corrected to account for the earth curvature.
}
\usage{
GetEdges(center, radius, nedges, orient = 45)
}
\arguments{
  \item{center}{
The geographical position of the polygon as c(lon, lat) in decimal degrees.
}
  \item{radius}{
The polygon radius (in meters).
}
  \item{nedges}{
The number of edges (3 -> triangle, 4 -> square, etc).
}
  \item{orient}{
The rotation factor of the polygon (in degrees).
}
}
\details{
Earth-curvature corrections are assuming a sphere, hence expect some deformations near to the poles. In addition, polygons that overlap with the poles will have missing values (i.e. when center coordinates + radius lead to overeach a pole).
}
\value{
Provides an array of coordinates for the n-edges defining the desired polygon (lines = points delimiting the polygon, columns = lon, lat in decimal degrees).
}
\references{
This function was retrieved as a PHP code from http://blog.thematicmapping.org/ 
This is an amazing blog; the R2G2 dvpt team thanks a lot Bjorn Sandvik for his outstanding implementations in Google Earth, and for sharing his great ideas and resources. GetEdges is actually an R implementation of his material.
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{
\code{
\link{Hist2GE}
\link{Pies2GE}
\link{Shapes2GE}
\link{curvy}
}
}
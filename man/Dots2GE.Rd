\name{Dots2GE}
\alias{Dots2GE}
\title{
Automated placement of observations, as dots, in Google Earth
}
\description{
Produces KML files where observations are displayed as pushpins.
}
\usage{
Dots2GE(coords, plnms, goo = "Dots2GE.kml")
}
\arguments{
  \item{coords}{
An array of geographical positions of observations (lines = observation, columns = lon & lat in decimal degrees).
}
  \item{plnms}{
Observations labels (text).
}
  \item{goo}{
Name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
}
\value{
A KML file is produced in the current working directory.
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\examples{
labels = c("A","B","C","D","E","F") 
coords = cbind(1:6, 1:6)
Dots2GE(coords, labels, goo = "Dots2GE_V1.kml")
}
\keyword{ Google Earth }
\keyword{ points }

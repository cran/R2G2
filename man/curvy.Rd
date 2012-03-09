\name{curvy}
\alias{curvy}
\title{
curvy - internal function to compute spherical coordinates of points along an arc
}
\description{
An arc is defined by startDD and stopDD, the coordinates of its limit points (decimal degrees). New points are computed according to f, i.e. the fraction at which the desired point is located along the arc (f varies between 0 -> startDD to 1 -> stopDD)
}
\usage{
curvy(f, startDD, stopDD)
}
\arguments{
  \item{f}{
Fraction of arc at which the desired point is located. f varies between 0 and 1, to generate points located between startDD and stopDD)
}
  \item{startDD}{
Geographical location of starting point of the arc (longitutde, latitude in decimal degrees).
}
  \item{stopDD}{
Geographical location of stoping point of the arc (longitutde, latitude in decimal degrees).
}
}
\value{
The geographical coordinates of the desired point (longitude, latitude in decimal degrees).
}
\references{
The original function was actually proposed by Rod Page on http://iphylo.blogspot.com/
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson 
}
\examples{
startDD = c(1, 5)
stopDD = c(5, 1)
curvy(0.5, startDD, stopDD)
}
\keyword{ arc }
\keyword{ midpoints }

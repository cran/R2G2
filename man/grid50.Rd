\name{grid50}
\alias{grid50}
\alias{grid500}
\alias{grid5000}
\alias{grid10000}
\alias{grid20000}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Grids partitioning the surface of Earth into n equal areas.
}
\description{
Sets of precomputed grids that partition the Earth's surface into equal areas.
}
\usage{
data(grid50)
}
\details{
The available grids provide 50, 500, 5000, 10'000 and 20'000 equal area cells. The coordinates are given in radians. They can be converted into lat / lon decimal degrees using the code provided as an example.
}
\references{
http://eqsp.sourceforge.net/ 
https://etna.mcs.kent.edu/vol.25.2006/pp309-327.dir/pp309-327.html

Leopardi, P. "A partition of the unit sphere into regions of equal area and small diameter" (2006). Electronic Transactions on Numerical Analysis 25:309-327. 
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\examples{
data(grid50)

lon = 360 * round((grid50[, 2] / (2 * pi)), 5) - 180 + 0.01
lat = 180 * round(grid50[, 3] / pi, 5) - 90 + 0.01
grid = data.frame(lon = lon, lat = lat)
}


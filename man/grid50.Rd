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
#Converting grid50 (radians) to usual decimal degrees
data(grid50)
Rad2DD = function(lon, lat){
  lonDD = 360 * round((lon / (2 * pi)), 5) - 180 + 0.01
  latDD = 180 * round(lat / pi, 5) - 90 + 0.01
  cbind(lonDD, latDD)
  }
grid50DD = Rad2DD(grid50[,2], grid50[, 3])
grid50DD

#Converting decimal degrees to grid50 format (radians and properly centered)
DD2Rad = function(lon, lat){
  lonrad = (lon + 180) * pi/180
  latrad = (lat + 90) * pi/180
  cbind(lonrad, latrad)
  }
grid50Rad = DD2Rad(grid50DD[ ,1], grid50DD[ ,2])  
grid50Rad = data.frame("1", grid50Rad) #this step is only cosmetic and necessary for compatibily issues.
grid50Rad
}



\name{Phylo2GE}
\alias{Phylo2GE}
\title{
Producing 3D Phylogenies in Google Earth
}
\description{
The function converts a phylogenetic tree and the corresponding geographical coordinates of its taxa into a KML that can be displayed into Google Earth.
}
\usage{
Phylo2GE(geo, phy, resol = 0.1, minAlt = 1e+04, maxAlt = 2e+06, goo = "Phylo2GE.kml")
}
\arguments{
  \item{geo}{
Matrix of geographical centroids for each taxa. Lines = taxa, columns = species name (as in phylogeny), lon and lat in decimal degrees.
}
  \item{phy}{
Phylogenetic tree, as imported using read.tree (ape).
}
  \item{resol}{
Drawing resolution of arcs in the phylogeny. Each horizontal arc will be divided in 1/resol subarcs.
}
  \item{minAlt}{
Altitude of tips, as displayed in Google Earth (in meters).
}
  \item{maxAlt}{
Altitude of root ancestral node, as displayed in Google Earth (in meters).
}
  \item{goo}{
Name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
}
\details{
Phylo2GE matches the phy and geo objects, according to taxa names. This matching cares for differential sorting of the phy and geo objects. This property also allows focusing on tree subclades without needing to update the geo array.
}
\value{
A KML file is produced in the current working directory.
}
\references{
KML conversions of phylogenies were first seen in Mesquite (http://mesquiteproject.org/mesquite/mesquite.html) and on Rod Page's blog http://iphylo.blogspot.com/
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{
\code{
\link{aggregate}
\link{curvy}
}
}
\examples{
# uncomment to use
# require(ape)
# require(picante)
# geo = data.frame(taxa = c("D", "E", "A", "B", "C", "F"), 
#	 lon = c(9.291113, 23.18146, 75.274541, -8.653739, 11.622450, 12.622450),
#	 lat = c(8.774068, 4.581856, 48.078570, 10.966451, 28.722732, 29.722732))
# geo

# phy = "(((B:0.41,C:0.31):0.65,(D:0.21,E:0.11):0.75):0.85,A:0.51);"
# phy = read.tree(text = phy)

# Phylo2GE(geo, phy, resol = .05, goo = 'Phylo2GE.kml')
}

\keyword{ phylogeny }
\keyword{ google earth }
\keyword{ geographical }
\keyword{ three dimension }

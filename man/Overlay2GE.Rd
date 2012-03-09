\name{Overlay2GE}
\alias{Overlay2GE}
\title{
Automated placement of an overlayed image in Google Earth
}
\description{
Produces a KML file from a set of coordinates (the NSEW limits of the image to overlay) and the image name.
}
\usage{
Overlay2GE(coords, image = "/home/Images/myimage.jpg", goo = "Overlay2GE.kml")
}
\arguments{
  \item{coords}{
The image boundary coordinates (declared in decimal degrees with the following order: N, S, E and W)
}
  \item{image}{
The image name (if in working directory) or complete path of the image to map. At least *.jpg and *.png are supported by Google Earth.
}
  \item{goo}{
Name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}

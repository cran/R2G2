\name{R2G2-package}
\alias{R2G2-package}
\alias{R2G2}
\docType{package}
\title{
Converting R CRAN outputs into Google Earth.
}
\description{
This package includes a set of functions for producing basic and complex representations into Google Earth, via KML files.
}
\details{
\tabular{ll}{
Package: \tab R2G2\cr
Type: \tab Package\cr
Version: \tab 1.0-1\cr
Date: \tab 2012-10-02\cr
License: \tab LGPL\cr
LazyLoad: \tab yes\cr
}
Basic features: functions to overlay R CRAN plots, dots, lines, custom and regular polygons into Google Earth. Complex features: histograms, pie-charts, contour plots and phylogenies into Google Earth.

## End-user functions:
\code{Phylo2GE - Producing 3D Phylogenies in Google Earth (requires ape and picante)}
\code{Hist2GE - Producing 3D histograms in Google Earth}
\code{Pies2GE - Producing 3D pie-charts in Google Earth}
\code{PolyLines2GE - Producing 2D / 3D lines / polygons in Google Earth}
\code{Shapes2GE - Producing 3D regular polygons in Google Earth}
\code{Plots2GE - Georeferencing custom R plots into Google Earth}
\code{Dots2GE - Automated placement of observations, as dots, in Google Earth}
\code{Axis2GE - Automated placement of a Y-axis in Google Earth}
\code{Overlay2GE - Automated placement of an overlayed image in Google Earth}

## Internal functions:
\code{curvy - Compute spherical coordinates of points along an arc}
\code{GetEdges - Compute the edges of any n-sided regular polygon on a sphere}
\code{FancyPies - Compute the edges of any regular n-sided figure in spherical coordinates and adds a pie chart within it}

}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\keyword{ Google Earth }
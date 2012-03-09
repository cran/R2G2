\name{Plots2GE}
\alias{Plots2GE}
\title{
Georeferencing custom R plots into Google Earth
}
\description{
Plots2GE: Places PNG R plots on Google Earth, as KML files.
}
\usage{
Plots2GE(data, center, nesting = 0, customfun, goo = "Plots2GE.kml", testrun = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
Dataset used for producing the plots (will be the input of your customfun, see below).
}
  \item{center}{
Matrix including the longitude(s) and latitude(s) of point(s) where to locate plots (decimal degrees). Must correspond to "data", with same number and ordering of observations.
}
  \item{nesting}{
Location-specific identifier, used to group the data into location-specific subsets and produce location specific plots. Must correspond to "data", with same number and ordering of observations.
}
  \item{customfun}{
User-defined function to produce the plots, see details.
}
  \item{goo}{
Name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
  \item{testrun}{
Diagnositc mode. T (will run only at the screen, for checking purposes) or F (will produce actual plots as png files for Google Earth).
}
}
\details{
The user needs to declare a function where the input is the "data" matrix, and the output is a plot.
Plots2GE will then apply this function to any location-specific subset (the locations being defined using the "nesting" parameter). 
Any function is possible, just keep in mind that Plots2GE will apply it in a location-specific way
}
\value{
A KML file is produced in the current working directory.
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{
\code{
\link{par}
\link{plot}
}
}
\examples{
## Preparing fake matrix
center = cbind(1:6, 1:6)
nesting = rep(1:3, each = 2)
fakeVar1 = rnorm(300, 0, 1)
fakeVar2 = rnorm(300, 0, 1)

fakematrix = data.frame(nesting, center, fakeVar1, fakeVar2)
fakematrix


## Preparing a user-defined function for producing the desired plots
myfun = function(input){
  plot(input[, 4], input[, 5], xlab='Xlab label', ylab='Ylab label', type = 'n', bty = 'n')
  points(input[, 4], input[, 5], col='red', pch = 16, cex = 2)
  }
 
 
## Producing KML - the easy way
Plots2GE(data = fakematrix,
	 center = fakematrix[, 2:3], 
	 nesting = fakematrix[, 1], 
	 customfun = myfun,
	 goo = "Plots2GE_V1.kml",
	 testrun = FALSE)
}

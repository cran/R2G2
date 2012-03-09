\name{Axis2GE}
\alias{Axis2GE}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Adding a custom Y-axis in Google Earth.
}
\description{
The function adds a Y-axis into Google Earth. Can be used to either generate a KML file or can be embedded into other R2G2 functions.
}
\usage{
Axis2GE(coords, maxVal, maxAlt = 1e5, lwd = 2, apnd = TRUE, goo = "testAxis.kml")
}
\arguments{
  \item{coords}{
Geographical position of the axis (latitude, longitude, in Decimal Degrees).
}
  \item{maxVal}{
The maximum value of the Y-axis (i.e. the largest observation).
}
  \item{maxAlt}{
The height (ceiling altitude) of the Y-axis into Google Earth (in meters).
}
  \item{lwd}{
Line widths used to draw the axis.
}
  \item{apnd}{
Should the Y-axis be appended to an existing KML that is under production (append = TRUE, to be used if Axis2GE is embedded in another KML generating function, see details) or should it be saved in its own KML file (append = FALSE)?
}
  \item{goo}{
To be provided if apnd = FALSE, name of the KML file to that will be saved into the working directory (use getwd() to find it).
}
}
\details{
If apnd == TRUE, Axis2GE will provide a list containing the style (bloc1) and data (bloc2) sections of a standard KML file. These sections are then to be incorporated directly into the KML file being generated.
}
\author{
Nils Arrigo, nils.arrigo@gmail.com                                          
2012 EEB, the University of Arizona, Tucson
}
\seealso{
\code{\link{contourLines}}
}
\examples{
# Producing an axis as an additional KML file
Axis2GE(coords = c(1,1),
	maxVal = 6698, 
	maxAlt = 1e5, 
	lwd = 2, 
	apnd = FALSE, 
	goo = "Demo_Axis2GE.kml")

# Producing an axis, but storing the KML sections for later use
DemoAxis = Axis2GE(coords = c(1,1),
		   maxVal = 6698, 
		   maxAlt = 1e5, 
		   lwd = 2, 
		   apnd = TRUE)
attributes(DemoAxis) #check out the contents of the obtained list
DemoAxis$bloc1 #get the styles section
DemoAxis$bloc2 #get the coordinates section
}


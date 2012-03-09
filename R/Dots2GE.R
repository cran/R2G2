Dots2GE <-
function(coords, plnms, goo = 'Dots2GE.kml'){  
  Xs = coords[, 1]
  Ys = coords[, 2]

  ## internal function
  plmark.fun=function(plname, X, Y, ...){
    cat("<Placemark>", "\n", "<name>", plname, "</name>", "\n", file = goo, append = TRUE)  
    cat("<styleUrl>#msn_grn-pushpin</styleUrl>", "\n", file = goo, append = TRUE)
    cat("<Point>", "\n", file = goo, append=TRUE)
    cat("<coordinates>", X, "," ,Y, "</coordinates>", "\n", file = goo, append = TRUE, sep='')
    cat("</Point>", "\n", file = goo, append=TRUE)
    cat("</Placemark>", "\n", file = goo, append=TRUE)
    }


  ## internal function  
  plmrk.inj = function(i) plmark.fun(plnms[i], Xs[i], Ys[i])


  ## kml production
  assign('plnms', as.character(plnms), envir=.GlobalEnv)
  assign('Xs', Xs, envir=.GlobalEnv)
  assign('Ys', Ys, envir=.GlobalEnv)
  assign('goo', goo, envir=.GlobalEnv)

  cat("<?xml version=\"1.0\"?>\n<kml xmlns=\"http://earth.google.com/kml/2.0\">\n<Document>", file = goo, append = FALSE)
  cat("<description>Produced using Dots2GE R script</description>\n<name>R2G2 - Dots2GE</name>\n<open>0</open>", file = goo, append = TRUE)
  sapply(1:length(plnms), plmrk.inj)
  cat("</Document>", "\n", "</kml>", file = goo, append = TRUE)
  }


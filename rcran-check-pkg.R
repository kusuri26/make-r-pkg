##******************************************************************************
##
## make R package
## Open in the project
##
##******************************************************************************

library(devtools)
library(pkgdown)
library(roxygen2)

# pkg <- as.package("C:\\Users\\zhouy\\Documents\\002Rpkg\\Rcran-submit\\DiagProgMeta")
# check(document = TRUE, vignettes = FALSE,build_args = "--no-build-vignettes")

#### create manual

# system("R CMD Rd2pdf .")

## source package path (outside the package)
setwd("C:\\Users\\zhouy\\Documents\\002Rpkg\\Rcran-submit")

system("R CMD check --as-cran DiagProgMeta")


system("R CMD build DiagProgMeta")

setwd("~/002Rpkg/Rcran-submit")

# list.files(pattern = "\\.tar\\.gz$")   # confirm the exact file name
system("R CMD check DiagProgMeta_0.1.0.tar.gz")



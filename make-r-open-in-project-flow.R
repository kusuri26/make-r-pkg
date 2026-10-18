##******************************************************************************
##
## make R package
## Open in the project
##
##******************************************************************************

library(devtools)
library(pkgdown)
library(roxygen2)


#### check the whole package
## main: load pkg document and check pkg
##
document()
load_all()

check(document = TRUE, vignettes = FALSE,build_args = "--no-build-vignettes")
check_man()

# usethis::use_package("lifecycle")
# usethis::use_package("parallel")
# usethis::use_package("numDeriv")
# usethis::use_package("graphics")
# usethis::use_package("grDevices")
# usethis::use_package("stats")
# usethis::use_package("utils")
# usethis::use_package("metafor")
# usethis::use_package("metadat")

devtools::spell_check()
urlchecker::url_check()


devtools::check_win_devel()     # Windows + R-devel; results arrive by e-mail in ~30 min
devtools::check_mac_release()   # macOS
# rhub::rhub_check()              # Linux and others (needs a GitHub repo)


#### check container
install()

help(package="DiagProgMeta")
help("DiagProgMeta")
methods(class="sroc")
methods(class="srocsa")

# library(DiagProgMeta)
# example("surv.DiagProgMeta")
# example("plot.DiagProgMeta")
# exists("surv.DiagProgMeta")
example("surv.DiagProgMeta", package = "DiagProgMeta")


#### create manual
system("R CMD build .")
system("R CMD Rd2pdf .")
system("R CMD check --as-cran .")




library(spelling)
setwd("~/GitHub-Phsoft/pkg/DiagProgMeta")
spell_check_package()

get_wordlist()
update_wordlist()


## load data --> /data
##
# dat <- load("data/Ki67.rda")
# use_data(Ki67, overwrite = TRUE)


#### build website
## build github website --> /docs
## build this after installing the pkg


library(usethis)
usethis::use_gpl3_license()
## First of the first, install the latest pkg
## run Rmd to create MD
## then, reproduce md based on the revised Rmd
##
build_news()
build_readme()
build_site()


# use_build_ignore("docs")


## build vignette --> /doc
# use_vignette("ICHer91")
# build_vignettes()
# vignette(pkgdown::metadata)

## check and update environment
## https://rstudio.github.io/renv/articles/renv.html
library(renv)
renv::update()
renv::snapshot()
renv::status()
renv::restore()

# install.packages("pak")
# pak::pak("mephas/DiagProgMeta")


# system2("quarto", args = "--version", stdout = TRUE)

devtools::spell_check()   # review & add accepted words

# R CMD check --as-cran DiagProgMeta_1.0.1.tar.gz


#### create website

# Install released version from CRAN
# install.packages("pkgdown")
# Run once to configure your package to use and deploy pkgdown
# usethis::use_pkgdown_github_pages()


# Preview your site locally before publishing
# change MD and then create website
library(pkgdown)
build_site()

# usethis::use_github_actions()          # ensures the workflow exists
# usethis::use_github_actions_badge()    # inserts the badge in README
use_github_action("pkgdown")
# usethis::use_lifecycle()        # adds lifecycle + copies badge images

## check downloads
library(cranlogs)
cran_downloads(packages = "DiagProgMeta", when = "last-month")

## add badge into MD
# [![CRAN status](https://www.r-pkg.org/badges/version/DiagProgMeta)](https://cran.r-project.org/package=DiagProgMeta)
# [![CRAN downloads total](https://cranlogs.r-pkg.org/badges/grand-total/DiagProgMeta)](https://cran.r-project.org/package=DiagProgMeta)
# [![CRAN downloads last month](https://cranlogs.r-pkg.org/badges/last-month/DiagProgMeta)](https://cran.r-project.org/package=DiagProgMeta)

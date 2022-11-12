
# lrmodel

<!-- badges: start -->
[![codecov](https://codecov.io/gh/imingrui/lrmodel/branch/master/graph/badge.svg)](https://codecov.io/gh/imingrui/lrmodel)
<!-- badges: end -->

lrmodel package is designed to replicate existing R functions, `lm(...)` and `anova(...)`. With the goal of obtaining identical results with those functions, it aims to  

## Installation

``` r
# install lrmodel package
install.packages('devtools')
devtools::install_github('imingrui/lrmodel', build_vignettes = T)
# use lrmodel package
library("lrmodel")
# view vignettes
browseVignettes("lrmodel")
```

## Usage
``` r
library(lrmodel)
lr(mpg ~ hp + wt, mtcars)

#Call:
# lr(formula = mpg ~ hp + wt)
#
#
#Coefficients:
# (Intercept)          hp        wt
#    37.22727 -0.03177295 -3.877831


anova(mpg ~ hp + wt, mtcars)

#Call:
# anova(formula = mpg ~ hp + wt)

#Terms:
#                      hp       wt Residuals
#Sum of Squares  678.3729 252.6266  195.0478
#Deg. of Freedom        1        1        29
#
#Residual standard error: 2.593412
```

# More
If you encounter a bug, please contact me via [email](mailto:imingrui@umich.edu).


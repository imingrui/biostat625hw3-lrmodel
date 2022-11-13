
# lrmodel

<!-- badges: start -->
[![R-CMD-check](https://github.com/imingrui/lrmodel/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/imingrui/lrmodel/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/imingrui/lrmodel/branch/master/graph/badge.svg)](https://codecov.io/gh/imingrui/lrmodel)
<!-- badges: end -->

lrmodel package is designed to replicate a simplified version of existing R functions, `lm(...)`, `summary(...)`, `predict(...)`, and `anova(...)`. It currently works for both simple and multiple linear regression and is able to conduct ANOVA on a given data set.

## Installation

``` r
# install lrmodel package
install.packages('devtools')
devtools::install_github('imingrui/lrmodel', build_vignettes = T)
# use lrmodel package
library("lrmodel")
```

## Basic Usage
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
`help(lr)`, `help(summary_lr)`, `help(prediction)`, `help(anova)` and `browseVignettes("lrmodel")` are great resources for getting additional help!

If you encounter a bug, please do not hesitate to contact me via [EMAIL](mailto:imingrui@umich.edu)!


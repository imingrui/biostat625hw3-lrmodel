#' Analysis of Variance
#'
#' Generate ANOVA table of a fitted model.
#'
#' @param formula A formula with the form of response ~ predictors.
#' @param source A R data frame that contains the source data.
#'
#' @examples
#' anova(mpg ~ hp + wt, mtcars)
#'
#' @export
#'
#'

anova <- function(formula, source) {
  # remove NA rows
  source = na.omit(source)
  # get all Xs
  predictors = labels(terms(formula))
  # check existence of all Xs
  for (str in strsplit(predictors, " ")) {
    if (!str %in% names(source)) {
      stop(str, " is not a valid column!")
    }
  }
  # build matrix for Xs
  X = as.matrix(source[predictors], nrow(source), len(predictors))
  X = cbind(rep(1, nrow(source)), X)
  # build matrix for Y
  targets = as.character(formula[[2]])
  Y = as.matrix(source[targets], nrow(source), 1)
  # solve equations for coefficients
  a = t(X) %*% X
  b = t(X) %*% Y
  coeff = t(solve(a, b))
  # calculate stats for residuals
  Y_pred = X %*% t(coeff)
  SSE_residual = sum((Y - Y_pred) ^ 2)
  DF_residual = nrow(source) - length(predictors) - 1
  residual_std_err = sqrt((SSE_residual) / DF_residual)

  # calculate stats for predictors
  SSE_0 = rep(0, length(predictors))
  SSE_1 = rep(0, length(predictors))
  for (i in 1:length(predictors)) {
    H_0 = X[,(1:i)] %*% solve(t(X[,(1:i)]) %*% X[,(1:i)]) %*% t(X[,(1:i)])
    H_1 = X[,(1:(i+1))] %*% solve(t(X[,(1:(i+1))]) %*% X[,(1:(i+1))]) %*% t(X[,(1:(i+1))])
    SSE_0[i] = as.numeric(t(Y) %*% Y - t(Y) %*% H_0 %*% Y)
    SSE_1[i] = as.numeric(t(Y) %*% Y - t(Y) %*% H_1 %*% Y)
  }
  SSE_predictors = SSE_0 - SSE_1
  DF_predictors = rep(1, length(predictors))

  # Construct the output data frame
  result_df = data.frame(list(round(t(SSE_predictors), 4), round(SSE_residual, 4)))
  result_df[2,] <- c(t(DF_predictors), as.character(DF_residual))
  colnames(result_df) <- c(predictors, "Residuals")
  rownames(result_df) <- c("Sum of Squares", "Deg. of Freedom")

  # output the results
  cat("\nCall:\n")
  formula_str = as.character(formula)
  cat(" anova(formula =", formula_str[[2]], formula_str[[1]], paste0(formula_str[[3]], ")\n\n"))
  cat("Terms:\n")
  print(result_df)
  cat("\n")
  cat("Residual standard error:", residual_std_err)
  cat("\n\n")

}

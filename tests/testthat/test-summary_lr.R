test_that("summary_lr outputs the results in expected format", {
  lr_ <- lr(mpg ~ hp + wt, mtcars)
  lm_ <- lm(mpg ~ hp + wt, mtcars)
  o_table <- summary(lm_)[[4]]
  output <- capture.output(summary_lr(lr_))
  est_intercept = round(o_table[,1][1], 3)
  output_est_intercept = strsplit(output[11], " ")[[1]][3]
  expect_equal(est_intercept[[1]], round(as.double(output_est_intercept), 3))
})

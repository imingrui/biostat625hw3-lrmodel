test_that("anova function obtains the same output as aov function", {
  b <- capture.output(anova(mpg ~ hp + wt, mtcars))
  # capture the interested part from anova
  SSE_residuals = strsplit(b[7], " ")[[1]][5]
  SSE_hp = strsplit(b[7], " ")[[1]][6]
  SSE_wt = strsplit(b[7], " ")[[1]][8]
  # run the aov function
  g <- summary(aov(mpg ~ hp + wt, mtcars))
  expect_equal(round(as.double(SSE_residuals), 4), round(g[[1]][,2][1], 4))
  expect_equal(round(as.double(SSE_hp), 4), round(g[[1]][,2][2], 4))
  expect_equal(round(as.double(SSE_wt), 4), round(g[[1]][,2][3], 4))
})

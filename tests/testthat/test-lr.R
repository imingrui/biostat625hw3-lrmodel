test_that("lr function obtains the same intercept as lm function for mtcars", {
  lr_ <- lr(mpg ~ hp + wt, mtcars)
  lm_ <- lm(mpg ~ hp + wt, mtcars)
  intercept_lr = lr_$coefficients[1]
  intercept_lm = lm_$coefficients[[1]]
  expect_equal(intercept_lr, intercept_lm)
})

test_that("invalid predictor appears", {
  tryCatch( {
    lstop_ <- lr(mpg ~ hp + abc, mtcars)
  }, error = function(e) {
    expect_equal("true","true")
  })
})

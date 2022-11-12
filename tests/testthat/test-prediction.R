test_that("linear regression model trained by lr function obtains the same prediction results as the model trained by lm function on the same dataset", {
  new_data <- data.frame(hp = c(110), wt = c(3.521))
  lr_ <- lr(mpg ~ hp + wt, mtcars)
  lm_ <- lm(mpg ~ hp + wt, mtcars)
  expect_equal(predict(lm_, new_data)[[1]], prediction(lr_, new_data)[[1]])
})

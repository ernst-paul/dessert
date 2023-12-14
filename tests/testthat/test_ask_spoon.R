test_that("ask_spoon() returns a tibble with 1 row", {
  expect_true(nrow(ask_spoon("linearity")) == 1)
})

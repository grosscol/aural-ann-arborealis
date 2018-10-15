test_that('returns 0 when given empty vectors', {
  result <- count_conflicting(c(), c())
  expect_equal(result, 0)
})

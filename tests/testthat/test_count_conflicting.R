test_that('returns 0 when given empty vectors', {
  result <- count_conflicting(c(), c())
  expect_equal(result, 0)
})

test_that('returns length of args when no elements line up', {
  len <- 10
  lhs <- seq(1:len)
  rhs <- rev(lhs)

  result <- count_conflicting(lhs, rhs)
  expect_equal(result, len)
})

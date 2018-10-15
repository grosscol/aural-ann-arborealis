#' @title Count Conflicting
count_conflicting <- function(lhs, rhs) {
  sum(lhs != rhs, na.rm = TRUE)
}
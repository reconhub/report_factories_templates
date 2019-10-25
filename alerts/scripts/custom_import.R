
#' This is a wrapper for rio::import, with some additional checking for:
#'
#' * the existence of the file
#' * the extensions (must be xlsx)
#' * use of a large `guess_max`
#'

custom_import <- function(x, guess_max =1e5, ...) {
  check_file(x)
  check_extension(x, expected = "xlsx")
  rio::import(x, guess_max = guess_max, ...)
}

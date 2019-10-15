
## Dirty hack to process dates treated as numbers when importing messy dates
## from Excel; this will replace `guess_dates` from `linelist::guess_dates` when
## called directly (but not when called through `clean_dates` or `clean_data`)

guess_dates <- function(x, error_tolerance = 1, ...) {

  x <- as.character(x)

  to_replace <- !is.na(suppressWarnings(as.integer(x)))
  replacement <- lubridate::as_date(
      as.integer(x[to_replace]),
      origin = as.Date("1900-01-01"))
  replacement <- as.character(replacement)
  x[to_replace] <- replacement

  linelist::guess_dates(x, error_tolerance = error_tolerance, ...)
}

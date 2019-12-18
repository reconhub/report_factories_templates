
find_extension <- function(x) {
  tail(unlist(strsplit(x, "[.]")), 1)
}



check_extension <- function(x, expected = "xlsx") {
  ext <- find_extension(x)
  if (!identical(ext, expected)) {
    msg <- sprintf("wrong file format: expected `%s` but found `%s`",
                   expected,
                   ext)
    stop(msg)
  }
}


## wrapper for datatable; if params$light is TRUE, then we disable the tables
show_table <- function(x, params = NULL, ...) {
  if (!is.null(params)) {
    if (isTRUE(params$light))  return(NULL)
  }
  ## print(x, ...)
  DT::datatable(x, rownames = FALSE,
                options = list(scrollX = TRUE), ...)
}

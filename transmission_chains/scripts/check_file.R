
## This checks for the presence of a file and issues a meaningful error if it is
## missing

check_file <- function(x) {
  if (!file.exists(x)) {
    msg <- sprintf(
        paste("The file %s cannot be found; please check this file exists,",
              "and spelling of the file in `scripts/current_data.R`"),
        x)
    stop(msg)
  }
}



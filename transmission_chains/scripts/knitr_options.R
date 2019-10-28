

## This script defines basic knitr options defining the size and resolution of
## figures, handling the 'light' argument to downsize figures, and other default
## behaviours.



## default options
knitr::opts_chunk$set(echo = TRUE,
                      collapse = TRUE,
                      fig.width = 8,
                      fig.height = 6,
                      out.width = "100%",
                      dpi = 80,
                      warning = FALSE,
                      message = FALSE)


## set smaller resolution if we compile a 'light' version

if (exists("params") && isTRUE(params$light)) {
  knitr::opts_chunk$set(dpi = 30)
}

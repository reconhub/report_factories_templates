

## Define params as NULL if it does not exist, so that testing against the
## values of params will be easier (not having to check every time that the
## object exists)


if (!exists("params")) {
  params <- NULL
}

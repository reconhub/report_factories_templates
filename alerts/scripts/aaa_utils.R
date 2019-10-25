
## vectorized seq

vseq <- Vectorize(seq.default)


## TRUE is x is within [a,b] (included)

in_range <- function(x, a, b) {
  x >= a & x <= b
}


is_TRUE <- function(x) {
  out <- as.logical(x)
  out[is.na(x)] <- FALSE
  out
}

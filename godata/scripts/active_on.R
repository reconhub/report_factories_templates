
#' This function assesses whether a contact is in its active period on a given
#' day.
#'
#' @param last_contact the date of last exposure
#' 
#' @param on the day on which to assess if the contact is active
#' 

active_on <- function(last_contact, on) {

  if (!inherits(last_contact, "Date")) {
    msg <- sptrintf("`last_contact` is not a `Date`, but a %s",
                    class(last_contact)[1])
    stop(msg)
  }

  if (!inherits(on, "Date")) {
    msg <- sptrintf("`on` is not a `Date`, but a %s",
                    class(on)[1])
    stop(msg)
  }

  (on > last_contact) & (on <= (last_contact + 21))
}

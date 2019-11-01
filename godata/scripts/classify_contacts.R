
#' Find the status of a contact !!
#'
#' This function classifies a contact using a the followup table from
#' GoData. Classification (in French) includes:
#'
#' * `inactif`: outside the active period (before or after)
#' * `jamais_vu_court`: never seen so far, for 1-7 days
#' * `jamais_vu_long`: never seen so far, for 8+ days
#' * `vu`: seen on the considered day
#' * `non_vu`: not seen for 1-2 days
#' * `perdu_de_vue`: not seen for 3+ days
#' * `pas_encore_vu`: will be seen at some point, but never seen until now
#'
#' @param contacts a `data.frame` of the GoData contacts data
#' 
#' @param followups a `data.frame` of the GoData followups data
#' 
#' @param on the day on which to assess if the contact is active
#' 
#' @author Thibaut Jombart and Sara Hollis

classify_contacts <- function(contacts, followups, on) {

  ## Overall strategy:
  ##
  ## 1. based on the date of last exposure, define active / non_active contacts,
  ## and keep only active contacts
  ##
  ## 2. on the whole data, find what the first and last days each contact has
  ## been seen; if this is NA, this means the contact was truly never seen
  ##
  ## 3. retain only followup data prior to day of investigation ('on'); some
  ## individuals may be never seen on the time period retained, but seen later;
  ## these will be the `not_seen_yet` contacts
  ##
  ## 4. find the last day each contact was seen on the data retained; NAs could
  ## come from contacts that are truly never seen, or who will be seen in the
  ## future
  ##
  ## 5. based the delay since last followup, get classifications for all
  ## contacts

  
  ## data preparation; `x` will be our working table, each row being a unique
  ## active contact, with columns containing information usefull for the
  ## classification
  
  x <- select(contacts, id, date_of_last_contact)

  ## step 1
  x <- filter(x, active_on(date_of_last_contact, on))
  
   
  ## step 2
  seen_info_global <- followups %>%
    group_by(uid) %>%
    summarise(first_seen_global = min(date_seen, na.rm = TRUE),
              last_seen_global = max(date_seen, na.rm = TRUE))
  x <- left_join(x, seen_info_global, by = c("id" = "uid"))

  
  ## step 3
  followups <- filter(followups, date_of_followup <= on)

  
  ## step 4
  last_seen_info <- followups %>%
    group_by(uid) %>%
    summarise(last_seen = max(date_seen, na.rm = TRUE))
  x <- left_join(x, last_seen_info, by = c("id" = "uid"))

  ## days since last exposure and since seen
  x <- mutate(x,
              days_since_exposure = as.integer(on - date_of_last_contact),
              days_since_last_seen = as.integer(on - last_seen))


  ## step 5
  ## note: for some reason Date NAs are not seen as such here by `is.na` 
  x <- mutate(x,
              never_seen = !is.finite(last_seen_global),
              not_seen_yet = !is.finite(last_seen) & !never_seen,
              never_seen_short = never_seen & is_TRUE(in_range(days_since_exposure, 1, 7)),
              never_seen_long = never_seen & is_TRUE(in_range(days_since_exposure, 8, 21)),
              seen = is_TRUE(days_since_last_seen == 0),
              not_seen = is_TRUE(in_range(days_since_last_seen, 1, 2)),
              lost = is_TRUE(days_since_last_seen >= 3))


  ## final classification
  x <- mutate(x, classification = case_when(
                     not_seen_yet ~ "pas_encore_vu",
                     seen ~ "vu",
                     not_seen ~ "non_vu",
                     lost ~ "perdu_de_vue",
                     never_seen_short ~ "jamais_vu_court",
                     never_seen_long ~ "jamais_vu_long",
                     TRUE ~ "inconnu"  ##when last date seen is not there
                 ))

  out <- select(x,
                id,
                classification,
                date_of_last_contact,
                first_seen_global,
                last_seen_global,
                last_seen,
                days_since_exposure,
                days_since_last_seen)
  return(out)

}

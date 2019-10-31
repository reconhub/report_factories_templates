
#' Find the status of a contact
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
#'
#' @param x a data.frame of the GoData followups data
#' 
#' @param last_contact the date of last exposure
#' 
#' @param on the day on which to assess if the contact is active
#'
#' @param symbol the symbol indicating that the contact has been followed 
#' 


classify_contact <- function(contacts, followup, on, symbol = "x") {

  ## Overall strategy:
  ##
  ## 1. retain only followup data prior to day of investigation ('on')
  ##
  ## 2. for each contact, find their most recent exposure
  ## 
  ## 2. define active / non_active contacts
  ##
  ## 2. find for each contacts the last day they were seen
  ##
  ## 3. 
  

  ## remove followup data posterior to day for which we classify data
  followup <- filter(followup, date_of_followup < on)


  ## for each contact, find their most recent exposure
  x <- select(contacts, id, date_of_last_contact)

  ## define active / non_active contacts, keep only active contacts
  x <- filter(x, active_on(date_of_last_contact, on))

  ## find for each contacts the last day they were seen
  last_seen_info <- followups %>%
    group_by(uid) %>%
    summarise(last_seen = max(date_seen))
  x <- left_join(x, last_seen_info, by = c("id" = "uid"))

  ## days since last exposure and since seen
  x <- mutate(x,
              days_since_exposure = as.integer(on - date_of_last_contact),
              days_since_last_seen = as.integer(on - last_seen))


  ## never seen
  x <- mutate(x,
              never_seen = is.na(last_seen),
              never_seen_short = is_TRUE(in_range(days_since_exposure, 1, 7)),
              never_seen_long = is_TRUE(in_range(days_since_exposure, 8, 21)))


  ## seen and lost to followup
  x <- mutate(x,
              seen = is_TRUE(days_since_last_seen == 0),
              not_seen = is_TRUE(in_range(days_since_last_seen, 1, 2)),
              lost = is_TRUE(days_since_last_seen >= 3))


  ## final classification
  x <- mutate(x, classification = case_when(
                     seen ~ "vu",
                     not_seen ~ "non_vu",
                     lost ~ "perdu_de_vue",
                     never_seen_short ~ "jamais_vu_court",
                     never_seen_long ~ "jamais_vu_long",
                     TRUE ~ "inconnu"
                 ))
  
  out <- select(x,
                id,
                classification) %>%
    mutate(classification = factor(classification),
                levels = c("vu",
                           "non_vu",
                           "perdu_de_vue",
                           "jamais_vu_court",
                           "jamais_vu_long",
                           "inactif",
                           "inconnu"))
  out

}

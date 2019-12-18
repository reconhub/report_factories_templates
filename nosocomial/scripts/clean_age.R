# This function take a vector of ages that are text
# It looks for reference to day, month or week and then
# converts the number to year

#x <- c("3j", "3 j", "4joules", "5m", "6mois", "7 m", "8 Why", 18, "6 s", "7 sem")
clean_age <- function(x){
  x <- tolower(x)
  x_num  <- as.numeric(sub("[a-z.].*", "",  x))
  x_new <- x_num
  days_index <-   grep("\\d.*[j]", x)
  x_new[days_index] <- x_num[days_index] / 365.25 
  months_index <-   grep("\\d.*[m]|\\d.*[mois]", x)
  x_new[months_index] <- x_num[months_index] / 12 
  x_new
}


#  test_age <- c("3j", "3 j", "4joules", "5m", "6mois", "7 m", "8 Why", "18", "6 s", "7 sem")
 # clean_age(test_age)


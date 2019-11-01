#Package options

# Make sure dplyr never joins NA to NA
pkgconfig::set_config("dplyr::na_matches" = "never")


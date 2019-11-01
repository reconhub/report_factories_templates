## List the files in the clean data
raw_folder <- here::here("data", "raw")
clean_folder <- here::here("data", "clean")


current_linelist <- get_latest_data("master_linelist_clean",
                                    clean_folder)


## Get the names of the most recent data files
current_chains <- get_latest_data("master_transmission_list",
                                  raw_folder)




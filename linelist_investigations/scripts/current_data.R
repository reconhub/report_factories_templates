# List the files in the clean data
raw_folder <- here::here("data", "raw")

# Get the names of the most recent data files
current_data <- get_latest_data("master_linelist", raw_folder)
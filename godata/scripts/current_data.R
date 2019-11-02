# List the files in the clean data
raw_folder <- here::here("data", "raw")

# Get the names of the most recent data files
cases_file <- get_latest_data("cases", raw_folder)

relationships_file <- get_latest_data("^relationships.*.xlsx", raw_folder)

contacts_file <- get_latest_data("^contacts.*.xlsx", raw_folder)

followups_file <- get_latest_data("^followups.*.xlsx", raw_folder)

hierarchy_file <- get_latest_data("hierarchy.*.xlsx", raw_folder)





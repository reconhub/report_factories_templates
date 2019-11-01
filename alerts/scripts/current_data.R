## List the files in the clean data
raw_folder <- here::here("data", "raw")

## Get the names of the most recent data files
## current_beni <- get_latest_data("alerts_beni", raw_folder)
current_butembo <- get_latest_data("alerts_butembo", raw_folder)
## current_bukavu <- get_latest_data("alerts_bukavu", raw_folder)
current_goma <- get_latest_data("alerts_goma", raw_folder)
## current_mangina <- get_latest_data("alerts_mangina", raw_folder)
## current_mambasa <- get_latest_data("alerts_mambasa", raw_folder)
## current_bunia <- get_latest_data("alerts_bunia", raw_folder)
## current_komanda <- get_latest_data("^alerts_komanda.*.xlsx", raw_folder)
## current_aggregated <- get_latest_data("alerts_aggregated", raw_folder)


## For spatial checks
current_spatial <- get_latest_data("^pcode_zsas_pcode_.*.xlsx", raw_folder)
current_pop <- get_latest_data("^geographical_population_data.*.xlsx", raw_folder)
current_spatial <- here::here("data",
                              "raw",
                              "pcode_zsas_pcode_2019-10-29.xlsx")


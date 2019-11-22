
## This will create a clean data folder in `data/clean` if it does not exist

clean_path <- here::here("data", "clean")
if (!dir.exists(clean_path)) {
  dir.create(clean_path, recursive = TRUE)
}

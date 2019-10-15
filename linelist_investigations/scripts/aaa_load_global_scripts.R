
## read scripts
path_to_global_scripts <- here::here("..", "..", "scripts")
scripts_files <- dir(path_to_global_scripts,
                     pattern = ".R$", full.names = TRUE)
for (file in scripts_files) source(file, local = TRUE)

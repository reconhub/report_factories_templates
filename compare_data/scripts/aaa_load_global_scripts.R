
## read scripts
path_to_global_scripts <- here::here("..", "global_scripts")
scripts_files <- dir(path_to_global_scripts,
                     pattern = ".R$", full.names=TRUE)
for (file in scripts_files) source(file)

# Load clean master linelist
clean_folder <- here::here("data",
                           "clean")


current_master_clean <- get_latest_data("master_linelist", clean_folder)

# Load clean alert databases

# current_beni_alert_clean <- get_latest_data("alerts_beni", clean_folder)
# 
# current_bunia_alert_clean <- get_latest_data("alerts_bunia", clean_folder)
# 
# current_butembo_alert_clean <- get_latest_data("alerts_butembo", clean_folder)
# 
# current_mangina_alert_clean <- get_latest_data("alerts_mangina", clean_folder)


#load current clean contact databases

# current_beni <- get_latest_data("contacts_beni", clean_folder)
# 
# current_butembo <- get_latest_data("contacts_butembo", clean_folder)
# 
# current_goma <- get_latest_data("contacts_goma", clean_folder)
# 
# current_mangina <- get_latest_data("contacts_mangina", clean_folder)
# 
# current_all <- get_latest_data("contacts_all_sc", clean_folder)

# Load clean vhf database

current_vhf_clean <- get_latest_data("vhf", clean_folder)

# Load clean cte database

current_master_cte <- get_latest_data("etc_clean", clean_folder)

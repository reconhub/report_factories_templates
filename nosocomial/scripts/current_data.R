##load current_clean_linelist (automatically)

raw_folder <- here::here("data",
                         "raw")

##load current clean folder (automatically)

clean_folder <- here::here("data",
                         "clean")

# 1. Update this BEFORE running "aaa_clean_data_yyyy-mm-dd.Rmd"
#current_clean_data <- here::here("data",
#                                 "clean",
 #                                "master_linelist_clean_2019-10-19.rds")

current_clean_data <- get_latest_data("^master_linelist_clean.*.rds", clean_folder)


current_clean_data_cte <- get_latest_data("^cte_clean.*.rds", clean_folder)


current_etc_duplicates <- get_latest_data("^etc_potential_duplicates.*.xlsx", raw_folder)

current_chains <- get_latest_data("^master_transmission_list.*.xlsx",raw_folder)

#import table export from the alerts report to combine them for Bnei, Biakato and Mangina

#table_hz_total_recent_origins-mangina
valid_mangina <- here::here("data",
                            "clean",
                            "table_hz_total_recent_validation-mangina.rds")

valid_biakato <- here::here("data",
                            "clean",
                            "table_hz_total_recent_validation-biakato.rds")

valid_beni <- here::here("data",
                         "clean",
                         "table_hz_total_recent_validation-beni.rds")




orig_mangina <- here::here("data",
                            "clean",
                            "table_hz_total_recent_origins-mangina.rds")

orig_biakato <- here::here("data",
                            "clean",
                            "table_hz_total_recent_origins-biakato.rds")

orig_beni <- here::here("data",
                         "clean",
                         "table_hz_total_recent_origins-beni.rds")




decis_mangina <- here::here("data",
                         "clean",
                         "table_hz_total_recent_decisions-mangina.rds")

decis_biakato <- here::here("data",
                         "clean",
                         "table_hz_total_recent_decisions-biakato.rds")

decis_beni <- here::here("data",
                         "clean",
                         "table_hz_total_recent_decisions-beni.rds")




#table_ha_total_recent: by health area
valid_mangina_as <- here::here("data",
                            "clean",
                            "table_ha_total_recent_validation-mangina.rds")

valid_biakato_as <- here::here("data",
                            "clean",
                            "table_ha_total_recent_validation-biakato.rds")

valid_beni_as <- here::here("data",
                         "clean",
                         "table_ha_total_recent_validation-beni.rds")




orig_mangina_as <- here::here("data",
                           "clean",
                           "table_ha_total_recent_origins-mangina.rds")

orig_biakato_as <- here::here("data",
                           "clean",
                           "table_ha_total_recent_origins-biakato.rds")

orig_beni_as <- here::here("data",
                        "clean",
                        "table_ha_total_recent_origins-beni.rds")




decis_mangina_as <- here::here("data",
                            "clean",
                            "table_ha_total_recent_decisions-mangina.rds")

decis_biakato_as <- here::here("data",
                            "clean",
                            "table_ha_total_recent_decisions-biakato.rds")

decis_beni_as <- here::here("data",
                         "clean",
                         "table_ha_total_recent_decisions-beni.rds")

##################################################################
#loas the clean db to upload zs of as and pop directly
clean_beni <- here::here("data",
                            "clean",
                            "cleaned_alerts_database_beni.rds")

clean_biakato <- here::here("data",
                            "clean",
                            "cleaned_alerts_database_biakato.rds")

clean_mangina <- here::here("data",
                            "clean",
                            "cleaned_alerts_database_mangina.rds")

##################################################################
#load contact clean data
clean_contact_beni <- here::here("data",
                         "clean",
                         "contacts_beni_clean_2019-12-08.rds")

clean_contact_biakato <- here::here("data",
                            "clean",
                            "contacts_biakato_clean_2019-11-26.rds")

clean_contact_mangina <- here::here("data",
                            "clean",
                            "contacts_mangina_clean_2019-12-08.rds")

##################################################################
current_incident_data <- here::here("data",
                                    "raw",
                                    "copy_base_incidents_mve_2019-12-03.xlsx")


##################################################################

# current_data_beni_mangina  <- here::here("data",
#                                          "raw",
#                                          "beni_mangina_finale_2019-04-17.xlsx")
# 
# 
# 
# current_data_vhf  <- here::here("data",
#                                 "clean",
#                                 "vhf_clean_2019-08-19.rds")

# 2. Update this AFTER running "etc_clean_data_yyyy-mm-dd.Rmd"


# current_clean_data_beni_mangina <- here::here("data",
#                                               "clean",
#                                               "beni_mangina_clean_2019-04-17.rds")
# 
# current_clean_data_gis <- here::here("../", "vhf_investigations", "data",
#                                      "clean", "vhf_clean_gis_2019-05-09.rds")
# 
# 
# current_uganda <- here::here("data",
#                              "raw",
#                              "contacts_uganda.xlsx")
# 
# 
# current_measles <- here::here("data",
#                               "raw",
#                               "measles_2016_2019.xlsx")
# 


current_spatial <- here::here("data",
                              "raw",
                              "pcode_zsas_pcode_2019-10-29.xlsx")


current_pop <- get_latest_data("^geographical_population_data.*.xlsx", raw_folder)

## Load some other objects used for forecasting
current_si <- here::here("data",
                         "rds",
                         "si.rds")




#current_master <- get_latest_data("master_linelist", raw_folder)


#clean_folder <- here::here("data",
#                           "clean")


#current_master_clean <- get_latest_data("master_linelist", clean_folder)


##load current master linelist (automatically)

#raw_folder <- here::here("data",
#                         "raw")
  
#current_mdc <- get_latest_data("mdc_linelist", raw_folder)


current_agg_komanda <- get_latest_data("^alerts_aggregate_komanda.*.xlsx", raw_folder)



##load FOSA Codes dataset
raw_folder <- here::here("data",
                         "raw")

current_FOSA <- get_latest_data("nk_it_aoiebola_structuresanitaire", raw_folder)

current_contacts <- get_latest_data("^contacts_all_sc_.*.rds", clean_folder)
current_contacts_classified <- get_latest_data("^contacts_classified_combined_2019-12-10.rds", clean_folder)


current_alerts <- get_latest_data("^clean_alerts_all_.*.rds", clean_folder)


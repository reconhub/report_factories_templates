
## tricky bit: the path to the dictionary is determined using `here`, and so
## will need a different path depending on where the reportfactory sits

path_to_dictionary <- here::here("dictionary",
                                 "cleaning_rules.xlsx")

cleaning_rules <- rio::import(path_to_dictionary)

message("\nGlobal cleaning rules have been imported from:\n 'dictionary/cleaning_rules.xlsx'\nand stored into: 'cleaning_rules'.\n\nYou can use these to clean data with linelist's function:\n'clean_data(... , wordlists = cleaning_rules)'.")


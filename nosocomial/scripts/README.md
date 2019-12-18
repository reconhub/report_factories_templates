
This folder contains scripts to be loaded when running reports. We assume all
scripts are sourced in alphabetic order. The last one call
`zzz_load_global_scripts.R` is special, in the sense that:

* it is sourced last, unless someone is vicious enough to name a file
  e.g. `zzzz...`

* it sources scripts from the folder above the root folder, i.e. `here("../")`;
  these will erase local definitions of objects with identical names
  
  
This behaviour is adopted so that:

* a given *reportfactory* can still be autonomous and self-contained

* global scripts and dictionaries or cleaning rules can be used for different
  *reportfactories*



# Welcome to the *reportfactory* templates repository

This repository provides a collection of self-contained *report factories*, to
be used with the [*reportfactory*
package](https://github.com/reconhub/reportfactory).

Each of the sections below presents the available factories.

Make sure you use the latest version of the *reportfactoy* by typing:


```r
remotes::install_github("reconhub/reportfactory")
```


<br>

## *compare_data*: compare dataset updates

### Outline

This factory is designed for comparing 2 versions of a given datasets. It does
the following:

* check for differences in data structures (names, order and types of the variables)

* look for duplicates in each dataset

* compares duplicates in both datasets

* looks for changes between entries of the two datasets


### How to use it?

Clone or [download](https://github.com/reconhub/report_factories_templates/archive/master.zip) the factory, make sure the **reportfactory** is installed, then:

1. put your datasets in `data/data_comparison`

2. open **R** in the root factory folder or simply double-click on the
   `open.Rproj` file
   
3. (first time only) install dependencies by typing:


```r
reportfactory::install_deps()
```

4. run the factory by typing:


```r
reportfactory::update_reports(clean_report_sources = TRUE)
```

If you have several types of data in the `data/data_comparison` folder, you can
indicate which type of data to compare using:


```r
reportfactory::update_reports(clean_report_sources = TRUE, params(type = "xxx"))
```

where `xxx` is a character string uniquely present in the type of data to use.


<br>


## *linelist_investigations*: analyses from the Ebola North Kivu analytics cell

### Outline

This factory contains several reports providing analyses based on the Master
Line List (MLL), used routinely by the analytics cell of the Ebola response
based in the Emergency Operation Center, North Kivu, DRC. 

Note that as data are confidential, these are not shared here. Reports are meant
to work with the MLL data structure, and will need some adaptations for other
linelist data.

Reports include:

* `aaa_clean_linelist`: data cleaning for the master linelist; will create a
  clean dataset in `rds` and `xlsx` format, and generate a
  `current_clean_data.R` script in `scripts/` which sets the path to the newly
  cleaned data
  
* `active_health_areas`: analysis of geographic spread over time, represented by
  the number of active health areas (i.e. having reported cases over the last 21
  days)

* `age_sex`: age-sex pyramids, stratified by geographic units and in time

* `temporal_trends`: trends of various proportions in time, with some
  geographical stratifications, including
    + proportions of community death
    + proportions of cases known as contacts

* `epicurves`: epicurves with various stratifications, by case characteristics
  and by geographic units

* `kpi`: key performance indicators, used for general summaries of the state of
  the response






<br>

# Contributing

Contributions are welcome via pull requests against the *master* branch of the
project. Pushing directly to *master* has been disabled. Please follow the
guidelines below for contributions.


## Types of contributions

Types of contributions include:

* submitting new reports

* amending existing reports

* acting as a reviewer for pull requests

All contributors, including reviewers, should be duely acknowledged on the
document they contributed to.


## How to contribute

First, **make sure you have read the guidelines** for writing analysis reports,
which you can download from <a
href="https://github.com/reconhub/guides/raw/master/golden_rules.html.zip"
download="golden_rules.html.zip" target="_blank">here</a>. To discuss or amend
these guidelines, see the corresponding [project on
github](https://github.com/reconhub/guides).


We use the usual github workflow for contributions:

1. **fork the project**, if you are not yet part of the development team; **otherwise,
   create a new branch** named after the issue you address, or (in the absence of
   corresponding issue) with a name pointing to the report you work on; for
   instance:


```bash
## if work relates to an existing issue 'xxx':
git checkout -b issue_xxx

## otherwise, e.g. if work relates to the temporal_trends report:
git checkout -b temporal_trends 	
```

2. **make the modifications** to the report, **test them** locally to make sure
   everything works and looks fine; **commit regularly** to avoid loosing work, e.g.



```bash
git commit -a -m "some short description of changes"
```
   
3. once happy with the new version, submit a [**pull
   request**](https://github.com/reconhub/report_factories_templates/compare)
   against the *master* branch; ideally, nominate a **reviewer** to speed up the
   reviewing process
   
4. reviews may require some changes; once the new version is satisfactory, PR
   will be merged into *master* and become the **new official version** of the
   report; this will need to be copied to the *pcloud* infrastructure, and used
   until a new version is made using the process described here.



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

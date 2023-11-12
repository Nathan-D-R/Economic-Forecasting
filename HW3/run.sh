#!/bin/bash
time Rscript -e 'rmarkdown::render("HW3.rmd")'

cp -v HW3.html ~/.config/Website/econ427hw3/index.html

#!/bin/bash
time Rscript -e 'rmarkdown::render("index.rmd")'

cp -v index.html ~/.config/Website/R/ECON427-HW1/index.html

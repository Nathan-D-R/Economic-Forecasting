#!/bin/bash
time Rscript -e 'rmarkdown::render("HW3.rmd")'

cp -v HW3.html index.html
cp -v index.html ~/.config/Website/R/ECON427-HW3/index.html

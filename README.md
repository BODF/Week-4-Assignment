---
title: "README.md"
author: "BODF"
date: "10/27/2018"
output: html_document
---

## Files Included
* *run_analysis.R* will pull training and test datasets together, label
them, and output the mean values as a tidy matrix.

* *Codebook.txt* is an updated version of the original dataset's codebook. It
contains the variables relevant to the R script provided.

## Usage
Run *run_analysis.R* using BASH (`$Rscript run_analysis.R`) or
run it from the R console (`>source(run_analysis.R`)).

## Explanation of the analysis
Our end goal is to output a tidy matrix of mean values. In the process of doing 
that, we take in a matrix much larger and must sift the data. Several variables 
are labeled "mean." My script only keeps those that are labeled as being direct 
averages of some variable, as opposed to being an angle based on average motion.
The end output is a matrix that takes the mean of the means and standard
deviations, with respect to activities described in the codebook.

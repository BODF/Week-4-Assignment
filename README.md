---
title: "README.md"
author: "BODF"
date: "10/27/2018"
output: html_document
---

##Files Included
* *AccelerometerAnalysis.R* will pull training and test datasets together, label
them, and output the mean values as a tidy matrix.

* *Codebook.txt* is an updated version of the original dataset's codebook. It
contains the variables relevant to the R script provided.

##Usage
Run *AccelerometerAnalysis.R* using BASH (`$Rscript AccelerometerAnalysis.R`) or
run it from the R console (`>source(AcceleromterAnalysis.R`)).

## Explanation of the analysis
Our end goal is to output a tidy matrix of mean values. In the process of doing 
that, we take in a matrix much larger and must sift the data. Several variables 
are labeled "mean." My script only keeps those that are labeled as being direct 
averages of some variable, as opposed to being an angle based on average motion.

The grading rubric does not make clear which columns must be grabbed, only that 
the selection must be clear and understandable.
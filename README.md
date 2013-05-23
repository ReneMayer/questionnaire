# questionnaire

The R package **questionnaire** is an engine to display, record and plot simple computer based questionnaires. While it operates within R the rendering engine is written in JAVA. The lightweight R function calls are designed to give users full control of the display by making use of extended markup language to structure and display the questions and the answer scale on the computer screen. If norms are aviable and the items are mapped onto constructs according to a key, a profile get be plotted to see which constructs are rated under or above a SD.  

## Installation

This package is currently under construction but can be installed from github.  
- either within R

```r
library(devtools)
install_github("questionnaire", "ReneMayer")
```

- or bash 

```bash
git clone https://github.com/ReneMayer/questionnaire.git
R CMD build questionnaire
R CMD INSTALL questionnaire_1.0.tar.gz
```

Make sure that java is installed and the R package rJava is installed, too.
```bash
sudo apt-get install r-cran-rjava
sudo apt-get install sun-java6-jdk sun-java6-jre
```

## Motivation

- It is convenient to use computer based questionnaires like diagnostic test systems. But some I know are are expensive. 
- I often wished to see evaluations of a workshop or a lecture immediately or even in the middle to and use this informations to make adaptations.
- It is often difficult to see missing items in paper and pencil questionnaires. With a computer based one we can give feedback if an items is not answered.
- I think one of the major strength of computer based questionnaires is the they can be used to select the next answer conditional of the present (this is not implemented at the moment).

## Usage

```r
library(questionnaire)
?questionnaire
```

## Restrictions

Currently only tested at linux and the Documentation has to be finished.
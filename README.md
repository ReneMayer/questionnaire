# questionnaire

The (under development) R package **questionnaire** is aims to display, record and plot simple computer based questionnaires. While it operates within R the rendering engine is written in JAVA. The lightweight R function calls are designed to give users control of the way questions are displayed on the screen. Questions and the answers are processed internally by making use of the extended markup language (XML). If items can be mapped onto constructs (for example the first five items aim to ask the same construct under different perspectives) mean ratings per construct can be computed. This is often called a profile. To see which responses on the construct level are under or above mean rating within SD a profile.plot is aviable. In diagnostics this is often used can contrast mean response in a population with the individual response.    

## Installation

This package is currently under construction but can be installed from github.  
- either within R


```r
# install.packages('devtools', dep=T)
# under windows: you need to install RTools, too. (http://cran.r-project.org/bin/windows/Rtools/)
library(devtools)
install_github("questionnaire", "ReneMayer")
```


- or bash 

```bash
git clone https://github.com/ReneMayer/questionnaire.git
R CMD build questionnaire
R CMD INSTALL questionnaire_1.0.tar.gz
```

Make sure that java is installed by opening a terminal (nx: strg+alt+T or win: ...)
```bash
java -version
```
should give you something back like
```bash
java version "1.7.0"
Java(TM) SE Runtime Environment (build 1.7.0-b147)
Java HotSpot(TM) Client VM (build 21.0-b17, mixed mode)
```
Make sure that the package rJava is installed and running. If you are on debain/ubunut you can use the repos.
```bash
sudo apt-get install r-cran-rjava
sudo apt-get install sun-java7-jdk sun-java7-jre
```

## Motivation

- It is convenient to use computer based questionnaires like diagnostic test systems. But some I know are are expensive. 
- I often wished to see evaluations of a workshop or a lecture immediately or even in the middle to and use this informations to make adaptations.
- It is often difficult to see missing items in paper and pencil questionnaires. With a computer based one we can give feedback if an items is not answered.
- I think one of the major strength of computer based questionnaires is the they can be used to select the next answer conditional of the present branching and even adaptive testing come into play here (this is not implemented at the moment).

## Usage

```r
library(questionnaire)
?questionnaire
```

## current state

Currently tested under linux and windows (mac has some issues).
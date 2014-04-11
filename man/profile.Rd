\name{profile}
\alias{profile}
\title{creation of a profile data structure}
\usage{
profile(norm = NA, answers = NA, key = NA, flip = NA,
  method = "linear", age = NA, gender = NA, labels = NA)
}
\arguments{
  \item{norm}{a data frame containing T-scores for each
  construct}

  \item{answers}{answers recorded during lauch()}

  \item{key}{a data.frame with items and constructs
  (scales)}

  \item{flip}{reverses answer by mirroring it on the mean
  of the anwer-scale}

  \item{age}{if provided and a age related norm is given
  profile will use the norm accordingly (age subset)}

  \item{gender}{like age for subsetting}

  \item{lables}{informs which labels the likert scale used}

  \item{method}{linear or spline can be selected to
  interpolate norms and means}
}
\value{
S3 \code{profile} object; a list consisting of ...
}
\description{
aggregates answers recorded during lauch() according to a
key (item to construct mapping). If a norm is provided the
mean answers will be compared against this norm. Reversed
items can be marked with the flip argument
}


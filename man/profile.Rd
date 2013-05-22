\name{profile}
\alias{profile}
\title{aggregates answers recorded during lauch() according to a key (item to construct mapping). If a norm is provided the mean answers
will be compared against this norm. Reversed items can be marked with the flip argument}
\usage{
  profile(norm = NA, answers = NA, key = NA, flip = NA)
}
\arguments{
  \item{norm}{a data frame containing T-scores for each
  construct}

  \item{answers}{answers recorded during lauch()}

  \item{key}{a data.frame with items and constructs
  (scales)}

  \item{flip}{reverses answer by mirroring it on the mean
  of the anwer-scale}
}
\value{
  S3 \code{profile} object; a list consisting of ...
}
\description{
  aggregates answers recorded during lauch() according to a
  key (item to construct mapping). If a norm is provided
  the mean answers will be compared against this norm.
  Reversed items can be marked with the flip argument
}


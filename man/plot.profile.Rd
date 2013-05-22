\name{plot.profile}
\alias{plot.profile}
\title{plots a profile: mean answers given by person and reference population mean +- SD}
\usage{
  plot.profile(x, order = "norm", ...)
}
\arguments{
  \item{x}{object of class profile}

  \item{order}{c('norm', 'answer', NA ) should the mean
  anser ordered according to reference norm or answer given
  by person or in the order of the key.}
}
\value{
  S3 \code{mcpi} object; a list consisting of
}
\description{
  If a circle of radius \eqn{R} is inscribed inside ...
}
\examples{
\dontrun{
norm<-read.table(system.file("data/ExampleNorm.txt", package="questionnaire"))
answers<-read.table(system.file("data/ExampleAnswers.txt", package="questionnaire"))
key<-read.table(system.file("data/ExampleKey.txt", package="questionnaire"))
ppp<-profile(norm, answers, key)
plot(ppp, NA)
plot(ppp, 'norm')
}
}


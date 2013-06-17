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
# simulated Norms from 23 scales (constructs) each manifested by 5 items (questions)
data(eNorm)
head(eNorm)

# simulated answers
data(eAnswers)
head(eAnswers)

# an example key: mapping answers to scales
data(eKey)
head(eKey)

# make an object of type profile
ppp<-
  profile( norm    = eNorm,
           answers = eAnswers,
           key     = eKey
  )

plot(ppp, NA)
plot(ppp, 'norm')
plot(ppp, 'answer')
}
}


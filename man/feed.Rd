\name{feed}
\alias{feed}
\title{manual data insertation}
\usage{
feed(count = 1)
}
\arguments{
  \item{count}{number of items to insers}
}
\value{
a data.frame with items, answers and labels
}
\description{
Function to insert answers obtained by a survey.
}
\examples{
\dontrun{
# insert answers from 100 Items
answers = feed(count = 100)
}
}


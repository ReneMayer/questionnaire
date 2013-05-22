\name{make.questions}
\alias{make.questions}
\title{makes an xml nodes for the questions}
\usage{
  make.questions(id, type = rep("mc_horizontal", 3),
    answers, text, questionnaire)
}
\arguments{
  \item{id}{numbering of items. The values in \code{x} are
  itegers}

  \item{type}{'mc_horizontal'}

  \item{answers}{items}

  \item{text}{of the question}

  \item{questionnaire}{where to append}
}
\value{
  S3 \code{XML} object
}
\description{
  makes an xml nodes for the questions
}


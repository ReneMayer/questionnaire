\name{questionnaire}
\alias{questionnaire}
\title{Builds an internal representation of a questionnaire
according to items (questions beeing asked) scale type (answers beeing given: likert, yes-no) and
instruction.}
\usage{
  questionnaire(name, scale.mapping, item.mapping,
    instruction)
}
\arguments{
  \item{name}{internal name of the questionnaire}

  \item{scale.mapping}{a list 3 fields scales, labels,
  rev;}

  \item{item.mapping}{a data frame with variables items
  (questions) and the name of the answer scale.}

  \item{instruction}{the instruction given infront.}
}
\value{
  S3 \code{questionnaire} object; a list consisting
}
\description{
  Builds an internal representation of a questionnaire
  according to items (questions beeing asked) scale type
  (answers beeing given: likert, yes-no) and instruction.
}
\examples{
\dontrun{
scale.mapping <-
  list(scales = 'Accuracy',
       labels = list(c('_ _ Very _Inaccurate',
                       '_ _Moderately _Inaccurate',
                       'Neither _Accurate _Nor _Inaccurate',
                       '_ _Moderately _Accurate',
                       '_ _Very _Accurate') ),
       rev    = F )
# big5 items retrieved from 'http://en.wikipedia.org/wiki/Big_Five_personality_traits'
 head(b5.items <- read.table(system.file("data/Big5.txt", package="questionnaire")))
# mapping: items - scales; for the instruction see 'http://ipip.ori.org/New_IPIP-50-item-scale.htm'
item.mapping <- transform(b5.items, scales=factor(scales, levels=1, labels='Accuracy') )
big5 <- questionnaire(
 name          = "big5",
 scale.mapping = scale.mapping,
 item.mapping  = item.mapping,
 instruction   = "Describe yourself as you generally are now..." )
}
}


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

# construct a single answer scale
scale.mapping <-
  list(scales = 'Accuracy',
       labels = list(c('_ _ Very _Inaccurate',
                       '_ _Moderately _Inaccurate',
                       'Neither _Accurate _Nor _Inaccurate',
                       '_ _Moderately _Accurate',
                       '_ _Very _Accurate') ),
       rev    = F )

# big5 items from 'http://en.wikipedia.org/wiki/Big_Five_personality_traits'
data(Big5)
b5.items<-Big5

# mapping: items - scales,
item.mapping <- transform(b5.items, scales=factor(scales, levels=1, labels='Accuracy') )

# build a questionnaire object with an instruction "Describe yourself as ..." from 'http://ipip.ori.org/New_IPIP-50-item-scale.htm'
big5 <- questionnaire(
 name          = "big5",
 scale.mapping = scale.mapping,
 item.mapping  = item.mapping,
 instruction   = "Describe yourself as you generally are now..."
)

# display all items an response scales on the screen
responses<-launch(qstnr = big5)

# if finished get the answers
get.answers(responses)

# next steps you may want to take

}
}


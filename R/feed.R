#' manual data insertation
#'
#' Function to insert answers obtained by a survey.
#'
#' @param count number of items to insers
#' @return a data.frame with items, answers and labels
#' @examples 
#' \dontrun{ 
#' # insert answers from 100 Items
#' answers = feed(count = 100)
#' }


feed <- function(count=1) {
a=data.frame(question=paste('ex', 1:count, sep='_'), label='label')
c=edit(a)
names(c)[3]='answer'
c[,c(1,3,2)]
}

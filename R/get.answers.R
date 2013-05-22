#' extracts responses from a questionnaire object thats has been lauched and answered
#'
#'
#' @param q.frame rJava object that has been given back from launch() function
#' @param verbose Print information during execution
#' @return answers a data frame of recorded answers for each item
get.answers <-
function(q.frame=q.frame) {
  answers<-data.frame(sapply(q.frame$getQuestionnaire()$getAnswerList(),.jevalArray))[-1,]
  names(answers) = c('question','answer','label')
  return(answers)
}

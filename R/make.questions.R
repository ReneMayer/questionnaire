#' makes an xml nodes for the questions
#'
#' @param id numbering of items. The values in \code{x} are itegers
#' @param type 'mc_horizontal'
#' @param answers items
#' @param text of the question
#' @param questionnaire where to append
#' @return S3 \code{XML} object


make.questions <-
function(id, type=rep("mc_horizontal",3), answers, text, questionnaire){
  for( i in 1:length(text) ){
	newXMLNode("question", 
	           attrs = c(     id=paste(id, i, sep="_"), 
				type=type[i],
			     answers=answers[i], 
				text=text[i]), 
		   parent = questionnaire[["page"]] )
  }
}

#' makes an xml nodes for the answer-scales
#'
#' @param scale
#' @param labels
#' @param reversed=F
#' @param scalenumber=1
#' @param questionnaire
#' @return S3 \code{XML} object

make.scale <-
function(scale, labels, reversed=F, scalenumber=1, questionnaire ){
                
                 mirror<-function(labels, item){length(labels)+1 - item}
                
		if (reversed == F) {
		  newXMLNode("answerscale", attrs = c(id=scale), parent = questionnaire)
		  for( i in 1:length(labels) ){
		    newXMLNode("answer", attrs = c(id=paste(i)),  labels[i], parent = questionnaire[[scalenumber]])
		  }
		} else {
		  newXMLNode("answerscale", attrs = c(id=scale), parent = questionnaire)
		  for( i in 1:length(labels) ){
		    newXMLNode("answer", attrs = c(id=paste(mirror(labels, i))),  labels[i], parent = questionnaire[[scalenumber]])
		  } 
		}
}

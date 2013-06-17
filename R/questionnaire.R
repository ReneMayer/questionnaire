#' Builds an internal representation of a questionnaire
#' according to items (questions beeing asked) scale type (answers beeing given: likert, yes-no) and
#' instruction.
#'
#' @param name internal name of the questionnaire
#' @param scale.mapping a list 3 fields scales, labels, rev;
# 	\item{scales}{a vector of scale-names}
# 	\item{lables}{a list of string-vecors each list-entry representing the answer-scale and each vector-element is an answer that can be given
# 	\item{rev}{a logical vector indicating for each scale wether or not the order of answers should be reversed, e.g.,yes-no -> no-yes 
#' @param item.mapping a data frame with variables items (questions) and the name of the answer scale.
#' @param instruction the instruction given infront.
#' @return S3 \code{questionnaire} object; a list consisting 
# 	\item{name}{ internal object na,e}
# 	\item{scales}{a vector of scale-names}
# 	\item{labels}{a list of string-vecors each list-entry representating a scale with answers}
# 	\item{rev}{a logical vector indicating for each scale the order of answers}
# 	\item{questions}{items}
# 	\item{answers}{answer-scale}
# 	\item{xml}{the whole information in xml}
#' @examples
#' \dontrun{ 
#'
#' # construct a single answer scale 
#' scale.mapping <-
#'   list(scales = 'Accuracy',
#'        labels = list(c('_ _ Very _Inaccurate', 
#'                        '_ _Moderately _Inaccurate', 
#'                        'Neither _Accurate _Nor _Inaccurate', 
#'                        '_ _Moderately _Accurate', 
#'                        '_ _Very _Accurate') ),
#'        rev    = F )
#' 
#' # big5 items from 'http://en.wikipedia.org/wiki/Big_Five_personality_traits'
#' data(Big5)
#' b5.items<-Big5
#'
#' # mapping: items - scales, 
#' item.mapping <- transform(b5.items, scales=factor(scales, levels=1, labels='Accuracy') )
#' 
#' # build a questionnaire object with an instruction "Describe yourself as ..." from 'http://ipip.ori.org/New_IPIP-50-item-scale.htm' 
#' big5 <- questionnaire(
#'  name          = "big5", 
#'  scale.mapping = scale.mapping, 
#'  item.mapping  = item.mapping,
#'  instruction   = "Describe yourself as you generally are now..." 
#' )
#' 
#' # display all items an response scales on the screen
#' responses<-launch(qstnr = big5)
#'
#' # if finished get the answers
#' get.answers(responses)
#'
#' # next steps you may want to take
#  ?plot.profile
#'
#'}
questionnaire <-
function(name, scale.mapping, item.mapping, instruction){
         
          # extract vectors from list, data frame for convenience 
          scales    = scale.mapping$scales
          labels    = scale.mapping$labels
          rev       = scale.mapping$rev
          questions = as.vector(item.mapping$qu)
          answers   = as.vector(item.mapping$scales)
                
          # ---start: build xml-file ---------------------------------------------
	  top <- newXMLNode("questionnaire ")
	  # build scales
	  for( s in 1:length(scales) ) {
	        make.scale(scales[[s]], labels[[s]], reversed=rev[[s]], scalenumber=s, top) 
	        }
	  page <- newXMLNode("page", parent = top)
	  # build questions
	  newXMLNode("instruction",instruction ,parent = page)
	  make.questions(id=name, type=rep("mc_horizontal",length(questions)), answers=answers, text=questions, top)	
	  # ---end: xml -----------------------------------------------
          
           # class of 'qstnr'   
	   form <- list() 
           class(form) <- "questionnaire" 
	   
	   # fields of 'qstnr' class   
	   form$name      = name
            form$scales    = scales    # scale to item mapping
            form$labels    = labels    # lables for sclale
            form$rev       = rev       # flip scale - yes or no
            form$questions = questions # itmes
            form$answers   = answers   # the answer-scale
            form$xml       = top       # return the xml-object
           
            
           return(form) # form is an instance, object, of class 'qstnr'
}

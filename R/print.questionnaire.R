#' prints a questionnaire object into the console
#'
#' @param x object of class questionnaire
#' @return console formated text text 
print.questionnaire <-
function(x, ...) {
  cat("object of class questionnaire\n")
  # unique(x$answers)
  cat("item to scale mapping: \n" )
  cat("item ", "scale", "text \n" )
  for (i in 1:length(x$questions) ) cat( paste(i), '\t',x$answers[i], '\t',x$questions[i], "\n" )
  
  cat("interval level for each scale:\n" ) 
  # prepare scale level string
  txt<-''
  scale.levels<-lapply(x$labels, function(x) gsub(pattern="_", replacement='', x=x))
  # --- nicht nur über die elemente, sindern auch über die listen
  for (l in length(scale.levels))
    for (i in 1:length(unlist(scale.levels[[l]])) ) txt<-paste(txt, '_',i,'.', unlist(scale.levels[[l]])[i], sep='' )
  txt<-lapply(txt, function(x) gsub(pattern='[[:space:]]', replacement='', x=x))
  txt<-lapply(txt, function(x) gsub("_", " ", txt, x=x))
                                  cat(sprintf("%s %s       %s\n", 'Number', 'Name', 'Levels' )  ) 
  
  for (sc in 1:length(x$scales) ) cat( sprintf("%i.     %s: %s\n", 1, x$scales[1], txt[[1]] ) )
  # ToDo ... get the headder right
}

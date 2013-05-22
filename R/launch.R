#' launches a survey, that is displays the itmes and the answer scale and records the responses
#' from a questionnaire object
#'
#'
#' @param qstnr object of class questionnaire
#' @param verbose Print information during execution
#' @return S3 \code{rJava} object; a list consisting of ...
launch <-
function(subject.id='id01', session.id='01', subject.group='PILOT', qstnr='test'){
    
    # get object of type ' qstnr' and extract the '*.xml' representation
    saveXML(qstnr$xml, file=paste(qstnr$name,'xml', sep='.'), prefix='<?xml version="1.0"?>', encoding="UTF-8") # this should be a stream
     
    # Java 
    subject.group <- J('survey.SubjectGroup','valueOf',subject.group)
    subject.id <-.jnew('java.lang.String',subject.id)
    session.id <-.jnew('java.lang.String',session.id)
    exp.list <- .jnew('java.util.ArrayList')
    session <- .jnew('survey.Session',subject.id,subject.group,session.id,exp.list)
    q.factory <- .jnew('survey.QuestionnaireFactory',session)
    questionnaire <- q.factory$getQuestionnaire( paste(qstnr$name,'xml', sep='.') )
    # ... now we can get rid of the '*.xml' - or save if if needed
    q.frame <- .jnew('survey.QFrame',questionnaire)
    q.frame$setVisible(TRUE)
    return(q.frame)
}

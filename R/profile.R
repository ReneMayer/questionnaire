#' creation of a profile data structure
#'
#' aggregates answers recorded during lauch() according to a key (item to construct mapping). If a norm is provided the mean answers 
#' will be compared against this norm. Reversed items can be marked with the flip argument
#'
#' @param norm a data frame containing T-scores for each construct
#' @param answers answers recorded during lauch()  
#' @param key a data.frame with items and constructs (scales)
#' @param flip reverses answer by mirroring it on the mean of the anwer-scale
#' @param age if provided and a age related norm is given profile will use the norm accordingly (age subset)
#' @param gender like age for subsetting 
#' @param lables informs which labels the likert scale used
#' @param method linear or spline can be selected to interpolate norms and means
#' @return S3 \code{profile} object; a list consisting of ...



profile<-function(norm=NA, answers=NA, key=NA, flip=NA, method='linear', age=NA, gender=NA, labels=NA) {
    # extract from norms: lower - middle - upper bounds given a T-distribution T = Normal(mean=50, sd=10)
    # ... write a switch later on for Z instead of T ...
    
    ## means rating and SD'S by norms
    
    if(  (!is.na(age) & !is.na(gender)) == TRUE  ) {
       d<-norm; names(d)<-c('t','rating', 'item', 'lower', 'upper', 'sex')
       d=subset(d, age>=lower & age<=upper)
       d=subset(d, sex==gender)
    } else {
       
    # rename norm data.frame and variables
    d<-norm; names(d)<-c('t','rating', 'item')
    }
    
    
    # local functions
    get.bands <- function(x, method=method){
		  switch(method,
			  linear={
				  m=lm(x$rating~x$t)
				  # predict points around T=50 with 1 sd=10  
				  # 
				  #       |1 40|   
				  # LMU = |1 50| x |b0 b1|
				  #       |1 60|
				  b=matrix(data=c(1,1,1,40,50,60), byrow=F, ncol=2)%*%coef(m)
				  }, 
			  spline={
			          population <- with(na.omit(x) , smooth.spline(x=t, y=rating ))
                                  b=predict(population, c(40,50,60) )$y
				 },
			  stop("missing method: linear or spline")
			 )
	           return(t(b))
      }
	  
     mirror <- function(labels, item){length(labels)+1 - item}
     
     get.norm <- function(answer, d) { 
       patient <- with(na.omit(d) , smooth.spline(y=t, x=rating ))
       return( predict(patient, answer$answer)$y )
     }

	  
    #library(plyr)	  
    bands <- ddply(d,'item',get.bands, method=method)
    names(bands)=c('scale','lower','middle','upper')
	  
    ## mean rating from current questionnaire 
	  
    # aggregate an answers according to key: scale  question
    #                                        scaleA item1 
    #					     scaleA item2 
    #                                        scaleB item4
    #                                        scaleB item5
    if (any(!is.na(flip)))  answers[flip,'answer']<-mirror(labels=labels, item=as.numeric(answers[flip,'answer']) )
    answers.key <- merge(answers, key, by='question')
    a <- aggregate(answer~scale, answers.key, mean)
    
    # provide T-score
    names(a)[1] = 'item'
    # kann ich zwei data fames simultan splitten
    T=sapply(levels(d$item), function(x) {
                                         this.norm = subset(d, item == x)
                                         this.ans  = subset(a, item == x)
                                         get.norm(answer = this.ans, d = this.norm)
                                         
                           } )
                           
    
                                         
    names(a)[1] = 'scale'                                             
    #b <- ddply(.(a, d),.(item),get.norm)
    
    profileDF <- merge(bands, a , by = 'scale')
    # give back an object of type profile
    # class of 'profile'   
    profile <- list() 
    class(profile) <- "profile"
    profile$profileDF <- profileDF
    profile$norm <- norm
    profile$answers <- answers
    profile$mirror <- mirror
    profile$T <- T
    profile$labels <- labels
    return(profile)
}

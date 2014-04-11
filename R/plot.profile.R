#' plots a profile: mean answers given by person and reference population mean +- SD
#'
#' If a circle of radius \eqn{R} is inscribed inside ...
#'
#' @param x object of class profile
#' @param order c('norm', 'answer', NA ) should the mean anser ordered according to reference norm or answer given by person or in the order of the key.
#' @return S3 \code{mcpi} object; a list consisting of
#' @examples 
#' \dontrun{ 
#' # simulated Norms from 23 scales (constructs) each manifested by 5 items (questions)
#' data(eNorm)
#' head(eNorm)
#'
#' # simulated answers
#' data(eAnswers)
#' head(eAnswers)
#' 
#' # an example key: mapping answers to scales
#' data(eKey)
#' head(eKey)
#' 
#' # make an object of type profile
#' ppp<-
#'   profile( norm    = eNorm, 
#'            answers = eAnswers, 
#'            key     = eKey
#'   )
#'   
#' plot(ppp, NA)
#' plot(ppp, 'norm')
#' plot(ppp, 'answer')
#' }
plot.profile<-function(x, order='norm', ...){
  dd<-x$profileDF
  if (is.na(order)) {
     o    <- order(dd$scale)
     dd.n <- dd[o,]
     f    <- scale~answer
    } else {
	if (order=='norm') {
	  # ordering according to mean answer or mean norm
	  o <- order(dd$answer, dd$middle)
	  dd.n<-dd[o,]
	  f<-reorder(reorder(scale,  middle ),answer)~answer
	} else { # ordering answerccording to meanswern norm
	  o <- order(dd$middle)
	  dd.n<-dd[o,] 
	  f<-reorder(scale, middle)~answer
	}
  }

  xyplot(f,data=dd.n, 
          type=c('o'),  
          xlim=c(as.numeric(x$labels[1]), as.numeric(x$labels[length(x$labels)])),
          subscripts=T,
          xlab = 'mean answer',
          ylab = 'scale - construct',
       panel = function(x, y, subscripts, ...){
            # SDs 
	    with(dd.n, 
	      panel.polygon( c( upper[subscripts], rev(lower[subscripts]) ), c(y[subscripts],rev(y[subscripts]) ), col='gray', border=F) )
	    # Proband
            panel.xyplot(x[subscripts], y[subscripts], col='red',...)
            # mean
	    with(dd.n,panel.xyplot(middle[subscripts],y[subscripts], type='l',col='black',))
	    panel.grid(h=-length(levels(dd$scale)),v=-1,...)
	    
       })
}


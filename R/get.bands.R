get.bands <-
function(x){ m=lm(x$rating~x$t)
                        b=matrix(data=c(1,1,1,40,50,60), byrow=F, ncol=2)%*%coef(m)
                return(t(b))}

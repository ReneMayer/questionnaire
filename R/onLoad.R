##' @import rJava
.onLoad <- function(lib, pkg) {

    pathToSdk <- paste(system.file(package = "questionnaire") ,sep="")
    
    jarPaths <- c( paste(pathToSdk, "/Survey.jar", sep="") )
    .jpackage(pkg, morePaths=jarPaths)
    # to add?
    attach( javaImport( c("java.lang", "java.io")))
    packageStartupMessage( paste( "questionnaire loaded. The classpath is: ", paste(.jclassPath(), collapse=" " ) ) )        
}
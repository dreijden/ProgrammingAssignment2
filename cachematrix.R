## This functions creates the get/set methods for the original
## and the inverted matrix

makeCacheMatrix <- function(originalMatrix = matrix()) {
    ## X is a square invertable matrix. Check to decide if the matrix 
    ## is invertable is not required
    
    ## initialize the plceholder for the inverted cached matrix
    invertedMatrix<-NULL
    
    ## set and initialize the original matrix. Use the 'superassignment' operator 
    ## which does the assignment in the enclosing environment.
    setOriginalMatrix <- function() {
        originalMatrix<<- y
        invertedMatrix <<- NULL
    }
    
    ## Create the methode to get the original matrix
    getOriginalMatrix <- function() {
        originalMatrix
    }
    
    ## Create the method to set the inverted matrix
    setInversedMatrix <- function(inverseMatrix) {
        invertedMatrix <<- inverseMatrix
    }
    
    ## Create the method to get the inverted matrix
    getInvertedMatrix <- function() {
        invertedMatrix
    }
    
    
    ## Creat the output of the function , which is a list containing get and set methods for
    ## the original matrix and get and set and set methods for the inverted matrix.
    list( setOriginalMatrix = setOriginalMatrix, getOriginalMatrix = getOriginalMatrix,
          setInversedMatrix = setInversedMatrix, getInvertedMatrix = getInvertedMatrix)
}


## this functions checks to see if there is cached inverted matrix. if not the function creates
## a new inverted matrix
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'. Use the <<- (superassignment) operator to find the inverted matrix
    ## in the enclosing environment (cached matrix). Instead of using if() with a return statement I decided on using
    ## an else statement.
    
    invertedMatrix <-x$getInvertedMatrix()
    
    ## if the matrix is not yet inverted, the method returns NULL
    if (!is.null(invertedMatrix)) {
        ## we found an inverted matrix!
        message("getting cached data")
    }
    else {
        ## no inverted matrix found in the environment, so create one. I use the function
        ## solve() to invert the matrix.
        matrix<-x$getOriginalMatrix()
        invertedMatrix <-solve(matrix,...)
        
        ## matrix is inverted. Now put it in the environment (cache)
        x$setInversedMatrix(invertedMatrix)
    }
    
    ## Autoprint the inverted matrix
    invertedMatrix
    
}

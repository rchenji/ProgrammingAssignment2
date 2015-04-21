## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object 
## that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    mat <- NULL
    set <- function(y){
        x <<- y
        mat <<- NULL
    }
    
    get <- function(){
        x
    } 
    
    setinv <- function(solve) {
        mat <<-solve
    }
    
    getinv <- function(){
        mat
    }
    list(set = set, get = get, 
         setinv = setinv, 
         getinv = getinv)
    
}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above.
## assuming that the matrix returned is always square and invertible
## if the inverse has already been calculated, it returns the cached 
## inverse matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        mat <- x$getinv()
        
        if(!is.null(mat)){
            message("getting cached data")
            return(mat)
        }
        
        data <- x$get()
        mat <- solve(data, ...)
        x$setinv(mat)
        mat
}

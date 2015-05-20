## The following two functions allow the user to pass in a square matrix
## that will then be stored to cache along with a default value for the
## inverse of that matrix. The user can then choose to get or change the
## matrix as well as set or get the inverse matrix. The inverse matrix must
## be set before it can be retrieved.


## makeCacheMatrix takes a square matrix as an argument, stores that matrix
## to cache, and creates four functions to get the matrix, set the matrix to
## something new, set the inverse matrix and store it to cache, or get the
## inverse matrix.

makeCacheMatrix <- function(x=matrix()) {
    
        # Set a default value for the inverse matrix of matrix x
        inverse_matrix <- NULL
        
        # This function sets the matrix and stores it to cache.
        # It also stores the inverse matrix, which has not yet been
        # determined, to cache as NULL
        set <- function(y) {
            x <<- y
            inverse_matrix <<- NULL
        }
        
        # This function gets the input matrix
        get <- function() x
        
        # This function sets the value of the inverse matrix by 
        # using the solve function on the matrix x and storing 
        # that to cache.
        setinverse <- function(x) inverse_matrix <<- solve(x)
        
        # This function retrives an inverse matrix that has been
        # stored to cache using the setinverse function.
        getinverse <- function() inverse_matrix
        
        # Return the list of functions to set and get the original
        # matrix and set and get the inverse of that matrix
        list(set=set, get=get,
             setinverse=setinverse,
             getinverse=getinverse)    

}



## cacheSolve takes the "matrix" object created by makeCacheMatrix and
## then allows the user to set the inverse of that matrix, get the inverse
## of that matrix, get the matrix itself, or set a new matrix.

cacheSolve <- function(x, ...) {
    # Return a matrix that is the inverse of 'x'
    
    # First get the chached inverse matrix
    inverse_matrix <- x$getinverse()

    # Check to see if the inverse is equal to NULL, and if not,
    # return the cached inverse matrix.
    if(!is.null(inverse_matrix)) {
        messag("getting cached matrix")
        return(m)
    }
    
    # If the retrieved inverse is equal to NULL, then solve for the
    # inverse of the cached matrix
    # First get the cached matrix itself
    myMatrix <- x$get()
    
    # Now get the inverse of the matrix
    inverse_matrix <- solve(myMatrix)
    
    # print the inverse
    inverse_matrix
}
## Calculate and cache inverse of a matrix


## This func creates a "special" matrix
# I found out that this function doesn't do any calculation,
# just change the type of class of your variable, so basically
# replace the original vector 'numeric" to 'matrix' matrix type
# I also change the <<- assignment to inv for explicity

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setinv <- function(inv) m <<- inv
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}



## This func calculate the inverse of the "special" matrix
# Only the command that assigns to m is the calculation.
# So, change 'mean' to 'solve" to get the inverse.
# Other function names need to be updated accordingly.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinv(m)
    m
  
}

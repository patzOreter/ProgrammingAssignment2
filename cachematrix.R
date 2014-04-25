## This function takes a matrix input and give inverse of it as output either
## by calculating or taking pre-calculated value from cache

##  makeCacheMatrix takes matrix as argument and returns a list with 4 list items

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
    setsolve = setsolve,
    getsolve= getsolve)
    
}


## a client function that uses "makeCacheMatrix" function in its implementation
##The output is the mean coming whether from the special vector's  cache or computation

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

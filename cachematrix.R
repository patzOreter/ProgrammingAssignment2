## This function takes a matrix input and give inverse of it as output either
## by calculating or taking pre-calculated value from cache

## Assumption: Supplied matrix possible to inverse

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
##The output is the inverse coming whether from the special Matrix's  cache or computation

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        
        x$setsolve(m)
        m
}


## Sample output from Rstudio>> > x
##  >x
##  [,1] [,2]
##  [1,]    1    3
##  [2,]    2    4
##  > a<-makeCacheMatrix(x)
##  > class(x) #check class
##  [1] "matrix"
##  > class(a) #confirm list
##  [1] "list"
##  > class(a$get)
##  [1] "function"
##  > b<-cacheSolve(a)
##  > b              # first run output
##  [,1] [,2]
##  [1,]   -2  1.5
##  [2,]    1 -0.5
##  > b<-cacheSolve(a)    # second run output
##  getting cached data   # result taken from cache

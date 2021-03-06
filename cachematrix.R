## These two function cache the inverse of a matrix

## a list containing a set of functions including set(), get(), setsolve(), getsolve()

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
             getsolve = getsolve)
}


## if the inverse of the matrix is cached it will not need to compute just get the value from the cache, if not cached compute the inverse of the matrix

cacheSolve <- function(x, ...) {
		m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m

        ## Return a matrix that is the inverse of 'x'
}

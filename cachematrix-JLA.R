## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

# set the value of the matrix  
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
#get the value of the matrix 
  
  get <- function() x

# set the value of inverse matrix

  setinvmat <- function(invmat) m <<- invmat

# get the value of inverse matrix

  getinvmat <- function() m
  list(set=set, get=get, setinvmat=setinvmat, getinvmat=getinvmat)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getinvmat()

# Check m is not null
  
  if(!is.null(m)) {
    message("getting cached data.")
    return(m)
  }

# inverse data & set value in cache

  data <- x$get()
  m <- solve(data)
  x$setinvmat(m)

# print m
  m
}

# test with
# > x  <- matrix(1:4, 2, 2)
# > x
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
#
# z <- makeCacheMatrix(x)
# > z$get()
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
#
# > cacheSolve(z)
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
#
# > cacheSolve(z)
# getting cached data.
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5





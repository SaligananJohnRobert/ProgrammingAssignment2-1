## Put comments here that give an overall description of what your
## functions do

## The first function creates a special matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        ## This function creates a special matrix that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {## This defines the argument with the default mode of the matrix
inv<-NULL ## This will initialize the inv as NULL and hold the value of the matrix inverse
        set<-function(y){## This defines the function to assign new designation
                x<<-y; ## This is the value of the matrix in parent environment
                inv<<-NULL; ## This is used if there is a new matrix, it resets inv to NULL
}
        get<-function()x; ## This defines the function
        setinverse<-function(inverse)inv<<-inverse; ## This assign the values of inv to the parent environment
        getinverse<-function()inv; ## This calls the value of the inverse 
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse); ## This is needed for reference


## Write a short comment describing this function
## This function computes the inverse of the special matrix returned by the function of makeCacheMatrix that can be seen above
## Returns a special matrix that is the invese of 'x'
        
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getinverse()
        if(!is.null(inv)) {
                message("fetching cached data")
        return(inv)
   }
   data<-x$get()
   inv<-solve(data,...)
   x$setinverse(inv)
   inv
}


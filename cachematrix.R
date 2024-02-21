# Create a caching function
makeCachingFunction <- function() {
  # Initialize an empty cache
  cache <- NULL
  
  # Define the actual function to be cached
  myFunction <- function(x) {
    # Check if the result is already in the cache
    if (!is.null(cache) && identical(cache$input, x)) {
      cat("Result found in cache! Returning cached result...\n")
      return(cache$result)
    } else {
      cat("Computing result...\n")
      # Compute the result
      result <- mean(x)
      # Update the cache
      cache <<- list(input = x, result = result)
      return(result)
    }
  }
  
  # Return the function
  return(myFunction)
}

# Create a cached function using makeCachingFunction
cachedMean <- makeCachingFunction()

# Test the cached function
vec1 <- c(1, 2, 3, 4, 5)
vec2 <- c(5, 6, 7, 8, 9)

# First call (computes and caches the result)
result1 <- cachedMean(vec1)
cat("Result 1:", result1, "\n")

# Second call with the same input (returns the cached result)
result2 <- cachedMean(vec1)
cat("Result 2:", result2, "\n")

# Third call with a different input (computes and caches the result)
result3 <- cachedMean(vec2)
cat("Result 3:", result3, "\n")

# Fourth call with the same input as the third (returns the cached result)
result4 <- cachedMean(vec2)
cat("Result 4:", result4, "\n")

# ============================================================
# Programming Assignment 2: Lexical Scoping (with safe checks)
# ============================================================

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  .validate_matrix <- function(m) {
    if (!is.matrix(m)) stop("Input must be a matrix.")
    if (!is.numeric(m)) stop("Matrix must be numeric.")
    if (nrow(m) != ncol(m)) stop("Matrix must be square.")
    invisible(TRUE)
  }
  
  if (length(x)) .validate_matrix(x)
  
  set <- function(y) {
    .validate_matrix(y)
    if (!identical(x, y)) {
      x   <<- y
      inv <<- NULL
    }
  }
  
  get    <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}

# Helper: check if a numeric square matrix is (likely) invertible
.is_invertible <- function(A, rank_tol = .Machine$double.eps^0.5,
                           cond_warn = 1e12, verbose = TRUE) {
  n <- nrow(A)
  # rank test via QR: full rank => likely invertible
  r <- qr(A, tol = rank_tol)$rank
  if (r < n) {
    if (isTRUE(verbose)) message("Matrix is not full rank (singular). Skipping inversion.")
    return(FALSE)
  }
  # condition number (large => ill-conditioned)
  k <- tryCatch(kappa(A), error = function(e) Inf)
  if (is.finite(k) && k > cond_warn && isTRUE(verbose)) {
    message(sprintf(
      "Warning: matrix is ill-conditioned (kappa ≈ %.2e). Inverse may be numerically unstable.",
      k
    ))
  }
  TRUE
}

cacheSolve <- function(x, ..., use_message = TRUE, safe_check = TRUE) {
  inv <- x$getinv()
  if (!is.null(inv)) {
    if (isTRUE(use_message)) message("getting cached inverse")
    return(inv)
  }
  
  mat <- x$get()
  if (!length(mat)) {
    if (isTRUE(use_message)) message("No matrix set; use the object's set() first.")
    return(NULL)
  }
  
  # Friendly pre-check: avoid hard error if singular
  if (isTRUE(safe_check)) {
    if (!.is_invertible(mat, verbose = use_message)) {
      # leave cache empty, return NULL politely
      return(NULL)
    }
  }
  
  inv <- tryCatch(
    solve(mat, ...),
    error = function(e) {
      if (isTRUE(use_message)) {
        message("Matrix inversion failed: ", conditionMessage(e))
      }
      return(NULL)
    }
  )
  
  if (!is.null(inv)) x$setinv(inv)
  inv
}



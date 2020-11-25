#' @export
#' @import Matrix
func1 <- function(x){


  Diagonal(x@Dim[2]) + crossprod(x)





}


#' @export
#' @import parallel
func2 <- function(x, n_workers){


  cl <- parallel::makeCluster(n_workers, setup_strategy = "sequential")

  clusterExport(cl, "x", envir = environment())

  # this doesn't work because can't find Diagonal
  clusterEvalQ(cl, {


  Diagonal(x@Dim[2]) + crossprod(x)



  })

}

#' @export
func3 <- function(x, n_workers){


  cl <- parallel::makeCluster(n_workers, setup_strategy = "sequential")

  clusterExport(cl, "x", envir = environment())

  # this doesn't work because can't find Matrix method for crossprod
  clusterEvalQ(cl, {


    Matrix::Diagonal(x@Dim[2]) + crossprod(x)



  })

}





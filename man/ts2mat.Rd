\name{ts2mat}
\alias{ts2mat}
\title{Reshape a vector into a matrix}
\usage{
ts2mat(x, w)
}
\arguments{
  \item{x}{a vector or a time series}

  \item{w}{a number specifying number of columns of the
  matrix}
}
\value{
a matrix
}
\description{
This function reshapes a vector into a matrix whose row
elements are taken from the vector. Orders of elements keep
unchanged from the vector.
}
\examples{
x=ts2mat(c(1:(128*20)),128)
dim(x)
x[1,1:20]
}


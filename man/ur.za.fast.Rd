\name{ur.za.fast}
\alias{ur.za.fast}
\title{Unit root test for events considering a structrual break}
\usage{
ur.za.fast(y, model = c("intercept", "trend", "both"), lag = NULL)
}
\arguments{
  \item{y}{a vector or a time series.}

  \item{model}{Three choices: ``intercept', ``trend' or
  ``both'.}

  \item{lag}{a scalar chosen as lag.}
}
\value{
a list consisting of: \item{flag}{0 if the time series is
is stationary; 1 if it is a unit root process.}
\item{teststat}{ZA unit root test statistic.}
}
\description{
This function performs the Zivot & Andrews unit root test,
which allows a break at an unknown point in either the
intercept, the linear trend or in both.
}
\details{
This function is written refering to the \code{ur.za}
function in the \pkg{urza} package (Pfaff 2008), but it
speeds up executation using the \pkg{RcppArmadillo}
package. Allowing a structrual break, this function returns
flag to be 0 if the time series is stationary and 1 if it
is a unit root process.
}
\examples{
# this is a box function
set.seed(123)
x=cbfs_red('box')
ur.za.fast(x,'both')
# this is a cliff-ramp
set.seed(123)
x=cbfs_red('cr')
ur.za.fast(x,'both')
# this is a random walk process
set.seed(123)
x=cumsum(rnorm(300))
ur.za.fast(x,'both')
}
\references{
Eric Zivot and Donald W K Andrews (1992). Further evidence
on the great crash, the oil-price shock, and the unit-root
hypothesis. \emph{Journal of Business & Economic
Statistics}, \bold{20}(1), 25-44.
\url{http://dx.doi.org/10.1198/073500102753410372}.

Pfaff, Bernhard (2008). Analysis of Integrated and
Cointegrated Time Series with R. Second Edition. Springer,
New York.
\url{http://www.springer.com/statistics/statistical+theory+and+methods/book/978-0-387-75966-1}.
}
\seealso{
\code{\link{noiseTests}}
}


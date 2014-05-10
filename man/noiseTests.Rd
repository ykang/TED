\name{noiseTests}
\alias{noiseTests}
\title{Perform noise tests for a time series}
\usage{
noiseTests(x, w, noiseType = c("white", "red"), parallel = FALSE)
}
\arguments{
  \item{x}{a vector or a time series.}

  \item{w}{a scalar specifying the size of the sliding
  window.}

  \item{noiseType}{background noise assumed for \code{x}.
  There are two options: ``white' or ``red' .}

  \item{parallel}{logical, if TRUE then codes are executed
  in parallel using the \pkg{foreach} package. The user
  must register a parallel backend to use by the \pkg{doMC}
  package.}
}
\value{
test \code{p} value series for the time series \code{x}.
}
\description{
This function performs noise tests on the sliding
subsequences extracted from a time series.
}
\details{
When using this function, the user needs to choose the
background noise type via \code{noiseType} according to the
application context. In atmospheric turbulence, red noise
is used. We first use the Phillips-Perron (PP) Unit Root
Test to test for the unit root process. For the stationary
processes, red noise tests are performed to test for
events. For those cases tested to be unit root processes,
we have to take into consideration a special situation when
there is a structural break in the process. The reason
comes from the difficulty for PP test to distinguish random
walk processes from a stationary process contaminated by a
structural break, both of which result in non-rejection of
the null hypothesis. Random-walk processes are not
considered as events since they are known to be brownian
noise, but stationary processes with structure breaks are,
so it is essential to distinguish them. To this end, an
additional test called Zivot & Andrews (ZA) unit root test
is introduced.This test allows for a structural break in
either the intercept or in the slope of the trend function
of the underlying series. Rejection of the null hypothesis
indicates a potential event (stationary process with a
structural break). Random walk processes result in
non-rejection of the null hypothesis.
}
\examples{
set.seed(123)
n=128
types=c('box','rc','cr','sine')
shapes=matrix(NA,20,n)
for (i in 1:20){
  shapes[i,]=cbfs(type=types[sample(1:4,1)])
}
whitenoise=ts2mat(rnorm(128*20),128)
# generate x which randomly combine the four types of events with each two of them
# seperated by noise
x=c(t(cbind(shapes,whitenoise)))
plot(x,ty='l')
w=128
# execute loops sequentially
tests=noiseTests(x,w,'white',parallel=FALSE)
# execute loops in parallel using doMC package (for non-Windows users)
# tests=noiseTests(x,w,'white',parallel=TRUE)
}
\references{
Pierre Perron (1998). Trends and random walks in
macroeconomic time series: Further evidence from a new
approach. \emph{Journal of economic dynamics and control},
\bold{12}(2), 297-332.
\url{http://dx.doi.org/10.1016/0304-3932(82)90012-5}.

Eric Zivot and Donald W K Andrews (1992). Further evidence
on the great crash, the oil-price shock, and the unit-root
hypothesis. \emph{Journal of Business & Economic
Statistics}, \bold{20}(1), 25-44.
\url{http://dx.doi.org/10.1198/073500102753410372}.

Yanfei Kang, Danijel Belusic and Kate Smith-Miles (2014).
Detecting and Classifying Events in Noisy Time Series.
\emph{J. Atmos. Sci.}, \bold{71}, 1090-1104.
\url{http://dx.doi.org/10.1175/JAS-D-13-0182.1}.
}
\seealso{
\code{\link{eventExtraction}}, \code{\link{plotevents}}
}


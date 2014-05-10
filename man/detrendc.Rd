\name{detrendc}
\alias{detrendc}
\title{Conditionally detrend a time series}
\usage{
detrendc(x, thres = 0.85)
}
\arguments{
  \item{x}{a vector or time series.}

  \item{thres}{a scalar specifying the threshold. When the
  adjusted R square coefficient of the linear fitting is
  larger than this threshold, the linear trend is
  substracted from the original time series. Default is
  0.85.}
}
\value{
detrended \code{x}.
}
\description{
This function detrends a time series when its linear trend
is more significant than a threshold.
}
\examples{
t=seq(0.001,1,0.001)
set.seed(123)
x=10*t+rnorm(1000)
dtrx=detrendc(x)
# plot the simulated x
plot(t,x,ty='l',xlab='t',ylab='x')
# plot the detrended x
lines(t,dtrx,col=2)
legend(0,12,legend=c('x','detrended x'),col=c(1,2),lty=1)
}


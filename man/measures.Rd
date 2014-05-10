\name{measures}
\alias{measures}
\title{Calculate statistical characteristics of an event}
\usage{
measures(x)
}
\arguments{
  \item{x}{a time series}
}
\value{
a vector consisting of statistical characteristics of event
\code{x}
}
\description{
This function calculates statistical characteristics for
detected events.
}
\details{
Measures used here are standard deviation, kurtosis,
skewness, HD (the absolute Difference between averages of
the first and second Half ), nonsmoothness, test statistic
of PP test and ZA test, and maximum, minimum, and kurtosis
of the first-order difference of the events. Please see the
reference for details (Kang et al. 2014).
}
\examples{
set.seed(123)
n=128
measures(cbfs('box'))
measures(cbfs('sine'))
}
\references{
Yanfei Kang, Danijel Belusic, Kate Smith-Miles (2014).
Classes of structures in the stable at- mospheric boundary
layer. Submitted to Quarterly Journal of the Royal
Meteorological Society.
}
\seealso{
\code{\link{eventCluster}}
}


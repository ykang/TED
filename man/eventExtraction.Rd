\name{eventExtraction}
\alias{eventExtraction}
\title{Extract events from time series}
\usage{
eventExtraction(tests, w, alpha = 0.05)
}
\arguments{
  \item{tests}{test p values from the noist tests for the
  subsequences.}

  \item{w}{sliding window size.}

  \item{alpha}{the significance level. When the noise test
  p value of the subsequence is smaller than this
  significance level, it is a potential event. Default is
  0.05.}
}
\value{
a list consisting:

\item{start}{a vector consisting of starting points of
events.}

\item{end}{a vector consisting of ending points of events.}

\item{tests}{smoothed test \code{p} value series.}

\item{nevents}{number of detected events.}
}
\description{
This function returns the starting and ending points of
events according to the noise test results from a time
series.
}
\references{
Yanfei Kang, Danijel Belusic, Kate Smith-Miles (2014):
Detecting and Classifying Events in Noisy Time Series.
\emph{J. Atmos. Sci.}, \bold{71}, 1090-1104.
\url{http://dx.doi.org/10.1175/JAS-D-13-0182.1}.
}


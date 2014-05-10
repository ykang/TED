\name{cbfs}
\alias{cbfs}
\title{Generate an artificial event with white noise}
\usage{
cbfs(type = c("box", "rc", "cr", "sine"), A = 10, sigma = 1)
}
\arguments{
  \item{type}{type of the event to be generated. There are
  four options: `box', `rc',`cr',`sine' representing a box,
  cliff-ramp, ramp-cliff or a sine function.}

  \item{A}{amplitude of the event; default is 10.}

  \item{sigma}{a scalar specifying the level of white
  noise. Default is 1, which means the standard deviation
  of noise is 1.}
}
\value{
an artificial event with white noise.
}
\description{
This function generates a box, cliff-ramp, ramp-cliff or a
sine function with different levels of white noise as the
background noise. Length of the generated event is 128.
Generation of events are similar to that of
Cylinder-Bell-Funnel dataset in the reference below (Keogh
and Lin 2005).
}
\examples{
# generate a box function with white noise
set.seed(123)
x1 = cbfs(type = 'box', sigma = 1)
# generate a box function with higher level noise
set.seed(123)
x2 = cbfs(type = 'box', sigma = 3)
# plot them
par(mfrow=c(1,2))
plot(x1,type='l',xlab='t',ylab=expression(x[1]))
plot(x2,type='l',xlab='t',ylab=expression(x[2]))
}
\references{
Eamonn Keogh and Jessica Lin (2005). Clustering of
time-series subsequences is meaningless: implications for
previous and future research. \emph{Knowl. Inf. Syst.},
\bold{8}(2), 154-177. \url{http://dblp.uni-
trier.de/db/journals/kais/kais8.html#KeoghL05}.

Yanfei Kang, Kate Smith-Miles, Danijel Belusic (2013). How
to extract meaningful shapes from noisy time-series
subsequences? \emph{2013 IEEE Symposium on Computational
Intelligence and Data Mining}, Singapore, 65-72.
\url{http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6597219&isnumber=6597208}.

Yanfei Kang, Danijel Belusic, Kate Smith-Miles (2014).
Detecting and Classifying Events in Noisy Time Series.
\emph{J. Atmos. Sci.}, \bold{71}, 1090-1104.
\url{http://dx.doi.org/10.1175/JAS-D-13-0182.1}.
}


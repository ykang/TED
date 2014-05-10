\name{eventDetection}
\alias{eventDetection}
\title{Detect events from time series}
\usage{
eventDetection(x, w, noiseType = c("white", "red"), parallel = FALSE,
  alpha = 0.05, data = c("art", "real"))
}
\arguments{
  \item{x}{a vector or time series.}

  \item{w}{size of the sliding window.}

  \item{noiseType}{background noise type assumed for x.
  There are two options: white noise or red noise.}

  \item{parallel}{logical, if TRUE then codes are executed
  in parallel using \pkg{foreach} package. The user must
  register a parallel backend to use by the \pkg{doMC}
  package.}

  \item{alpha}{the significance level. When the noise test
  p value of the subsequence is smaller than this
  significance level, it is defined as a potential event.
  Default is 0.05.}

  \item{data}{type of data being analysed. There are two
  options: `art' if analysed data is artificial data and
  `real' if analysed data is real world turbulence data.
  Please see the details in Kang et al. (2014).}
}
\value{
an object of class 'events' with the components listed
below:

\item{x}{the original time series.}

\item{start}{a vector consisting of starting points of
events.}

\item{end}{a vector consisting of ending points of events.}

\item{nevents}{number of detected events.}
}
\description{
This function finds events from a time series.
}
\examples{
##################################
#   1st art eg (white noise)
##################################
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
x=c(rnorm(128),t(cbind(shapes,whitenoise)))
plot(x,ty='l')
# specify a sliding window size and significant level
# w=128; alpha=0.05
# events=eventDetection(x,w,'white',parallel=FALSE,alpha,'art')
##################################
#   2nd art eg (red noise)
##################################
set.seed(123)
# set a red noise level
coeff=0.5;s=1
# generated x with red noise as the background; this time series is the one used in
# Kang et al. (2014)
x=c(arima.sim(list(order = c(1,0,0),ar=coeff),n=500,sd=s),
    cbfs_red('rc'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('cr'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('box'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('sine'),arima.sim(list(order = c(1,0,0),ar=coeff),n=1000,sd=s),
    arima.sim(list(order = c(1,0,0),ar=0.8),n=1100,sd=4))
# specify a sliding window size and significant level
# w=128; alpha=0.05
# event detection
# events=eventDetection(x,w,'red',parallel=FALSE,alpha,'art')
##################################
#   CASES-99 dataset (9.5m)
##################################
# window size which needs to be chosen by the user
w=120
# specify a significant level
alpha=0.05
# event detection from CASES99 data
# data(CASES99)
# CASESevents=eventDetection(CASES99,w,'red',parallel=FALSE,alpha,'real')
}
\references{
Yanfei Kang, Danijel Belusic, Kate Smith-Miles (2014):
Detecting and Classifying Events in Noisy Time Series.
\emph{J. Atmos. Sci.}, \bold{71}, 1090-1104.
\url{http://dx.doi.org/10.1175/JAS-D-13-0182.1}.

Gregory S. Poulos, William Blumen, David C. Fritts, Julie
K. Lundquist, Jielun Sun, Sean P. Burns, Carmen Nappo,
Robert Banta, Rob Newsom, Joan Cuxart, Enric Terradellas,
Ben Balsley, and Michael Jensen. CASES-99: A comprehensive
investigation of the stable nocturnal boundary layer
(2002). \emph{Bulletin of the American Meteorological
Society}, \bold{83}(4):555-581.
}
\seealso{
\code{\link{noiseTests}}, \code{\link{eventExtraction}},
\code{\link{plotevents}}
}


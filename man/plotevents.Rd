\name{plotevents}
\alias{plotevents}
\title{Plot the detected events}
\usage{
plotevents(events, cluster = FALSE, mycl, ...)
}
\arguments{
  \item{events}{an object of class `events'.}

  \item{cluster}{logical, if TRUE then the detected events
  are highlighted using different colors for different
  clusters}

  \item{mycl}{a vector specifying which cluster each event
  belongs to}

  \item{...}{other arguments that can be passed to plot}
}
\value{
...
}
\description{
This function plots the detected events from a time series.
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
w=128; alpha=0.05
# event detection
# events=eventDetection(x,w,'white',FALSE,alpha,'art')
# clustering events
# cc=eventCluster(events,4)
# myclkm=cc$cl
# plot the clustered events
# plotevents(events,cluster=TRUE, myclkm)
##################################
#   2nd art eg (red noise)
##################################
set.seed(123)
# generate a time series with red noise; this is the same with the one used
# in Kang et al. (2014)
coeff=0.5;s=1
x=c(arima.sim(list(order = c(1,0,0),ar=coeff),n=500,sd=s),
    cbfs_red('rc'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('cr'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('box'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('sine'),arima.sim(list(order = c(1,0,0),ar=coeff),n=1000,sd=s),
    arima.sim(list(order = c(1,0,0),ar=0.8),n=1100,sd=4))
w=128; alpha=0.05
# event detection
# events=eventDetection(x,w,'red',parallel=FALSE,alpha,'art')
# plot events without clustering
# plotevents(events)
}
\references{
Yanfei Kang, Danijel Belusic and Kate Smith-Miles (2014).
Detecting and Classifying Events in Noisy Time Series.
\emph{J. Atmos. Sci.}, \bold{71}, 1090-1104.
\url{http://dx.doi.org/10.1175/JAS-D-13-0182.1}.
}
\seealso{
\code{\link{noiseTests}}, \code{\link{eventExtraction}},
\code{\link{eventDetection}}
}


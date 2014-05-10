\name{cbfs_red}
\alias{cbfs_red}
\title{Generate an artificial event with red noise}
\usage{
cbfs_red(type = c("box", "rc", "cr", "sine"), A = 10, s = 1,
  coeff = 0.5)
}
\arguments{
  \item{type}{type of the event to be generated. There are
  four options: ``box', ``rc',``cr',``sine' representing a
  box, cliff-ramp, ramp-cliff or a sine function.}

  \item{A}{amplitude of the event; default is 10.}

  \item{s}{standard deviation of the AR(1) model
  innovations.  Default is 1.}

  \item{coeff}{coefficient of the AR(1) process, which is
  used to control the level of red noise. Default is 0.5.}
}
\value{
an artificial event with red noise.
}
\description{
This function generates a box, cliff-ramp, ramp-cliff or a
sine function with red noise (AR(1)) as the background
noise.  Length of the generated event is 128.
}
\examples{
# generate a box function with red noise
set.seed(123)
x = cbfs_red(type = 'box', coeff=0.5, s=1, A=10)
# plot it
plot(x,type='l',xlab='t',ylab='x')
}


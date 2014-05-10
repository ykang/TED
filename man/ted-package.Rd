\name{ted-package}
\alias{ted-package}
\docType{package}
\title{Detect and classify events from turbulence time series}
\details{
The package contains two main functions:


{\code{\link{eventDetection}}}: to detect events from time series as described in Kang et al. (2014b).

{\code{\link{eventCluster}}}:  to classify the detect events from time series as described in Kang et al. (2014b).

The package also contains functions for visualising the events:

\code{\link{plotevents}}:  to plot the detected and classified events.

\code{\link{aniplotevents}}:  to generate a gif to visualise the event detection process.

Other sub-functions are:

\code{\link{cbfs}}: to generate an artificial event with white noise.

\code{\link{cbfs_red}}: to generate an artificial event with red noise.

\code{\link{detrendc}}: to conditionally detrend a time series.

\code{\link{eventExtraction}}: to extract events from the noise test results of a time series.

\code{\link{measures}}: to calculate statistical characteristics of an event.

\code{\link{noiseTests}}: to perform noise tests for a time series.

\code{\link{ts2mat}}: to reshape a vector into a matrix.

\code{\link{ur.za.fast}}: unit root test for events considering a structrual break.

The real world turbulence dataset used in this package is available by loading:

{\code{\link{CASES99}}: one day of 1-s averages of the thermocouple temperature data from CASES-99 dataset (Poulos et al. (2002)).}

}
\description{
\pkg{TED} performs event detection and classification in turbulence time series. The method consists of two steps. The event detection step locates and detects events by performing noise tests on sliding subsequences extracted from the time series. A subsequence is considered to be a potential event if its characteristics are significantly different from noise. The event is defined only if the consecutive sequence of potential events is long enough. This step does not rely on pre-assumption of events in terms of their magnitude, geometry, or stationarity. The main function \code{\link{eventDetection}} should be used for this step. The event classification step is to classify the events into groups with similar global characteristics. Each event is summarised using a feature vector, and then the events are clustered according to the Euclidean distances among the feature vectors. The main function \code{\link{eventCluster}} should be used for the classification step. Examples of event detection and classification can be found in the package for both artificial data and real world turbulence data.
}


\author{
Yanfei Kang, Danijel Belusic and Kate Smith-Miles

Maintainer: Yanfei Kang <yanfei.kang@monash.edu>}


\references{
Yanfei Kang, Kate Smith-Miles, Danijel Belusic (2013). How to extract meaningful shapes from noisy time-series subsequences? \emph{2013 IEEE Symposium on  Computational Intelligence and Data Mining}, Singapore, 65-72.
\url{http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6597219&isnumber=6597208}. 

Yanfei Kang, Danijel Belusic, Kate Smith-Miles (2014a). Detecting and Classifying Events in Noisy Time Series. \emph{J. Atmos. Sci.}, \bold{71}, 1090-1104. \url{http://dx.doi.org/10.1175/JAS-D-13-0182.1}.

Yanfei Kang, Danijel Belusic, Kate Smith-Miles (2014b). Classes of structures in the stable at- mospheric boundary layer. Submitted to Quarterly Journal of the Royal Meteorological Society.

Xiaozhe Wang, Kate Smith-Miles and  Rob Hyndman (2005). Characteristic-Based Clustering for Time Series Data. \emph{Data Mining and Knowledge Discovery}. \bold{13}(3), 335-364. \url{http://dx.doi.org//10.1007/s10618-005-0039-x}.

Gregory S. Poulos, William Blumen, David C. Fritts, Julie
K. Lundquist, Jielun Sun, Sean P. Burns, Carmen Nappo,
Robert Banta, Rob Newsom, Joan Cuxart, Enric Terradellas,
Ben Balsley, and Michael Jensen. CASES-99: A comprehensive
investigation of the stable nocturnal boundary layer
(2002). \emph{Bulletin of the American Meteorological
Society}, \bold{83}(4):555-581.

}


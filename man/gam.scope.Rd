\name{gam.scope}
\alias{gam.scope}
\title{
Generate a scope for step.gam
}
\description{Given a data.frame as an argument, generate a scope list
  for use in step.gam, each element of which gives the candidates for
  that term.
}
\usage{
gam.scope(frame, response=1, smoother = "s", arg = NULL, form = TRUE)
}
\arguments{
  \item{frame}{
a data.frame to be used in \code{step.gam}. Apart from the response
column, all other columns will be used.
}
\item{response}{
The column in \code{frame} used as the response. Default is 1. 
}
  \item{smoother}{
which smoother to use for the nonlinear terms; i.e. "s" or "lo", or any
other supplied smoother. Default is "s".
}
  \item{arg}{a character (vector), which is the
argument to \code{smoother}. For example, \code{arg="df=6"} would
result in the expression \code{s(x,df=6)} for a column named "x".
This can be a vector, for example \code{arg=c("df=4","df=6")}, which
would result two smooth terms.
}
  \item{form}{
if \code{TRUE}, each term is a formula, else a character vector.
}
}
\details{
This function creates a similar scope formula for each variable in the
frame. A column named "x" by default will generate a scope term
\code{~1+x+s(x)}. With \code{arg=c("df=4","df=6")} we get \code{~1+x+s(x,df=4)+s(x,df=6)}.
With form=FALSE, we would get the character vector \code{c("1","x","s(x,df=4)","s(x,df=6")}.
}
\value{
a scope list is returned, with either a formula or a character vector
for each term, whcih describes the candidates for that term in the gam.  
}
\references{
  Hastie, T. J. (1991)
  \emph{Generalized additive models.}
  Chapter 7 of \emph{Statistical Models in S}
  eds J. M. Chambers and T. J. Hastie, Wadsworth \& Brooks/Cole.
}
\author{
  Written by Trevor Hastie, following closely the design in the
  "Generalized Additive Models" chapter (Hastie, 1992) in Chambers and
  Hastie (1992).
  This version of \code{gam.scope} is adapted from the S
  version.
}
\seealso{\code{\link{step.gam}}
}
\examples{
data(gam.data)
gdata=gam.data[,1:3]
gam.scope(gdata,2)
gam.scope(gdata,2,arg="df=5")
gam.scope(gdata,2,arg="df=5",form=FALSE)
gam.scope(gdata,2,arg=c("df=4","df=6"))
}
\keyword{models}
\keyword{regression}
\keyword{nonparametric}
\keyword{smooth}


% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/q_dtm.R
\name{q_dtm}
\alias{q_dtm}
\alias{q_dtm_stem}
\title{Quick DocumentTermMatrix}
\usage{
q_dtm(text, docs = seq_along(text), to = "tm", keep.hyphen = FALSE,
  ngrams = NULL, ...)

q_dtm_stem(text, docs = seq_along(text), to = "tm", keep.hyphen = FALSE,
  ngrams = NULL, ...)
}
\arguments{
\item{text}{A vector of strings.}

\item{docs}{A vector of document names.}

\item{to}{target conversion format, consisting of the name of the package into
whose document-term matrix representation the dfm will be converted:
\describe{
\item{\code{"lda"}}{a list with components "documents" and "vocab" as needed by
\code{lda.collapsed.gibbs.sampler} from the \pkg{lda} package}
\item{\code{"tm"}}{a \link[tm]{DocumentTermMatrix} from the \pkg{tm} package}
\item{\code{"stm"}}{the  format for the \pkg{stm} package}
\item{\code{"austin"}}{the \code{wfm} format from the \strong{austin} package}
\item{\code{"topicmodels"}}{the "dtm" format as used by the \pkg{topicmodels} package}
}}

\item{keep.hyphen}{logical.  If \code{TRUE} hyphens are retained in the terms
(e.g., "math-like" is kept as "math-like"), otherwise they become a split for
terms (e.g., "math-like" is converted to "math" & "like").}

\item{ngrams}{A vector of ngrams (multiple wrds with spaces).  Using this
option results in the ngrams that will be retained in the matrix.}

\item{\ldots}{Additional arguments passed to \code{\link[quanteda]{dfm}}.}
}
\value{
Returns a \code{\link[tm]{DocumentTermMatrix}}.
}
\description{
Make a \code{\link[tm]{DocumentTermMatrix}} from a vector of text and and
optional vector of documents.  To stem a document as well use the
\code{q_dtm_stem} version of \code{q_dtm} which uses \pkg{SnowballC}'s
\code{\link[SnowballC]{wordStem}}.
}
\examples{
(x <- with(presidential_debates_2012, q_dtm(dialogue, paste(time, tot, sep = "_"))))
tm::weightTfIdf(x)

(x2 <- with(presidential_debates_2012, q_dtm_stem(dialogue, paste(time, tot, sep = "_"))))
remove_stopwords(x2, stem=TRUE)

bigrams <- c('make sure', 'governor romney', 'mister president',
    'united states', 'middle class', 'middle east', 'health care',
    'american people', 'dodd frank', 'wall street', 'small business')

grep(" ", x$dimnames$Terms, value = TRUE) #no ngrams

(x3 <- with(presidential_debates_2012,
    q_dtm(dialogue, paste(time, tot, sep = "_"), ngrams = bigrams)
))

grep(" ", x3$dimnames$Terms, value = TRUE) #ngrams
}
\seealso{
\code{\link[quanteda]{dfm}},
\code{\link[quanteda]{convert}}
}
\keyword{DocumentTermMatrix}
\keyword{dtm}

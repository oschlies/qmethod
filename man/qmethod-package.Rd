\name{qmethod-package}
\alias{qmethod-package}
\alias{qmethod-package}
\docType{package}
\title{Package for Q methodology analysis}
\description{
	Q is a methodology to study the distinct perspectives existing within a group on a topic of interest.
	It is used across social, health, and environmental studies.
	See the references below for more details about the methodology.

  \subsection{Overview}{
    This package performs the analysis of Q methodology data using principal components analysis, varimax rotation (replaceable by other rotations allowed in \code{\link[psych]{principal}}), and automatic flagging (manual flagging is optional).

    The following steps of the analysis correspond to separate functions: factor loadings for Q-sorts, automatic flagging of Q-sorts (\code{\link{qflag}}), z-scores and rounded scores for statements (\code{\link{qzscores}}), distinguishing and consensus statements (\code{\link{qdc}}), and general characteristics of the factors (\code{\link{qfcharact}}).
    The function \code{\link{qmethod}} wraps them all.

    The functions for each step may be used separately for advanced analysis, for example, for manual flagging (see details in \code{\link{qzscores}}).

    The package also includes additional functions for the following:

    \itemize{
      \item Import data from PQMethod software (\code{\link{import.pqmethod}}).
      \item Export a plain text report of the analysis for interpretation in two flavours (\code{\link{export.qm}}).
      \item Generic methods to \code{print} and \code{plot} Q method results.
      \item Generate cards for the administration of a Q study. The function \code{\link{make.cards}} produces a PDF with full item wording and codes, ready for printout on business card templates that can be easily broken into individual Q-cards.
      \item Several functions to aid reproducible research, by importing the following from raw, separate *.CSV files for each respondent or item:
      \itemize{
         \item Q-sorts (\code{\link{import.q.sorts}})
         \item Participant item feedback (\code{\link{import.q.feedback}})
         \item Complete concourses (\code{\link{import.q.concourse}})
         \item Item samples (\code{\link{build.q.set}})
      }
    }
    Use \code{help(package="qmethod")} for a list of all the functions.
  }

  \subsection{Terminology}{
    The functions for analysis use the terms standard in Q methodology.

    In addition, the optional functions to import raw data from separate *.CSV files (\code{\link{import.q.sorts}}, \code{\link{import.q.concourse}}, \code{\link{build.q.set}}, \code{\link{import.q.feedback}}) and the card printing function (\code{\link{make.cards}}) refer to items in three distinct ways:
    \enumerate{
      \item Item \strong{full wording}, is the complete item, such as "\samp{One small community of indomitable Q-methodologists ...}" (from \code{\link{importexample}}).
        This item can be read in from individual *.TEX files by using \code{\link{import.q.concourse}}.
        The wording is not passed on to any other function, but can be readily retrieved from the object returned from \code{\link{import.q.concourse}}.
      \item The item \strong{handle} is a shorthand way of referring to an item, which should be \emph{meaningful} to the researcher (e.g. \code{"life-with-q"}).
        Item handles are \emph{researcher-facing} and can be used to refer to items during data \emph{analysis}.
        Item handles are read in from the \emph{filenames} of individual *.TEX when using \code{\link{import.q.concourse}}.
        Handles can be used to identify items in other functions and their outputs.
        For example, the resulting array or matrix from \code{\link{import.q.sorts}} carries these handles as row names.
      \item The item \strong{ID} is another shorthand way of referring to an item, that should be \emph{meaningless} to humans (so as not to influence the participants in unintended ways), such as an arbitrary string of characters.
      Item IDs are \emph{participant-facing} and are used to identify items during data \emph{entry}.
      The item ID can take two forms, depending on function arguments specified by the user:
      \enumerate{
        \item Standard \strong{IDs} (such as \kbd{sta12}, \kbd{sta13}) which are generated automatically in \code{\link{qmethod}} or can be provided by the user using the respective \code{manual.lookup} arguments in \code{\link{make.cards}}, \code{\link{import.q.sorts}} and \code{\link{import.q.feedback}}.
        See the documentation of these functions for details.
        \item A set of hexadecimal \strong{hashed IDs} (such as \kbd{ae128fs}) can be automatically generated and expected by the functions \code{\link{make.cards}}, \code{\link{import.q.sorts}} and \code{\link{import.q.feedback}} if the \code{manual.lookup} argument remains empty and defaults to \code{NULL}.
        In that case, IDs are computed by ``summarizing'' the \emph{complete} item wordings ("\samp{Q Method is used by a crazy, but charming community of ...}") into a hexadecimal number ("\kbd{ae128fs}"), a process known as cryptographic \emph{hashing} (for more details see the \pkg{digest} function).
        These hash values change whenever \emph{anything} in the full item wordings is changed, and allow a precise identification of different versions of an item.
        This function never exposes users to the hash values; the encrypting and decrypting are done under the hood by the respective functions.
        Automatic, hashed IDs are generally recommended and easier to use, but some caveats apply (see \code{\link{make.cards}}).
      }
    }
  For more information on this terminology and the rationale behind it, consider the best practices suggested by Maximilian Held on the package \href{https://github.com/aiorazabala/qmethod/wiki/Data-management}{wiki}.
  }

  \subsection{Suggested File Structure}{
    For studies in which each Q-sort and item are kept in separate *.CSV files, the import functions \code{\link{import.q.sorts}}, \code{\link{import.q.concourse}}, \code{\link{build.q.set}}, \code{\link{import.q.feedback}} and the print function \code{\link{make.cards}} require a nested directory structure in the study folder, an example of which can be found in \code{../qmethod/extdata/importexample}.
    Although recommended for complex studies, this structure is not necessary for using the data analysis functions or for exploring and exporting results.

    If the suggested file structure is followed, the subdirectories for (within-subjects) \emph{conditions} and \emph{languages} are optional, and need to be used only if there are more than one condition and language, respectively.
    Arguments \code{conditions} and \code{languages} for the above import functions must be specified accordingly.

    For more information on the file structure and the rationale behind it, consider the best practices suggested by Maximilian Held on the package \href{https://github.com/aiorazabala/qmethod/wiki/Data-management}{wiki}.
  }
}
\author{
  Aiora Zabala\cr
  \url{http://www.landecon.cam.ac.uk/directory/aiora-zabala}

Maintainer: Aiora Zabala \email{aiora.zabala@gmail.com}
}
\references{
Zabala, A., 2014. qmethod: A Package to Explore Human Perspectives Using Q Methodology. \emph{The R Journal}, 6(2):163-173.\cr Available from: \url{http://journal.r-project.org/archive/2014-2/zabala.pdf}.

Watts, S., and and P. Stenner, 2012. \emph{Doing Q Methodological Research: Theory, Method & Interpretation}, London: Sage Publications Ltd.

Van Exel, J., and G. de Graaf, 2005. \emph{Q Methodology: A Sneak Preview}\cr Available from: \url{http://qmethod.org/articles/vanExel.pdf}.

Brown, S. R., 1980. \emph{Political subjectivity: Applications of Q methodology in political science}, New Haven, CT: Yale University Press.\cr Available from: \url{http://qmethod.org/papers/Brown-1980-PoliticalSubjectivity.pdf}.

\url{http://qmethod.org/}\cr
The website of the \emph{International Society for the Scientific Study of Subjectivity}.

\url{http://schmolck.org/qmethod}\cr
Peter Schmolck's Q Method Page, with further references, datasets and the PQMethod software.
}
\examples{
data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax",
                   forced = TRUE)
summary(results)
results
}

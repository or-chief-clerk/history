#' Oregon House Representatives
#'
#' A dataset containing the chronological list of Oregon House representatives 
#' since 1849 to present.
#' 
#' @format A tibble with 7381 rows and 13 variables where each row represents 
#' a legislator in a particular legislative session:
#' \describe{
#'   \item{session_name}{Legislative session}
#'   \item{legislator}{Name of representative}
#'   \item{district}{The legislative district they represented in this session}
#'   ...
#' }
#' The date the data was retrieved from the Chief Clerk's page is 
#' available in a \code{retrieved} attribute.
#' @source \url{https://www.oregonlegislature.gov/chief-clerk/Pages/representatives.aspx}
#' @importFrom tibble tibble
#' @examples
#' house_reps
#' attr(house_reps, "retrieved")
"house_reps"

#' Oregon House Representatives in regular sessions
#'
#' A dataset containing the chronological list of Oregon House representatives 
#' in regular sessions since Oregon was a state (1860) to present.
#' 
#' @format A tibble with 7381 rows and 13 variables where each row represents 
#' a legislator who was in office at the start of a particular legislative session:
#' \describe{
#'   \item{session_name}{Legislative session}
#'   \item{legislator}{Name of representative}
#'   \item{district}{The legislative district they represented in this session}
#'   \item{party}{The affiliation of the legislator at the start of the session.}
#' }
#' 
#' @source \url{https://www.oregonlegislature.gov/chief-clerk/Pages/representatives.aspx}
#' @importFrom tibble tibble
#' @examples
#' house_reps_regular
"house_reps_regular"

#' Political party info
#'
#' Named character vectors that provide lookup tables for abbreviations and
#' possible colors for political parties in \code{\link{house_reps}} and
#' \code{\link{house_reps_regular}}.
#' 
#' @format Named character vectors
#' \describe{
#'   \item{party_abbr}{Abbreviated names for political parties}
#'   \item{party_colors}{Suggested colors for political parties}
#' }
#' @source Abbreviations match those used in \url{https://www.oregonlegislature.gov/chief-clerk/Pages/representatives.aspx}
#' @aliases party_abbr
#' @examples 
#' if (require(ggplot2)) {
#'   ggplot(house_reps_regular, aes(session_year)) +
#'     geom_bar(aes(fill = party), width = 1) +
#'     scale_fill_manual(values = party_colors)
#' }
"party_colors"

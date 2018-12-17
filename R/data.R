#' Oregon House Representatives
#'
#' A dataset containing the chronological list of Oregon House representatives 
#' since 1849 to present.
#' 
#' @format A tibble with 7,381 rows and 12 variables where each row represents 
#' a legislator in a particular legislative session:
#' \describe{
#'   \item{session_name}{legislative session}
#'   \item{legislator}{name of representative}
#'   \item{district}{legislative district they represented in this session}
#'   \item{role}{any roles they occupied during the session, e.g. "Speaker"}
#'   \item{party}{political party the legislator is affiliated with. Affilations
#'   separated by slashes, indicate a change in affiliation during the session.}
#'   \item{residence}{counties included in the legislators district}
#'   \item{gender}{legislator's gender}
#'   \item{desk_number}{the desk at which the legislator sits in the house}
#'   \item{profession}{legislator's profession}
#'   \item{notes}{any other information about the legislators term}
#'   \item{session_year}{the integer year of the session}
#'   \item{regular}{is this a "Regular" session?}
#' }
#' The date the data was retrieved from the Chief Clerk's page is 
#' available in a \code{retrieved} attribute.
#' @source \url{https://www.oregonlegislature.gov/chief-clerk/Pages/representatives.aspx}
#' @importFrom tibble tibble
#' @seealso [`house_reps_regular`] for only legislators present at the start of 
#' regular sessions, [`party_colors`] for some suggested colors for plotting party
#' affiliation.
#' @examples
#' house_reps
#' attr(house_reps, "retrieved")
"house_reps"

#' Oregon House Representatives in regular sessions
#'
#' A dataset containing the chronological list of Oregon House representatives 
#' in regular sessions since Oregon was a state (1860) to present.
#' 
#' `house_reps_regular` is a more processed data set than [`house_reps`], in
#' particluar it:
#'
#' * only includes *Regular* sessions,
#' * after OR became a state, with
#' * legislators in the house at the **start** of the session, and 
#' * their party affiliation at the **start** of the session.
#' 
#' @format A tibble with 4,827 rows and 12 variables where each row represents 
#' a legislator who was in office **at the start of a regular** legislative session:
#' \describe{
#'   \item{session_name}{legislative session}
#'   \item{legislator}{name of representative}
#'   \item{district}{legislative district they represented in this session}
#'   \item{role}{any roles they occupied during the session, e.g. "Speaker"}
#'   \item{party}{political party the legislator is affiliated with at the 
#'   **start** of the legislative session}
#'   \item{residence}{counties included in the legislators district}
#'   \item{gender}{legislator's gender}
#'   \item{desk_number}{the desk at which the legislator sits in the house}
#'   \item{profession}{legislator's profession}
#'   \item{notes}{any other information about the legislators term}
#'   \item{session_year}{the integer year of the session}
#'   \item{regular}{is this a "Regular" session?}
#' }
#' 
#' @source \url{https://www.oregonlegislature.gov/chief-clerk/Pages/representatives.aspx}
#' @importFrom tibble tibble
#' @seealso [`house_reps`] for legislators in all sessions, [`party_colors`] for some suggested colors for plotting party
#' affiliation.
#' @examples
#' house_reps_regular
"house_reps_regular"

#' Political party info
#'
#' Named character vectors that provide lookup tables for abbreviations and
#' possible colors for political parties in the OR House of Representatives.
#' 
#' @format Named character vectors, where the names are historical 
#' parties present in [`house_reps`] and [`house_reps_regular`]
#' \describe{
#'   \item{party_abbr}{Values contain abbreviated names for political parties}
#'   \item{party_colors}{Values contain Hex codes for suggested colors for political parties}
#' }
#' @source Abbreviations match those used in \url{https://www.oregonlegislature.gov/chief-clerk/Pages/representatives.aspx}
#' @seealso [`house_reps`], [`house_reps_regular`]
#' @aliases party_abbr
#' @examples 
#' if (require(ggplot2)) {
#'   ggplot(house_reps_regular, aes(session_year)) +
#'     geom_bar(aes(fill = party), width = 1) +
#'     scale_fill_manual(values = party_colors)
#' }
"party_colors"

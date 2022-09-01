#' Shortcut for executing `BiocCheck` on the current package
#'
#' `BiocCheck` provides Bioconductor flavored checks for
#' your package. It provides recommendations for good
#' practices.
#'
#' @param pkgDir The package directory to be build usually the current working
#'   directory (i.e., ".")
#'
#' @param callr logical(1) Whether to use `callr` to execute the check in
#'   a background R session. This is helpful for avoiding namespace collisions
#'   and adding objects to the current environment.
#'
#' @param ... Additional arguments for `BiocCheck`
#'
#' @examples
#'
#' if (interactive()) {
#'     runBiocCheck()
#' }
#'
#' @export
runBiocCheck <- function(pkgDir = ".", callr = TRUE, ...) {
    pkgPath <- devtools::as.package(pkgDir)[["path"]]
    BiocCheck::BiocCheck(package = pkgPath, callr = callr, ...)
}

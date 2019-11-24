#' Shortcut for executing BiocCheck on the current package
#'
#' BiocCheck provides Bioconductor flavoured checks for
#' your package. It provides recommendations for good
#' practices.
#'
#' @param pkgDir The package directory to be build usually the current working
#'     directory (i.e., ".")
#' @param ... Additional arguments for BiocCheck
#'
#' @export
runBiocCheck <- function(pkgDir = ".", ...) {
    pkgPath <- devtools::as.package(pkgDir)[["path"]]
    BiocCheck::BiocCheck(package = pkgPath, ...)
}

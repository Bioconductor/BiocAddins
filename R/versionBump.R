#' Bump the current package's patch version
#'
#' Take the packages version number (x.y.z) and bump the `z` version of the
#' package. This is also known as the 'patch' version.
#'
#' @inheritParams runBiocCheck
#'
#' @examples
#'
#' if (interactive()) {
#'     bumpVersion()
#' }
#'
#' @importFrom desc desc
#' @export
bumpVersion <- function(pkgDir = ".") {
    pkgPath <- devtools::as.package(pkgDir)[["path"]]
    desc <- desc::desc(file = file.path(pkgPath, "DESCRIPTION"))
    desc$bump_version("patch")
    desc$write()
}

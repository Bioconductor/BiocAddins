#' Bump the current package's patch version
#'
#' Take the packages version number (x.y.z) and bump the `z` version of the
#' package. This is also known as the 'patch' version.
#'
#' @details Set the option `options('BiocAddins.autocommit')` to `FALSE` to
#'   avoid automatic `DESCRIPTION` file commits.
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
bumpVersion <-
    function(pkgDir = ".", commit = getOption('BiocAddins.autocommit', TRUE))
{
    pkgPath <- devtools::as.package(pkgDir)[["path"]]
    desc <- desc::desc(file = file.path(pkgPath, "DESCRIPTION"))
    desc$bump_version("patch")
    desc$write()
    if (commit) {
        system2("git", "add DESCRIPTION")
        system2("git",
            args = paste0("commit -m 'version bump ",
                as.character(desc$get_version()), "'")
        )
    }
}

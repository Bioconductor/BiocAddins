#' Bump the current package's patch version
#'
#' Take the packages version number (x.y.z) and bump the `z` version of the
#' package. This is also known as the 'patch' version. Note this function
#' also updates the `Date` field in the `DESCRIPTION` file.
#'
#' @details Set the option `options('BiocAddins.autocommit')` to `FALSE` to
#'   avoid automatic `DESCRIPTION` file commits.
#'
#' @inheritParams runBiocCheck
#'
#' @param commit `logical(1)` whether to automatically commit the changes to
#'   the `DESCRIPTION` file with `gert`. Defaults to `TRUE`.
#'
#' @examples
#'
#' if (interactive()) {
#'     versionBump()
#' }
#'
#' @importFrom desc desc
#' @export
versionBump <-
    function(pkgDir = ".", commit = getOption('BiocAddins.autocommit', TRUE))
{
    pkgPath <- devtools::as.package(pkgDir)[["path"]]
    desc <- desc::desc(file = file.path(pkgPath, "DESCRIPTION"))
    desc$bump_version("patch")
    desc$set("Date", Sys.Date())
    desc$write()
    if (commit) {
        gert::git_add(files = "DESCRIPTION")
        gert::git_commit(
            message = paste0("version bump ", as.character(desc$get_version()))
        )
    }
}

#' Add the Bioconductor upstream remote SSH location
#'
#' Note that this function will only be of use for packages that are already
#' in Bioconductor and have maintainer access.
#'
#' @inheritParams vignetteAsREADME
#'
#' @param ssh_loc character(1) The SSH address for Bioconductor repositories;
#'   by default `git@git.bioconductor.org`.
#'
#' @param remote character(1) The name of the remote to be added by default
#'   this should be `upstream`.
#'
#' @param slug character(1) The slug that immediately follows the SSH address
#'   this is `packages` for Bioconductor and the username for GitHub
#'   addresses
#'
#' @examples
#'
#' if (interactive()) {
#'    addSSHremote()
#' }
#'
#' @export
addSSHremote <- function(
    pkgDir = ".",
    remote = "upstream",
    ssh_loc = "git@git.bioconductor.org",
    slug = "packages"
) {
    pkg_name <- devtools::as.package(pkgDir)[["package"]]
    gert::git_remote_add(
        url = paste0(ssh_loc, ":", slug, "/", pkg_name),
        name = remote
    )
    message("Success.")
    gert::git_remote_list()
}

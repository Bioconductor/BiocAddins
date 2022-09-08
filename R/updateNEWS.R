.NEWS_LOCS <- c("inst/NEWS", "NEWS.md", "inst/NEWS.Rd", "NEWS", "inst/NEWS.md")

.findNEWSfile <- function(pkg) {
    dpkg <- devtools::as.package(pkg)
    npaths <- file.path(dpkg[["path"]], .NEWS_LOCS)
    newlo <- file.exists(npaths)
    if (sum(newlo) > 1)
        stop("Multiple NEWS files found in package folder")
    npaths[newlo]
}

#' Add the last commit messages since a 'version bump' to NEWS.md
#'
#' Take the last series of Git commit messages and append them to the NEWS.md
#' file for updating.
#'
#' @inheritParams vignetteAsREADME
#'
#' @param vpattern The set of keywords in the `NEWS.md` file header that denotes
#'   a section, e.g., `Changes in version` or the 'pkgname'.
#'
#' @param git_log_pattern The words that delimit the last version bump in the
#'   package; by default either `version bump` or `bump version`.
#'
#' @examples
#'
#' updateNEWS(pkgDir = ".", vpattern = "BiocAddins")
#'
#' @export
updateNEWS <- function(
    pkgDir = ".",
    vpattern = "Changes in version",
    git_log_pattern = "version bump|bump version"
) {
    pkg_name <- devtools::as.package(pkgDir)[["package"]]
    newsfeed::validate(pkgDir, pkg_name)
    newsfile <- newsfeed:::.findNEWSfile(pkgDir)
    newsext <- tools::file_ext(newsfile)
    if (!identical(newsext, "md"))
        stop("Currently, only 'NEWS.md' files are supported")
    newslines <- readLines(newsfile)
    firstheader <- grep("^\\s*#", newslines) + 1

    gitlog <- system2("git", args = "log --oneline", stdout = TRUE)
    commit_msgs <- vapply(
        strsplit(gitlog, "\\s"),
        function(x) paste(tail(x, -1), collapse = " "),
        character(1L)
    )
    last <- min(grep(git_log_pattern, commit_msgs, ignore.case = TRUE))
    all <- commit_msgs[seq_len(last - 1)]
    all <- paste("*", all)

    newnews <- unlist(append(newslines, all, firstheader))
    writeLines(newnews, con = newsfile)
}

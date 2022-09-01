#' Use the vignette as a README.md file
#'
#' Create an R Markdown file that takes the vignette and knits it as the
#' `README.md` file
#'
#' @inheritParams runBiocCheck
#'
#' @param vignette character(1) The filename of the vignette to be used as
#'   the `README.md` file
#'
#' @param dir character(1) The directory location within the package where to
#'   save the source vignette that will be converted to a `README.md`.
#'
#' @importFrom BiocBaseUtils isScalarCharacter
#'
#' @examples
#'
#' if (interactive()) {
#'     vignetteAsREADME()
#' }
#'
#' @export
vignetteAsREADME <- function(pkgDir = ".", vignette, dir = "inst/scripts") {
    pkgDir <- devtools::as.package(pkgDir)[["path"]]
    if (missing(vignette)) {
        vigs <- list.files(file.path(pkgDir, "vignettes"), full.names = TRUE)
        rmds <- tolower(tools::file_ext(vig)) == "rmd"
        vignette <- vigs[rmds]
    }
    if (!isScalarCharacter(vignette))
        stop("Provide a 'vignette' template input to use as the README.md")
    rmtemp <- system.file(
        "resources", "README_template.Rmd", package = "BiocAddins",
        mustWork = TRUE
    )
    temptext <- readLines(rmtemp)
    repline <- grep("vignettes/%s", fixed = TRUE, temptext)
    temptext[repline] <- sprintf(repline, basename(vignette))

    if (!dir.exists(dir))
        dir.create(dir, recursive = TRUE)

    newtemp <- file.path(dir, "README.Rmd")
    writeLines(text = temptext, con = newtemp)
}

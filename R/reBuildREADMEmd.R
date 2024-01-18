#' Rebuild the README.md from the README.Rmd file
#'
#' This function rebuilds the `README.md` file  by running the command in the
#' `README.Rmd` file.
#'
#' @inheritParams vignetteAsREADME
#'
#' @param readme `character(1)` The path to the `README.Rmd` to be rendered into
#'   the `README.md` file
#'
#' @examples
#'
#' if (interactive()) {
#'     reBuildREADMEmd()
#' }
#'
#' @export
reBuildREADMEmd <- function(pkgDir = ".", readme, dir = "inst/scripts") {
    pkgPath <- devtools::as.package(pkgDir)[["path"]]

    if (missing(readme))
        readme <- file.path(pkgPath, dir, "README.Rmd")

    if (!BiocBaseUtils::isScalarCharacter(readme))
        stop("The argument 'readme' must be a character(1).", call. = FALSE)

    if (!file.exists(readme))
        stop(
            "'", readme, "' does not exist; use 'Vignette to README.md'",
            call. = FALSE
        )

    rmarkdown::render(
        input = readme, output_dir = pkgPath
    )
}

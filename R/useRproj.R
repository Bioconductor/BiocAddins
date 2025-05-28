#' Add an .Rproj file based on a template
#'
#' This function creates an `<pkgName>.Rproj` file with standard options.
#'
#' @inheritParams addSSHremote
#' @inheritParams base::files
#'
#' @importFrom rstudioapi openProject
#'
#' @examples
#'
#' if (interactive()) {
#' }
#' useRproj()
#'
#' @export
useRproj <- function(pkgDir = ".", overwrite = FALSE) {
    pkg_name <- devtools::as.package(pkgDir)[["package"]]
    template <- system.file(
        "resources", "template.Rproj", package = "BiocAddins", mustWork = TRUE
    )
    rproj_file <- file.path(pkgDir, paste0(pkg_name, ".Rproj"))
    if (!file.exists(rproj_file))
        file.copy(
            from = template,
            to = rproj_file,
            overwrite = overwrite
        )
    rstudioapi::openProject(path = rproj_file)
}

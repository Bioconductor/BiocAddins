#' Add an .Rproj file based on a template
#'
#' This function creates an `<pkgName>.Rproj` file with standard options.
#'
#' @inheritParams addSSHremote
#' @inheritParams base::files
#'
#' @examples
#'
#' if (interactive()) {
#'    use_Rproj()
#' }
#'
#' @export
use_Rproj <- function(pkgDir = ".", overwrite = FALSE) {
    pkg_name <- devtools::as.package(pkgDir)[["package"]]
    template <- system.file(
        "resources", "template.Rproj", package = "BiocAddins", mustWork = TRUE
    )
    file.copy(
        from = template,
        to = file.path(pkgDir, paste0(pkg_name, ".Rproj")),
        overwrite = overwrite
    )
}

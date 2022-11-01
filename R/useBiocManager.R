#' BiocManager: The Bioconductor Package Manager
#'
#' Make Bioconductor packages available via `BiocManager`, ensuring
#' proper versioning with the current R installation.
#'
#' @examples
#'
#' useBiocManager()
#'
#' @import BiocManager
#'
#' @export
useBiocManager <- function() {
    if (!requireNamespace("BiocManager", quietly = TRUE))
        utils::install.packages("BiocManager")
    require("BiocManager")
}

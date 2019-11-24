#' Install BiocManager, the Bioconductor package manager
#'
#' Make Bioconductor packages available via BiocManager
#'
#' @examples
#'
#' installBiocManager()
#'
#' @export
installBiocManager <- function() {
    if (!requireNamespace("BiocManager", quietly = TRUE))
        utils::install.packages("BiocManager")
    else
        BiocManager:::.onAttach()
}

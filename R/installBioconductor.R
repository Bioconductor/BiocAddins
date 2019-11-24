#' Install Bioconductor
#'
#' Make Bioconductor packages available via BiocManager
#'
#' @examples
#'
#' installBioconductor()
#'
#' @export
installBioconductor <- function() {
    if (!requireNamespace("BiocManager", quietly = TRUE))
        utils::install.packages("BiocManager")
    else
        BiocManager:::.onAttach()
}

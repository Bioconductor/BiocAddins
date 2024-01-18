
# Installation

``` r
BiocManager::install("Bioconductor/BiocAddins")
```

# Utility functions

## Installing BiocManager

Bioconductor uses BiocManager to distribute packages and manage
Bioconductor versions. It is important for users to make use of
BiocManager instead of `install.packages` in order to ensure proper
package versioning.

The RStudio Addin makes it easy for users to obtain and install
`BiocManager` from CRAN.

``` r
useBiocManager()
```

After installation of `BiocManager`, users may install a package via the
`install` function:

``` r
BiocManager::install("Biobase")
```

# Developer section

## Run BiocCheck

Developers can run BiocCheck quite easily with the RStudio Addin from
the dropdown menu. It essentially runs:

``` r
BiocCheck::BiocCheck()
```

We recommend using the following keyboard shortcut:

<kbd> Ctrl </kbd> / <kbd> ⌘ </kbd> (Mac) + <kbd> shift </kbd> + <kbd> C
</kbd>

## Version Bumps

BiocAddins makes it easy to bump your package’s version by running the
`bumpVersion` function:

``` r
bumpVersion()
```

Note that this will increase the `Z` version of the package by 1, a.k.a,
the patch version.

## Installing devel

Developers who wish to install the development version of Bioconductor
can do so *after* installing `BiocManager`:

``` r
BiocManager::install(version = "devel")
```

Developers must ensure that the correct version of R is being used. For
more information, please review the `BiocManager` package vignette.

## Session Info

``` r
sessionInfo()
#> R Under development (unstable) (2023-11-17 r85547)
#> Platform: x86_64-pc-linux-gnu
#> Running under: Ubuntu 22.04.3 LTS
#> 
#> Matrix products: default
#> BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.10.0 
#> LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.10.0
#> 
#> locale:
#>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C               LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8     LC_MONETARY=en_US.UTF-8   
#>  [6] LC_MESSAGES=en_US.UTF-8    LC_PAPER=en_US.UTF-8       LC_NAME=C                  LC_ADDRESS=C               LC_TELEPHONE=C            
#> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
#> 
#> time zone: America/New_York
#> tzcode source: system (glibc)
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] colorout_1.2-2
#> 
#> loaded via a namespace (and not attached):
#>  [1] miniUI_0.1.1.1      compiler_4.4.0      BiocManager_1.30.22 BiocBaseUtils_1.5.0 promises_1.2.1      Rcpp_1.0.11         stringr_1.5.1      
#>  [8] later_1.3.2         yaml_2.3.8          fastmap_1.1.1       mime_0.12           R6_2.5.1            BiocAddins_0.99.19  knitr_1.45         
#> [15] htmlwidgets_1.6.4   tibble_3.2.1        desc_1.4.3          profvis_0.3.8       shiny_1.8.0         pillar_1.9.0        rlang_1.1.2        
#> [22] utf8_1.2.4          cachem_1.0.8        stringi_1.8.3       xfun_0.41           httpuv_1.6.13       fs_1.6.3            pkgload_1.3.3      
#> [29] memoise_2.0.1       cli_3.6.2           magrittr_2.0.3      digest_0.6.33       rstudioapi_0.15.0   xtable_1.8-4        remotes_2.4.2.1    
#> [36] devtools_2.4.5      lifecycle_1.0.4     vctrs_0.6.5         evaluate_0.23       glue_1.6.2          urlchecker_1.0.1    codetools_0.2-19   
#> [43] sessioninfo_1.2.2   pkgbuild_1.4.3      fansi_1.0.6         rmarkdown_2.25      purrr_1.0.2         pkgconfig_2.0.3     tools_4.4.0        
#> [50] usethis_2.2.2       ellipsis_0.3.2      htmltools_0.5.7
```

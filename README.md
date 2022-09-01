
# Installation

``` r
BiocManager::install("Bioconductor/BiocAddins")
```

# Utility functions

## Installing BiocManager

Bioconductor uses BiocManager to distribute pacakges and manage
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
#> R version 4.2.1 (2022-06-23)
#> Platform: x86_64-pc-linux-gnu (64-bit)
#> Running under: Ubuntu 20.04.4 LTS
#> 
#> Matrix products: default
#> BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
#> LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/liblapack.so.3
#> 
#> locale:
#>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
#>  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
#>  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
#>  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
#>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
#> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> loaded via a namespace (and not attached):
#>  [1] compiler_4.2.1   magrittr_2.0.3   fastmap_1.1.0    cli_3.3.0       
#>  [5] tools_4.2.1      htmltools_0.5.3  rstudioapi_0.14  yaml_2.3.5      
#>  [9] codetools_0.2-18 stringi_1.7.8    rmarkdown_2.16   knitr_1.40      
#> [13] stringr_1.4.1    xfun_0.32        digest_0.6.29    rlang_1.0.4     
#> [17] evaluate_0.16
```

```{r include=FALSE}
PubMedString <- "PubMed: https://www.ncbi.nlm.nih.gov/pubmed/?term="

doiString <- "doi: https://doi.org/"

dimensionString1 <- "<script async='' charset='utf-8' src='https://badge.dimensions.ai/badge.js'></script> <span class='__dimensions_badge_embed__' data-doi='"

dimensionString2 <- "' data-style='small_circle' data-hide-zero-citations='true'></span>"

altmetricString1 <-"<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script> <span class='altmetric-embed' data-badge-popover='right' data-badge-type='donut' data-doi='"

altmetricString2 <- "' data-hide-no-mentions='true'></span>"
```









```{r include=FALSE}
PMID_29996669 <- RefManageR::ReadPubMed("29996669",
                                        database = "PubMed")

citation_29996669 <- paste0(PMID_29996669$journal,
                            " ",
                            PMID_29996669$year,
                            " ",
                            PMID_29996669$month,
                            ";",
                            PMID_29996669$volume,
                            "(",
                            PMID_29996669$number,
                            "):",
                            PMID_29996669$pages)

PubMed_29996669 <- paste0(PubMedString,
                          PMID_29996669$eprint
)

doi_29996669 <- paste0(doiString,
                       PMID_29996669$doi
)

dimensionBadge_29996669 <- paste0(dimensionString1,
                                  PMID_29996669$doi,
                                  dimensionString2
)

altmetricBadge_29996669 <- paste0(altmetricString1,
                                  PMID_29996669$doi,
                                  altmetricString2
)
```



- **`r PMID_29996669$title`**

*`r citation_29996669`*

`r PMID_29996669$abstract`

`r PubMed_29996669`

`r doi_29996669`

`r dimensionBadge_29996669`

`r altmetricBadge_29996669`


```{r include=FALSE}
PubMedString <- "PubMed: https://www.ncbi.nlm.nih.gov/pubmed/?term="

doiString <- "doi: https://doi.org/"

dimensionString1 <- "<script async='' charset='utf-8' src='https://badge.dimensions.ai/badge.js'></script> <span class='__dimensions_badge_embed__' data-doi='"

dimensionString2 <- "' data-style='small_circle' data-hide-zero-citations='true'></span>"

altmetricString1 <-"<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script> <span class='altmetric-embed' data-badge-popover='right' data-badge-type='donut' data-doi='"

altmetricString2 <- "' data-hide-no-mentions='true'></span>"
```









```{r include=FALSE}
PMID_30018304 <- RefManageR::ReadPubMed("30018304",
                                        database = "PubMed")

citation_30018304 <- paste0(PMID_30018304$journal,
                            " ",
                            PMID_30018304$year,
                            " ",
                            PMID_30018304$month,
                            ";",
                            PMID_30018304$volume,
                            "(",
                            PMID_30018304$number,
                            "):",
                            PMID_30018304$pages)

PubMed_30018304 <- paste0(PubMedString,
                          PMID_30018304$eprint
)

doi_30018304 <- paste0(doiString,
                       PMID_30018304$doi
)

dimensionBadge_30018304 <- paste0(dimensionString1,
                                  PMID_30018304$doi,
                                  dimensionString2
)

altmetricBadge_30018304 <- paste0(altmetricString1,
                                  PMID_30018304$doi,
                                  altmetricString2
)
```





*`r citation_30018304`*

`r PMID_30018304$abstract`

`r PubMed_30018304`

`r doi_30018304`

`r dimensionBadge_30018304`

`r altmetricBadge_30018304`


```{r include=FALSE}
PubMedString <- "PubMed: https://www.ncbi.nlm.nih.gov/pubmed/?term="

doiString <- "doi: https://doi.org/"

dimensionString1 <- "<script async='' charset='utf-8' src='https://badge.dimensions.ai/badge.js'></script> <span class='__dimensions_badge_embed__' data-doi='"

dimensionString2 <- "' data-style='small_circle' data-hide-zero-citations='true'></span>"

altmetricString1 <-"<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script> <span class='altmetric-embed' data-badge-popover='right' data-badge-type='donut' data-doi='"

altmetricString2 <- "' data-hide-no-mentions='true'></span>"
```


```{r include=FALSE}
PMID_30010625 <- RefManageR::ReadPubMed("30010625",
                                        database = "PubMed")

PubMed_30010625 <- paste0(PubMedString,
                          PMID_30010625$eprint
)

doi_30010625 <- paste0(doiString,
                       PMID_30010625$doi
)

dimensionBadge_30010625 <- paste0(dimensionString1,
                                  PMID_30010625$doi,
                                  dimensionString2
)

altmetricBadge_30010625 <- paste0(altmetricString1,
                                  PMID_30010625$doi,
                                  altmetricString2
)
```

`r PMID_30010625$abstract`

`r PubMed_30010625`

`r doi_30010625`

`r dimensionBadge_30010625`

`r altmetricBadge_30010625`


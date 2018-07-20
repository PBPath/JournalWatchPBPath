```{r include=FALSE}
PubMedString <- "PubMed: https://www.ncbi.nlm.nih.gov/pubmed/?term="

doiString <- "doi: https://doi.org/"

dimensionString1 <- "<script async='' charset='utf-8' src='https://badge.dimensions.ai/badge.js'></script> <span class='__dimensions_badge_embed__' data-doi='"

dimensionString2 <- "' data-style='small_circle' data-hide-zero-citations='true'></span>"

altmetricString1 <-"<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script> <span class='altmetric-embed' data-badge-popover='right' data-badge-type='donut' data-doi='"

altmetricString2 <- "' data-hide-no-mentions='true'></span>"
```


```{r include=FALSE}
PMID_30014466 <- RefManageR::ReadPubMed("30014466",
                                        database = "PubMed")

citation_30014466 <- paste0(PMID_30014466$journal,
                            " ",
                            PMID_30014466$year,
                            " ",
                            PMID_30014466$month,
                            ";",
                            PMID_30014466$volume,
                            "(",
                            PMID_30014466$number,
                            "):",
                            PMID_30014466$pages)

PubMed_30014466 <- paste0(PubMedString,
                          PMID_30014466$eprint
)

doi_30014466 <- paste0(doiString,
                       PMID_30014466$doi
)

dimensionBadge_30014466 <- paste0(dimensionString1,
                                  PMID_30014466$doi,
                                  dimensionString2
)

altmetricBadge_30014466 <- paste0(altmetricString1,
                                  PMID_30014466$doi,
                                  altmetricString2
)
```

*`r citation_30014466`*

`r PMID_30014466$abstract`

`r PubMed_30014466`

`r doi_30014466`

`r dimensionBadge_30014466`

`r altmetricBadge_30014466`


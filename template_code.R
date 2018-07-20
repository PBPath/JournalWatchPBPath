```{r include=FALSE}
PubMedString <- "PubMed: https://www.ncbi.nlm.nih.gov/pubmed/?term="

doiString <- "doi: https://doi.org/"

dimensionString1 <- "<script async='' charset='utf-8' src='https://badge.dimensions.ai/badge.js'></script> <span class='__dimensions_badge_embed__' data-doi='"

dimensionString2 <- "' data-style='small_circle' data-hide-zero-citations='true'></span>"

altmetricString1 <-"<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script> <span class='altmetric-embed' data-badge-popover='right' data-badge-type='donut' data-doi='"

altmetricString2 <- "' data-hide-no-mentions='true'></span>"
```


```{r include=FALSE}
PMID_28240168 <- RefManageR::ReadPubMed("28240168",
                                        database = "PubMed")

citation_28240168 <- paste0(PMID_28240168$journal,
                            " ",
                            PMID_28240168$year,
                            " ",
                            PMID_28240168$month,
                            ";",
                            PMID_28240168$volume,
                            "(",
                            PMID_28240168$number,
                            "):",
                            PMID_28240168$pages)

PubMed_28240168 <- paste0(PubMedString,
                          PMID_28240168$eprint
)

doi_28240168 <- paste0(doiString,
                       PMID_28240168$doi
)

dimensionBadge_28240168 <- paste0(dimensionString1,
                                  PMID_28240168$doi,
                                  dimensionString2
)

altmetricBadge_28240168 <- paste0(altmetricString1,
                                  PMID_28240168$doi,
                                  altmetricString2
)
```

*`r citation_28240168`*

`r PMID_28240168$abstract`

`r PubMed_28240168`

`r doi_28240168`

`r dimensionBadge_28240168`

`r altmetricBadge_28240168`


```{r include=FALSE}
PubMedString <- "PubMed: https://www.ncbi.nlm.nih.gov/pubmed/?term="

doiString <- "doi: https://doi.org/"

dimensionString1 <- "<script async='' charset='utf-8' src='https://badge.dimensions.ai/badge.js'></script> <span class='__dimensions_badge_embed__' data-doi='"

dimensionString2 <- "' data-style='small_circle' data-hide-zero-citations='true'></span>"

altmetricString1 <-"<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script> <span class='altmetric-embed' data-badge-popover='right' data-badge-type='donut' data-doi='"

altmetricString2 <- "' data-hide-no-mentions='true'></span>"
```


```{r include=FALSE}
PMID_29684363 <- RefManageR::ReadPubMed("29684363",
                                        database = "PubMed")

PubMed_29684363 <- paste0(PubMedString,
                          PMID_29684363$eprint
)

doi_29684363 <- paste0(doiString,
                       PMID_29684363$doi
)

dimensionBadge_29684363 <- paste0(dimensionString1,
                                  PMID_29684363$doi,
                                  dimensionString2
)

altmetricBadge_29684363 <- paste0(altmetricString1,
                                  PMID_29684363$doi,
                                  altmetricString2
)
```

- Immunolabeling of Cleared Human Pancreata Provides Insights into Three-Dimensional Pancreatic Anatomy and Pathology.

`r PubMed_29684363`

`r doi_29684363`

`r dimensionBadge_29684363`

`r altmetricBadge_29684363`


PMID_25783680 <- RefManageR::ReadPubMed("25783680", database = "PubMed")

cit_25783680 <- paste0(PMID_25783680$title, " ", PMID_25783680$journal, " ", "PMID: https://www.ncbi.nlm.nih.gov/pubmed/?term=", PMID_25783680$eprint, " ", "doi: https://doi.org/", PMID_25783680$doi)

dimensionBadge <- paste0(
    "<script async='' charset='utf-8' src='https://badge.dimensions.ai/badge.js'></script>
    <span class='__dimensions_badge_embed__' data-doi='",
    PMID_25783680$doi,
    "' data-style='small_circle'></span>"
)


altmetricBadge <- paste0(
    "<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script>
<span class='altmetric-embed' data-badge-popover='right' data-badge-type='donut' data-doi='",
    PMID_25783680$doi,
    "'></span>"
)
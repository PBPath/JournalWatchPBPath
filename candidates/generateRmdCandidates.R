# generate Rmd files from PMID Lists ----

pancreas_recent_PMID         <-
    readr::read_csv("~/JournalWatchPBPath/candidates/newPMID_pancreas.csv",
                    col_names = FALSE,
                    cols(
                        X1 = col_character()
                    )) %>%
    pull("X1")

PMIDList <- pancreas_recent_PMID$PMID

magicfor::magic_for()

for (i in 1:length(PMIDList)) {
    y <- paste0("

---

```{r pancreas ", PMIDList[i] ,", include=FALSE}

articles <- readRDS('~/JournalWatchPBPath/articles.rds')


PMID_", PMIDList[i] ," <- RefManageR::ReadPubMed('", PMIDList[i] ,"', database = 'PubMed')

citation_", PMIDList[i] ," <- paste0(PMID_", PMIDList[i] ,"$journal,' ', PMID_", PMIDList[i] ,"$year, ' ', PMID_", PMIDList[i] ,"$month,';', PMID_", PMIDList[i] ,"$volume,'(', PMID_", PMIDList[i] ,"$number,'):', PMID_", PMIDList[i] ,"$pages)

PubMed_", PMIDList[i] ," <- paste0(PubMedString, PMID_", PMIDList[i] ,"$eprint)

doi_", PMIDList[i] ," <- paste0(doiString, PMID_", PMIDList[i] ,"$doi)

dimensionBadge_", PMIDList[i] ," <- paste0(dimensionString1, PMID_", PMIDList[i] ,"$doi,dimensionString2)

altmetricBadge_", PMIDList[i] ," <- paste0(altmetricString1, PMID_", PMIDList[i] ,"$doi, altmetricString2 )

addthis_inline_", PMIDList[i] ," <- paste0(addthis_String1, PMID_", PMIDList[i] ,"$title , \" PMID: ", PMIDList[i] , "\" , addthis_String2)

Sys.sleep(1)


articles <- articles %>%

add_row(

ArticleCitation = PMID_", PMIDList[i] ,",
PMID = PMID_", PMIDList[i] ,"$eprint,
Title = PMID_", PMIDList[i] ,"$title,
# Author = PMID_", PMIDList[i] ,"$author,
# Abstract = PMID_", PMIDList[i] ,"$abstract,
Journal = PMID_", PMIDList[i] ,"$journal,
Year = PMID_", PMIDList[i] ,"$year,
Month = PMID_", PMIDList[i] ,"$month,
# Volume = PMID_", PMIDList[i] ,"$volume,
# Number = PMID_", PMIDList[i] ,"$number,
# Pages = PMID_", PMIDList[i] ,"$pages,
PubMedLink = paste0('https://www.ncbi.nlm.nih.gov/pubmed/?term=', PMID_", PMIDList[i] ,"$eprint),
DoiNumber = PMID_", PMIDList[i] ,"$doi,
DoiLink = paste0('https://doi.org/', PMID_", PMIDList[i] ,"$doi),
Language = PMID_", PMIDList[i] ,"$language,
ISSN = PMID_", PMIDList[i] ,"$issn
) %>%

unique()


Sys.sleep(1)

saveRDS(articles, '~/JournalWatchPBPath/articles.rds')

```

<details open> <summary>
- **`r PMID_", PMIDList[i] ,"$title`**
</summary> 

*`r citation_", PMIDList[i] ,"`*

`r PubMed_", PMIDList[i] ,"`

<!-- `r addthis_inline_", PMIDList[i] ,"` -->

`r PMID_", PMIDList[i] ,"$abstract`

`r doi_", PMIDList[i] ,"`

<!-- `r dimensionBadge_", PMIDList[i] ,"` -->

<!-- `r altmetricBadge_", PMIDList[i] ,"` -->

</details>

---"
                
                , "\n", "\n")
    
    put(y)
    
}

writeLines(magicfor::magic_result_as_vector(), "~/JournalWatchPBPath/_pancreasRecent.Rmd")

magicfor::magic_free()

esearch -db pubmed -query "Adsay[Author]" | \
efetch  -format xml | \
xtract -pattern PubmedArticle -element MedlineCitation/PMID \
-block ArticleId -if ArticleId@IdType -equals doi -element ArticleId




esearch -db pubmed -query 'pancreas[Title/Abstract]) AND pathology' -datetype EDAT -min 2018/05/01 -max 3000 | \
efetch -format xml | \
xtract -pattern PubmedArticle -element MedlineCitation/PMID \
-block ArticleId -if ArticleId@IdType -equals doi -element ArticleId &> myquery.txt
library(shiny)
library(RefManageR)

ui <- fluidPage(
    textInput("PMID", ""),
    tags$br(),
    # textOutput("ArticleCitation"),
    # tags$br(),
    p("---"),
    textOutput("CodeStart"),
    tags$br(),
    textOutput("PubMedSearch"),
    tags$br(),
    textOutput("citation"),
    tags$br(),
    textOutput("PUBMED"),
    tags$br(),
    textOutput("doi"),
    tags$br(),
    textOutput("dimensions"),
    tags$br(),
    textOutput("altmetric"),
    tags$br(),
    textOutput("addthis1"),
    tags$br(),
    p("Sys.sleep(1)"),
    tags$br(),
    textOutput("CodeEnd"),
    tags$br(),
    ("<details open>"),
    ("<summary>"),
    textOutput("title"),
    ("</summary>"),
    tags$br(),
    tags$br(),
    textOutput("cit"),
    tags$br(),
    textOutput("PubMedLink"),
    tags$br(),
    textOutput("addthis2"),
    tags$br(),
    textOutput("abstract"),
    tags$br(),
    textOutput("doiLink"),
    tags$br(),
    textOutput("dim"),
    tags$br(),
    textOutput("alt"),
    tags$br(),
    p("</details>"),
    p("---")
)

server <-
    function(input, output) {
        
        
        
        
        output$ArticleCitation <- renderText(
            {
                Article <- RefManageR::ReadPubMed(trimws(input$PMID), database = 'PubMed')
                paste(Article$title, Article$abstract, sep = "\n") 
            }
        )
        
        
        # output$ArticleAbstract <- renderText(
        #     {
        #         Article$abstract
        #     }
        # )
        # 
        
        output$CodeStart <-
            renderText({
                paste0("```{r ",
                       trimws(input$PMID),
                       ", include=FALSE}")
            })
        
        output$PubMedSearch <- renderText({
            paste0(
                "PMID_",
                trimws(input$PMID),
                " <- RefManageR::ReadPubMed('",
                trimws(input$PMID),
                "', database = 'PubMed')"
            )
            
        })
        
        output$citation <- renderText({
            paste0(
                "citation_",
                trimws(input$PMID),
                " <- paste0(PMID_",
                trimws(input$PMID),
                "$journal,' ', PMID_",
                trimws(input$PMID) ,
                "$year, ' ', PMID_",
                trimws(input$PMID) ,
                "$month,';', PMID_",
                trimws(input$PMID),
                "$volume,'(', PMID_",
                trimws(input$PMID),
                "$number,'):', PMID_",
                trimws(input$PMID),
                "$pages)"
            )
            
            
        })
        
        output$PUBMED <- renderText({
            paste0(
                "PubMed_",
                trimws(input$PMID),
                " <- paste0(PubMedString, PMID_",
                trimws(input$PMID),
                "$eprint)")
            
        })
        
        output$doi <- renderText({
            paste0("doi_",
                   trimws(input$PMID),
                   " <- paste0(doiString, PMID_",
                   trimws(input$PMID),
                   "$doi)")
            
        })
        
        
        output$dimensions <- renderText({
            paste0(
                "dimensionBadge_",
                trimws(input$PMID),
                " <- paste0(dimensionString1, PMID_",
                trimws(input$PMID),
                "$doi,dimensionString2)"
            )
            
            
        })
        
        
        output$altmetric <- renderText({
            paste0(
                "altmetricBadge_",
                trimws(input$PMID),
                " <- paste0(altmetricString1, PMID_",
                trimws(input$PMID),
                "$doi, altmetricString2 )"
            )
            
        })
        
        
        output$addthis1 <- renderText({
            paste0("addthis_inline_",
                   trimws(input$PMID),
                   " <- paste0(addthis_String1, PMID_",
                   trimws(input$PMID),
                   "$title",
                   " , \" PMID: ",
                   trimws(input$PMID),
                   " \" , addthis_String2)"
            )
        })
        
        output$CodeEnd <- renderText({
            paste0("```")
            
        })
        
        
        output$title <- renderText({
            paste0("- **`r PMID_",
                   trimws(input$PMID),
                   "$title`**")
            
        })
        
        
        output$cit <- renderText({
            paste0("*`r citation_",
                   trimws(input$PMID),
                   "`*")
            
        })
        
        output$addthis2 <- renderText({
            paste0("`r addthis_inline_",
                   trimws(input$PMID),
                   "`")
        })
        
        output$abstract <- renderText({
            paste0("`r PMID_",
                   trimws(input$PMID),
                   "$abstract`")
            
        })
        
        
        output$PubMedLink <- renderText({
            paste0("`r PubMed_",
                   trimws(input$PMID),
                   "`")
        })
        
        
        output$doiLink <- renderText({
            paste0("<!-- `r doi_",
                   trimws(input$PMID),
                   "` -->")
        })
        
        
        output$dim <- renderText({
            paste0("`r dimensionBadge_",
                   trimws(input$PMID),
                   "`")
        })
        
        
        output$alt <- renderText({
            paste0("`r altmetricBadge_",
                   trimws(input$PMID),
                   "`")
        })
        
        
        

    }

shinyApp(ui = ui, server = server)

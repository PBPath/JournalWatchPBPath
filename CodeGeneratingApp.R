ui <- fluidPage(
    textInput("PMID", ""),
    tags$br(),
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
    textOutput("CodeEnd"),
    tags$br(),
    p("<details open>"),
    tags$br(),
    p("<summary>"),
    tags$br(),
    textOutput("title"),
    tags$br(),
    p("</summary>"),
    tags$br(),
    textOutput("cit"),
    tags$br(),
    textOutput("abstract"),
    tags$br(),
    textOutput("PubMedLink"),
    tags$br(),
    textOutput("doiLink"),
    tags$br(),
    textOutput("dim"),
    tags$br(),
    textOutput("alt"),
    tags$br(),
    p("</details>"),
    tags$br()
)

server <-
    function(input, output) {
        
        
        
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

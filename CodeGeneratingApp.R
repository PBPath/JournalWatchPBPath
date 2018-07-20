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
    textOutput("title"),
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
    tags$br()
)

server <-
    function(input, output) {
        output$CodeStart <-
            renderText({
                paste0("```{r include=FALSE}")
            })
        
        output$PubMedSearch <- renderText({
            paste0(
                "PMID_",
                input$PMID,
                " <- RefManageR::ReadPubMed('",
                input$PMID,
                "', database = 'PubMed')"
            )
            
        })
        
        output$citation <- renderText({
            paste0(
                "citation_",
                input$PMID,
                " <- paste0(PMID_",
                input$PMID,
                "$journal,' ', PMID_",
                input$PMID ,
                "$year, ' ', PMID_",
                input$PMID ,
                "$month,';', PMID_",
                input$PMID,
                "$volume,'(', PMID_",
                input$PMID,
                "$number,'):', PMID_",
                input$PMID,
                "$pages)"
            )
            
            
        })
        
        output$PUBMED <- renderText({
            paste0(
                "PubMed_",
                input$PMID,
                " <- paste0(PubMedString, PMID_",
                input$PMID,
                "$eprint)")
            
        })
        
        output$doi <- renderText({
            paste0("doi_",
                   input$PMID,
                   " <- paste0(doiString, PMID_",
                   input$PMID,
                   "$doi)")
            
        })
        
        
        output$dimensions <- renderText({
            paste0(
                "dimensionBadge_",
                input$PMID,
                " <- paste0(dimensionString1, PMID_",
                input$PMID,
                "$doi,dimensionString2)"
            )
            
            
        })
        
        
        output$altmetric <- renderText({
            paste0(
                "altmetricBadge_",
                input$PMID,
                " <- paste0(altmetricString1, PMID_",
                input$PMID,
                "$doi, altmetricString2 )"
            )
            
        })
        
        
        output$CodeEnd <- renderText({
            paste0("```")
            
        })
        
        
        output$title <- renderText({
            paste0("- **`r PMID_",
                   input$PMID,
                   "$title`**")
            
        })
        
        
        output$cit <- renderText({
            paste0("*`r citation_",
                   input$PMID,
                   "`*")
            
        })
        
        
        output$abstract <- renderText({
            paste0("`r PMID_",
                   input$PMID,
                   "$abstract`")
            
        })
        
        
        output$PubMedLink <- renderText({
            paste0("`r PubMed_",
                   input$PMID,
                   "`")
        })
        
        
        output$doiLink <- renderText({
            paste0(" `r doi_",
                   input$PMID,
                   "`")
        })
        
        
        output$dim <- renderText({
            paste0("`r dimensionBadge_",
                   input$PMID,
                   "`")
        })
        
        
        output$alt <- renderText({
            paste0("`r altmetricBadge_",
                   input$PMID,
                   "`")
        })
    }

shinyApp(ui = ui, server = server)

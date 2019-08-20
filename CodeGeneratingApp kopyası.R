library(shiny)
library(DT)
library(tidyverse)
library(here)
library(RefManageR)

shinyApp(
  ui <-
    fluidPage(
      tags$style(
        HTML(
          ".error {
                    background-color: red;
                    color: white;
                    }
                    .success {
                    background-color: green;
                    color: white;
                    }"
        )
      ),

      textInput(inputId = "PMID", label = "PubMed ID"),





      p("---"),
      textOutput("CodeStart"),
      tags$br(),
      p("articles <- readRDS('articles.rds')"),
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
      p("articles <- articles %>%"),
      p("add_row("),
      textOutput("addrow1"),
      textOutput("addrow2"),
      textOutput("addrow3"),
      textOutput("addrow4"),
      textOutput("addrow5"),
      textOutput("addrow6"),
      textOutput("addrow7"),
      textOutput("addrow8"),
      textOutput("addrow9"),
      textOutput("addrow10"),
      textOutput("addrow11"),
      textOutput("addrow12"),
      textOutput("addrow13"),
      textOutput("addrow14"),
      textOutput("addrow15"),
      textOutput("addrow16"),
      p(") %>%"),
      p("unique()"),
      tags$br(),
      p("Sys.sleep(1)"),
      textOutput("saverds"),
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
      p("---"),









      # style modals

      h2("Article Properties"),
      DT::dataTableOutput("checkbox_table"),
      br(),
      actionButton(inputId = "submit", label = "Submit Form")
    ),



  # server




  server <- function(input, output, session) {
    # generate code


    # output$ArticleCitation <- renderText({
    #   Article <-
    #     RefManageR::ReadPubMed(trimws(input$PMID), database = "PubMed")
    #   paste(Article$title, Article$abstract, sep = "\n")
    # })


    # output$ArticleAbstract <- renderText(
    #     {
    #         Article$abstract
    #     }
    # )
    #

    output$CodeStart <-
      renderText({
        paste0(
          "```{r ",
          trimws(input$PMID),
          ", include=FALSE}"
        )
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
        trimws(input$PMID),
        "$year, ' ', PMID_",
        trimws(input$PMID),
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
        "$eprint)"
      )
    })

    output$doi <- renderText({
      paste0(
        "doi_",
        trimws(input$PMID),
        " <- paste0(doiString, PMID_",
        trimws(input$PMID),
        "$doi)"
      )
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
      paste0(
        "addthis_inline_",
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
      paste0(
        "- **`r PMID_",
        trimws(input$PMID),
        "$title`**"
      )
    })


    output$cit <- renderText({
      paste0(
        "*`r citation_",
        trimws(input$PMID),
        "`*"
      )
    })

    output$addthis2 <- renderText({
      paste0(
        "`r addthis_inline_",
        trimws(input$PMID),
        "`"
      )
    })

    output$abstract <- renderText({
      paste0(
        "`r PMID_",
        trimws(input$PMID),
        "$abstract`"
      )
    })


    output$PubMedLink <- renderText({
      paste0(
        "`r PubMed_",
        trimws(input$PMID),
        "`"
      )
    })


    output$doiLink <- renderText({
      paste0(
        "<!-- `r doi_",
        trimws(input$PMID),
        "` -->"
      )
    })


    output$dim <- renderText({
      paste0(
        "`r dimensionBadge_",
        trimws(input$PMID),
        "`"
      )
    })


    output$alt <- renderText({
      paste0(
        "`r altmetricBadge_",
        trimws(input$PMID),
        "`"
      )
    })
    
    
    # output$scite <- renderText({
    #   paste0(
    #     "https://scite.ai/reports/",
    #     trimws(input$PMID),
    #     "`"
    #   )
    # })    
    # 
    # https://scite.ai/reports/10.1111/CYT.12021?page=1


    output$addrow1 <- renderText({
      paste0("ArticleCitation = PMID_", trimws(input$PMID), ",")
    })

    output$addrow2 <- renderText({
      paste0("PMID = PMID_", trimws(input$PMID), "$eprint,")
    })

    output$addrow3 <- renderText({
      paste0("Title = PMID_", trimws(input$PMID), "$title,")
    })

    output$addrow4 <- renderText({
      paste0("# Author = PMID_", trimws(input$PMID), "$author,")
    })
    output$addrow5 <- renderText({
      paste0("Abstract = PMID_", trimws(input$PMID), "$abstract,")
    })
    output$addrow6 <- renderText({
      paste0("Journal = PMID_", trimws(input$PMID), "$journal,")
    })

    output$addrow7 <- renderText({
      paste0("Year = PMID_", trimws(input$PMID), "$year,")
    })



    output$addrow8 <- renderText({
      paste0("Month = PMID_", trimws(input$PMID), "$month,")
    })


    output$addrow9 <- renderText({
      paste0("# Volume = PMID_", trimws(input$PMID), "$volume,")
    })

    output$addrow10 <- renderText({
      paste0("# Number = PMID_", trimws(input$PMID), "$number,")
    })


    output$addrow11 <- renderText({
      paste0("# Pages = PMID_", trimws(input$PMID), "$pages,")
    })

    output$addrow12 <- renderText({
      paste0(
        "PubMedLink = paste0('https://www.ncbi.nlm.nih.gov/pubmed/?term=', PMID_",
        trimws(input$PMID),
        "$eprint),"
      )
    })

    output$addrow13 <- renderText({
      paste0("DoiNumber = PMID_", trimws(input$PMID), "$doi,")
    })

    output$addrow14 <- renderText({
      paste0(
        "DoiLink = paste0('https://doi.org/', PMID_",
        trimws(input$PMID),
        "$doi),"
      )
    })

    output$addrow15 <- renderText({
      paste0("Language = PMID_", trimws(input$PMID), "$language,")
    })


    output$addrow16 <- renderText({
      paste0("ISSN = PMID_", trimws(input$PMID), "$issn")
    })



    output$saverds <- renderText({
      paste0("saveRDS(articles, 'articles.rds')")
    })






    # taken from https://stackoverflow.com/questions/49352886/shiny-r-how-to-save-list-of-checkbox-inputs-from-datatable
    # create vector of activities
    answer_options <- c(
      "Pancreas",
      "Ampulla",
      "BileDuct",
      "Gallbladder",
      "Neuroendocrine",
      "Morphology",
      "IHC",
      "Molecular",
      "Cytology",
      "Staging",
      "Preneoplastic",
      "Microenvironment",
      "SPN",
      "AnalogueTumors",
      "Pancreattis",
      "Benign",
      "ExperimentalAnimal",
      "TechniquesMethods",
      "Epidemiology",
      "Screening",
      "RiskFactors",
      "SEER",
      "Oncomine",
      "TCGA",
      "CaseReport",
      "CaseSeries",
      "Review",
      "IOPN",
      "IPMN",
      "AJCCTNM"
    )

    ### 1. create a datatable with checkboxes ###
    # taken from https://github.com/rstudio/DT/issues/93/#issuecomment-111001538
    # a) function to create inputs
    shinyInput <- function(FUN, ids, ...) {
      inputs <- NULL
      inputs <- sapply(ids, function(x) {
        inputs[x] <- as.character(FUN(inputId = x, label = NULL, ...))
      })
      inputs
    }

    # b) create dataframe with the checkboxes
    df <- data.frame(
      ArticleProperties = answer_options,
      Present = shinyInput(checkboxInput, answer_options),
      stringsAsFactors = FALSE
    )

    # c) create the datatable
    output$checkbox_table <- DT::renderDataTable(
      df,
      server = FALSE,
      escape = FALSE,
      selection = "none",
      rownames = FALSE,
      options = list(
        dom = "t",
        paging = FALSE,
        ordering = FALSE,
        preDrawCallback = JS(
          "function() { Shiny.unbindAll(this.api().table().node()); }"
        ),
        drawCallback = JS("function() { Shiny.bindAll(this.api().table().node()); } ")
      )
    )

    ### 2. save rows when user hits submit -- either to new or existing csv ###
    observeEvent(input$submit, {
      # if user has not put in a username, don't add rows and show modal instead
      if (input$PMID == "") {
        showModal(
          modalDialog(
            "Please enter PMID first",
            easyClose = TRUE,
            footer = NULL,
            class = "error"
          )
        )
      } else {
        responses <- data.frame(
          PMID = input$PMID,
          Feature = answer_options,
          Present = sapply(answer_options, function(i)
            input[[i]], USE.NAMES = FALSE)
        )

        # if file doesn't exist in current wd, col.names = TRUE + append = FALSE
        # if file does exist in current wd, col.names = FALSE + append = TRUE
        if (!file.exists("articleFeatures.csv")) {
          write.table(
            responses,
            "articleFeatures.csv",
            col.names = TRUE,
            row.names = FALSE,
            append = FALSE,
            sep = ","
          )
        } else {
          write.table(
            responses,
            "articleFeatures.csv",
            col.names = FALSE,
            row.names = FALSE,
            append = TRUE,
            sep = ","
          )
        }
        # tell user form was successfully submitted
        showModal(
          modalDialog(
            "Successfully submitted",
            easyClose = TRUE,
            footer = NULL,
            class = "success"
          )
        )
        # reset all checkboxes and username
        sapply(answer_options, function(x)
          updateCheckboxInput(session, x, value = FALSE))
        updateTextInput(session, "PMID", value = "")
      }
    })
  }
)


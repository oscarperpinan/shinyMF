library(shiny)
library(meteoForecast)

data(varsMG)
varsChoices <- as.character(varsMG$name)
## names(varsChoices) <- as.character(varsMG$label)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(

  # Application title.
  headerPanel("WRF Meteogalicia"),

  sidebarPanel(
      numericInput("north", "North:", 44),
      numericInput("south", "South:", 30),
      numericInput("west", "West:", -10),
      numericInput("east", "East:", 5),

      selectInput("var", 'Select the WRF variable:',
                  choices=varsChoices,
                  selected=names(varsChoices)[25]), ## swflx

      submitButton("Download data")
      ),

    mainPanel(
        ## h4("Summary"),
        ## verbatimTextOutput("summary"),

        h4("Day1"),
        plotOutput("view1"),

        h4("Day2"),
        plotOutput("view2"),

        h4("Day3"),
        plotOutput("view3"),

        h4("Day4"),
        plotOutput("view4")
        )
    ))

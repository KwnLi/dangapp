library(shiny)
source("dangapp_functions.R")

#####App code#####
ui <- fluidPage(
  tags$head(tags$style(HTML("hr {border-top: 1px solid #707070;}"))),
  titlePanel("Christine's long lost exercise app"),
  helpText("Updated Dec 28, 2021"),
  
  sidebarPanel(
    numericInput(
      "RM1", "Enter your 1 repetition maximum", 130, step = 5
    ),
    selectInput(
      "TEffect", "Select training effect",
      choices = c(`Strength` = "str",
                  `Explosive power` = "exppwr",
                  `Power endurance` = "pwrend",
                  `Endurance` = "end")
    ),
    actionButton(inputId = "go", label = "Calculate!")
  ),
  mainPanel(
    htmlOutput("outText")
  )
)

server <- function(input, output, session){
  calcresult <- eventReactive(input$go,{
    rmcalc(input$TEffect, input$RM1)
  })
  output$outText <- renderUI({HTML(calcresult())})
}

shinyApp(ui = ui, server = server)
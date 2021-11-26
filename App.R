library(shiny)

# Define UI for application that plots random distributions 
ui <- pageWithSidebar(
  
  # Application title
  headerPanel("Hello Shiny!"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("obs", 
                "Number of observations:", 
                min = 1,
                max = 1000, 
                value = 500)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
)

server <- (function(input, output) {
  
  output$distPlot <- renderPlot({
    dist <- rnorm(input$obs)
    hist(dist)
  })
})
shinyApp(ui,server)
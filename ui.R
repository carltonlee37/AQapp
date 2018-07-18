library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Predict Ozone from Wind"),
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderWind",
                   "What is wind speed?",
                   min = 0,
                   max = 20,
                   value = 10),
       sliderInput("sliderSolar",
                   "What is solar radiation?",
                   min=0,
                   max=300,
                   value=150)
    ),
    
    mainPanel(
       plotOutput("windPlot"),
       h4("Predicted Ozone (ppm):"),
       h4(textOutput("predW")),
       plotOutput("solarPlot"),
       h4("Predicted Ozone (ppm):"),
       h4(textOutput("predS")
    )
  )
))
)
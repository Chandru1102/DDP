library(shiny)

# user interface for mtcars data explorer
library(shiny)
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Motor Trend Car Road Tests Shiny app"),

  # control panel for selecting input variable 
  sidebarPanel(h3("Shiny Application for mtcars data"),
      helpText("The Miles Per Gallon (MPG) ", 
        "outcome variable will be observed in relation to",
        "other predictor variables in the mtcars dataset.",
        "You can choose the predictor variable from ",
        "the dropdown list. The shiny app will then plot ",
        "MPG against the chosen predictor variable. A ",
        "linear model will also be fit and added to the plot."),

    selectInput("variable", "predictor:",
                list("Cylinders" = "cyl",
		     "HP" = "hp",
		     "Weight" = "wt",
		     "Quarter-Mile Time" = "qsec", 
                     "Transmission" = "am", 
                     "Gears" = "gear"))

  ),

  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("mpgLMCaption")),

    plotOutput("mpgLMPlot")
  )
))
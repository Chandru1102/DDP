library(shiny)
library(datasets)


# factor the "am" variable 
df <- mtcars
df$am <- factor(df$am, labels = c("Automatic", "Manual"))

#  Based on the input the service will plot the output mpg
# and fit a linear model and display it
shinyServer(function(input, output) {

  # store the y versus x in a reactive function to be used in later calls 
  lmStr <- reactive({
   sprintf("mpg ~ %s", input$variable)
  })

  #  lets pint the caption
  output$mpgLMCaption <- renderText({
    lmStr()
  })

  # plot mpg versus x, also the linear regression model fit
  output$mpgLMPlot <- renderPlot({
    
    plot(as.formula(lmStr()), data = df)
    fit <- lm(as.formula(lmStr()), data = mtcars)
    abline(fit)
            
  })
})
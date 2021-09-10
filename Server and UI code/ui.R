library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Week 4 Peer Assessment: Shiny App"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("var", "Variable:", 
                        c("Cylinders" = "cyl", "Transmission type" = "am",
                          "Gears" = "gear")),
            checkboxInput("model", "Show a simple regression model of hp vs mpg", 
                          value = FALSE),
                        submitButton("Sure! It seems cool")
                
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3(textOutput("title")),
            plotOutput("plot1"),
            plotOutput("plot2")
        )
    )
))

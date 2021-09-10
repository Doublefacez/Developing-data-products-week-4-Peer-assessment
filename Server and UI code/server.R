library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
data <- mtcars
data$am <- factor(data$am, labels = c("Auto", "Manual"))

shinyServer(function(input, output) {
    
    fig_title <- reactive({
        paste("mpg vs ", input$var)
    })

    output$title <- renderText({
        fig_title()
    })
    
    output$plot1 <- renderPlot({
        
        if(input$var == "cyl"){
            plot(mtcars$cyl, mtcars$mpg, main = "Plot of mpg vs cyl",
                 xlab = "Cylinders", ylab = "Miles Per Gallon (mpg)")
        }
        if(input$var == "am"){
        
            boxplot(mtcars$mpg, mtcars$am, names = c("Auto", "Manual"),
                    main = " Boxplot of mpg of each transmission type ")
        }
        if(input$var == "gear"){
            plot(mtcars$gear, mtcars$mpg,
                    main = " Plot of mpg of each gear", xlim = c(3, 5))
        }

    })
    output$plot2 <- renderPlot({
        if(input$model){
            model1 <- lm(hp~mpg, data = mtcars)
           
                plot(mtcars$mpg, mtcars$hp, xlab = "Miles per Gallon",
                     ylab = "Horsepower", bty = "n", pch = 16,
                     xlim = c(10,35), ylim = c(50, 350))
                abline(model1, col = "red", lwd = 2)
        }
        })
        
    
    
})

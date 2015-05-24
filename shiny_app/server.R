library(shiny)
library(rattle)

palette(c("#FF4081", "#3D5AFE", "#00E5FF", "#76FF03",
          "#FFEA00", "#FFFF33", "#A65628", "#F781BF", "#E040FB"))

shinyServer(function(input, output, session) {
        
        wine <- read.csv("wine.csv")
        
        # Combine the selected variables into a new data frame
        wine$Type <- as.numeric(wine$Type)
        
        selectedData <- reactive({
                wine[, c(input$xcol, input$ycol)]
        })
        
        clusters <- reactive({
                kmeans(selectedData(), input$clusters)
        })
        
        output$plot1 <- renderPlot({
                par(mar = c(5.1, 4.1, 0, 1))
                plot(selectedData(),
                     col = clusters()$cluster,
                     pch = 20, cex = 3)
                points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
        })
        
})
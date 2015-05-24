library(shiny)

shinyUI(pageWithSidebar(
        headerPanel('Wine k-means clustering'),
        sidebarPanel(
                selectInput('xcol', 'X Axis', names(wine)),
                selectInput('ycol', 'Y Axis', names(wine),
                            selected=names(wine)[[2]]),
                numericInput('clusters', 'Cluster count', 3,
                             min = 1, max = 9),
                h4("About this Shiny Application"),
                h6("Uses the library dataset - wine"),
                h6("Show the scatter plot of 2 variables based on your input."),
                h6("Also compute k-means clustering on the 2 variables.")
        ),
        mainPanel(

                plotOutput('plot1')
        )
))
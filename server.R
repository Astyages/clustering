
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(datasets)

shinyServer(
      function(input, output) {
      
      datasetInput <- reactive({
            switch(input$datasets,
                   "iris" = iris,
                   "trees" = trees,
                   "orchard sprays" = OrchardSprays)
      })
      
  output$ClusterDendogram <- renderPlot({
        dataset <- datasetInput()
        col <- which(sapply(dataset, class) == "numeric" | sapply(dataset, class) == "integer")
        data <- dataset[, col]
        clust <- hclust(dist(data)^2, method = "ward.D")
        plot(clust, hang = F, labels = F, xlab = NA)
        rect.hclust(clust, k = input$k)    
  })
  
  output$VariablebyCluster <- renderPlot({
        dataset <- datasetInput()
        col <- which(sapply(dataset, class) == "numeric" | sapply(dataset, class) == "integer")
        data <- dataset[, col]
        clust <- hclust(dist(data)^2, method = "ward.D")
        g <- cutree(clust, k = input$k)
        plot(data, col = g, pch = 19)
  })
  
})

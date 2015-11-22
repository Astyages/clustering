
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Simple Interactive Clustering"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    selectInput("datasets",
                "Choose a dataset to cluster:",
                choices = c("iris", "trees", "orchard sprays")),
    numericInput("k", 
                 "Number of clusters to generate:", 3),
    submitButton("Submit")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
      h3("Ward-Clustering Dendogram"),
    plotOutput("ClusterDendogram"),
      h3("Pair Plots for every variable colored by cluster"),
    plotOutput("VariablebyCluster")
  )
))

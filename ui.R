
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(

  headerPanel("Simple Interactive Clustering"),
  
  sidebarPanel(
        p("This simple app allows you to choose one of three datasets and create and plot clusters to show the groupings of similar variables.
          The app takes only the quantitative variables in the selected dataset and creates hierarchical clusters using the ward metod.
          It then plots a dendogram of the variables with a default rectangle grouping. 
          It is left to your discretion into how many clusters the variables should be grouped. 
          This decision is reflected in the second plot. 
          Here, every data point is colored per its assigned cluster and plotted for every quantitative variable in the dataset."
          ),
        p("Play around with the number of clusters to see how the variables are grouped and colored."),
    selectInput("datasets",
                "Choose a dataset to cluster:",
                choices = c("iris", "trees", "orchard sprays")),
    numericInput("k", 
                 "Number of clusters to generate:", 3),
    submitButton("Submit")
  ),
  
  mainPanel(
      h3("Ward-Clustering Dendogram"),
    plotOutput("ClusterDendogram"),
      h3("Pair Plots for every variable colored by cluster"),
    plotOutput("VariablebyCluster")
  )
))

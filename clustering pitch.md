Simple Interactive Clustering
========================================================
author: N. G. Schwarz
font-family: 'Helvetica'
transition: rotate

Description
========================================================

This simple Shiny app allows you to choose one of three datasets and create clusters and plot graphs to show the groupings of similar variables. You can find it here:

https://astyages.shinyapps.io/clustering


Components
========================================================

With this app you can: 
- Choose between three datasets
- Group variables into different number of cluster
- Plot a dendogram showing the clusters
- Plot a pairs scatterplot showing how the data points are grouped 

Functions
========================================================

The app makes use of the following basic functions

```r
hclust(..., method = "ward.D")    
# to calculate clusters
cutree()    
# to divide data into groups
plot()      
# to plot both the dendogram and the pairs plot
```

Example of Hierarchical Clustering
========================================================

```r
data(trees)
hclust(dist(trees))
```

```

Call:
hclust(d = dist(trees))

Cluster method   : complete 
Distance         : euclidean 
Number of objects: 31 
```

library (mass)
library(igraph)

# set woking dir
setwd('D:\\Study\\UIUC\\MSIM\\COURSES\\FAll2017\\IS590-DataViz\\script\\DataViz\\')

#load the data from the csv files 
d_edges <- read.csv('datafiles\\r_data_nw_92917\\DisneyRidesYear_Edges.csv' , header = TRUE, as.is = T)
d_nodes <- read.csv('datafiles\\r_data_nw_92917\\DisneyRidesYear_Nodes.csv' , header = TRUE, as.is = T)

View(d_nodes)
class(d_nodes)

# p_edges <- read.csv('datafiles\\r_data_nw_92917\\pokemon_edges.csv' , header = TRUE)
# p_nodes <- read.csv('datafiles\\r_data_nw_92917\\pokemon_nodes.csv' , header = TRUE)

disnet <- graph_from_data_frame(d=d_edges, vertices = d_nodes, directed = F)

disnet <- simplify(disnet, remove.loops = T)
plot(disnet)

## remove the labels from the edges, for visualization.
V(disnet)$label <- NA
plot(disnet)

## pasting it back. 
V(disnet)$label = paste(d_nodes$id, d_nodes$typelabel, sep=', ')
plot(disnet)


V(disnet)$label.cex <-0.7
plot(disnet)

V(disnet)$label.color <-'grey'
plot(disnet)

V(disnet)$size <- 10
plot(disnet)

unique(d_nodes$id.type)


## create a random array of 16 colors, (16 nodes) 
colrs <- sample(rainbow(16))

## randomly assign the colrs out of 16 to the nodes
V(disnet)$color <- colrs[V(disnet)$id.type]
plot(disnet)


plot(disnet, edge.color="black", edge.curved=0, layout=layout.circle, 
     main="Rides in Magic Kingdom")


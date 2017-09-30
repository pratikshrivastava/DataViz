library (mass)
library(igraph)
#install.packages("visNetwork")
library("visNetwork")

# set woking dir
setwd('D:\\Study\\UIUC\\MSIM\\COURSES\\FAll2017\\IS590-DataViz\\script\\DataViz\\')

#load the data from the csv files 
edges <- read.csv('datafiles\\r_data_nw_92917\\pokemon_edges.csv' , header = TRUE, as.is = T)
nodes <- read.csv('datafiles\\r_data_nw_92917\\pokemon_nodes.csv' , header = TRUE, as.is = T)

View(edges)

## different # of ids. 
unique(nodes$id.type)

colrs <- c("blacck","green","red","blue","grey","burlywood","purple","yellow"
           ,"brown","pink","gold","plum")

nodes$color <- colrs[nodes$id.type]

unique(edges$to)
## makegroups to assign the colo

grps <- c("Pokemon","Grass","Fire","Water","Bug", "Normal","Poison","Electric","Ground","Fairy",
          "Flying","Dragon")

grps <- unique(edges$to)

nodes$group <- grps[nodes$id.type]

nodes$borderwidth <- 4

nodes$shadow <- TRUE
nodes$label <- NA

nodes <- data.frame(nodes, title=paste0("<p><b>", nodes$id,"</b></p>"))

edges$color <- "black"
edges$color.highlight <-"green"


pokenet <- visNetwork(nodes,edges,main="Pokemon Types Network",
 submain="By Pratik") %>%
  visOptions(selectedBy= "group",highlightNearest =TRUE) %>%
  visGroups(groupname="Pokemon",color="black") %>%
  visGroups(groupname="Grass",color="black")%>%
  visGroups(groupname="Fire",color="black") %>%
  visGroups(groupname="Water",color="black") %>%
  visGroups(groupname="Bug",color="black") %>%
  visGroups(groupname="Normal",color="black") %>%
  visGroups(groupname="Poison",color="black") %>%
  visGroups(groupname="Electric",color="black") %>%
  visGroups(groupname="Fairy",color="black") %>%
  visGroups(groupname="Flying",color="black") %>%
  visGroups(groupname="Dragon",color="black") %>%
  visPhysics(solver="forceAtlas2Based",forceAtlas2Based=list(gravitationalConstant= -500))

pokenet











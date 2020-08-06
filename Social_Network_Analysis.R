#####################################
#####  Social Network Analysis  #####
#####################################


# Installing sna and igraph packages
install.packages("sna")
install.packages("igraph")

# Loading the sna and igraph packages
library(sna)
library(igraph)

# Setting the working directory
setwd("C:/Users/lokma/Desktop/Social_Network_Analysis_with_R")
getwd()

# Loading the undirected data set
g_undirect <- read.table('data/undirected.txt')
head(g_undirect)

# Create a graph from the undirected data set
graph1 <- graph_from_data_frame(g_undirect, directed = FALSE, vertices = NULL)
plot(graph1)

# Loading the directed data set
g_direct <- read.table('data/directed.txt')
head(g_direct)

# Create a graph from the directed data set
graph2 <- graph_from_data_frame(g_direct, directed = TRUE)
plot(graph2)


# Create Some Basic Network Graphs

# Full graph with 8 nodes and no direction
g_full <- make_full_graph(8, directed = FALSE)
plot(g_full)

# Ring graph with 12 nodes and no direction, not mutal, and circular
g_ring <- make_ring(12, directed = FALSE, mutual = FALSE, circular = TRUE)
plot(g_ring)

# Star graph with a central vertex and 10 nodes 
g_star <- make_star(10, center = 1)
plot(g_star)

# Other graph options, such as Erdos-Renyi, GNP, and GNM graphs

# GNP graph with 20 vertices, probability of a connection = 0.3 , no direction and no loops
g_gnp <- sample_gnp(20, 0.3, directed = FALSE, loops = FALSE)
plot(g_gnp)

# GNM graph with 20 vertices, 50 edges within the graph, no direction, no loops
g_gnm <- sample_gnm(20, 50, directed = FALSE, loops = FALSE)
plot(g_gnm)

# Other models, such as preferential attachment
# Create a network starts with two linked nodes, then use a weighted probabiity distribution
# to determine which node to attach the next node to.
# Preferential Attachement (PA) model with 20 vertices, power=1 
# power parameter, weight to give to each of the connections, equal one means equal weight to each connection
g_gpa <- sample_pa(20, power = 1)
plot(g_gpa)


# Measure Connectedness of Points

# One of the most basic measures of the vertices in a graph,
# is how many connections they have to other vertices.
# This measure can either be the number of connections divided by the total possible connections
# It's also called "density" or the number of links from each vertex also called "vertex's degree"

# Practice with the preferential attachemnet model
g2 <- sample_pa(12, power = 1, directed = FALSE)
plot(g2) # highly centralized network to node 1, 2, and 3

# Check the degrees for each of the node means the number of links that it has
# The first number represents the number of connection of node#1
degree(g2)


# Measure betweenness of Points
# In social network, some individuals providemode bridges between and among groups of network members.
# One way to estimate the role of these individuals is to calculate the betweenness of each vertex.
# The higher the betweenness score associate with a vertex, the more of a bridging role it plays within the network.

# Practice with preferential attachement model
g3 <- sample_pa(20, power = 1, directed = FALSE)
plot(g3) # Node#1 and #2 are the central node

# Check the betweenness of the network
betweenness(g3)


# Calculate Network Density
# When analyzing a social network, we will often be interested in how dense it is.
# Network density is the number of connections divided by the number of possible connections.
# A completely linked network has a density of one, while other networks will have a decimal value,
# representing the percent of possible links that are actually present.

# Practice with preferential attachment model (12 nodes)
g4 <- sample_pa(12, power = 1, directed = FALSE)
plot(g4)

# Calculate the edge density, 2 / number of nodes or vertices
ed <- edge_density(g4, loops = FALSE)
ed # 2 / 12 = 0.1667

# Practice with preferential attachment model (20 nodes)
g5 <- sample_pa(20, power = 1, directed = FALSE)
plot(g5)

# Check the edge density
ed <- edge_density(g5, loops = FALSE)
ed # 2 / 20 = 0.1

# Practice with preferential attachment model (40 nodes)
g6 <- sample_pa(40, power = 1, directed = FALSE)
plot(g6)

# Check the edge density
ed <- edge_density(g6, loops = FALSE)
ed # 2 / 40 = 0.05

# Practice with GNP model (20 nodes)
g7 <- sample_gnp(20, 0.3, directed = FALSE)
plot(g7)

# Check the edge density
ed <- edge_density(g7, loops = FALSE)
ed # close to the probability set for the sample network, 0.3


# Identify Cliques in a Graph
# A clique is defined as a group of vertices where all possible links are present.
# Identify and enumerate cliques in a network

# Practice with GNP model (20 nodes)
g8 <- sample_gnp(20, 0.3, directed = FALSE, loops = FALSE)
plot(g8)

# Analyze the Clique
# 1. Calculate the size of the largest clique (largest fully-connected subgroup within the network)
clique_num(g8) # return the number of the largest clique in the network

# Display the number of cliques that are of a particular size
# Let says minimum of size 4
cliques(g8, min = 4) # return the cliques with fully-connected size of 4

# Find min equals 3 and max equals 4
cliques(g8, min = 3, max = 4) # return the cliques with min 3 full connection and max 4 full connection

# Practice with GNP model (20 nodes and probability = 0.6)
g9 <- sample_gnp(20, 0.6, directed = FALSE, loops = FALSE)
plot(g9)

# The network becomes very highly interconnected
# Check the largest clique number again,
clique_num(g9)

# It's interesting to see how network density affect the number of cliques available.


# Find Components of a Graph
# When creating a graph, it's possible that not every vertex or node on the graph will be connected.
# A group of connected network nodes is called a "Component"
# It's possible that a graph have multiple components that aren't interconnected.

# Practice with GNP model (30 nodes and probability = 0.08)
# Only 8% probability of any individual link being available
g10 <- sample_gnp(30, 0.08, directed = FALSE, loops = FALSE)
plot(g10)

# Number of components in the graph and get information about them
components(g10) # Return 1) membership, 2) size of the components, 3) number of components


# Random Walk on a Graph
# Some graphs represent processes or path where the active node can change.
# When performing a random walk on a graph, we assign each outgoing edge an equal probability
# and have R determine which edge to follow to another node.

# Practice with GNP model (30 nodes and probability = 0.08)
# Only 8% probability of any individual link being available
g11 <- sample_gnp(30, 0.08, directed = FALSE, loops = FALSE)
plot(g11)

# Create a random walk started with node #21, number of steps = 8, stuck = "return"
random_walk(g11, 21, 8, stuck = "return") # Return a path that was taken from 21 to the next vertex or node

# If the random walk starts at the node with no connection, it couldn't go further in the path
random_walk(g11, 5, 8, stuck = "return") # Return only starting node


# Visualize a Network

# Create a graph with igraph package
# Practice with GNP model (20 nodes and probability = 0.1)
g <- sample_gnp(20, 0.1)
plot(g)

# Change edge and vertex colors
g <- sample_gnp(20, 0.1) %>%
  set_vertex_attr("color", value = "blue") %>%
  set_edge_attr("color", value = "green")
plot(g)

# Write out the data and graph
g <- sample_gnp(20, 0.1)
plot(g)

# Write the data to the local drive
setwd("C:/Users/lokma/Desktop/Social_Network_Analysis_with_R")
getwd()
write.graph(g, file = "data/gnp_graph.txt", format = "edgelist")

# Write the graph to local drive in pdf format
pdf("images/gnp_graph.pdf")
plot(g)
dev.off()

# Write the graph to local drive in png format
png("images/gnp_graph.png", width = 500, height = 500)
plot(g)
dev.off()

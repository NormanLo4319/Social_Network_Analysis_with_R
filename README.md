# Social Network Analysis with R
Many complex structures can be modeled by networks. Studying the structure of a network can allow us to answer questions about complex phenomena. In this repository, we demonstrate how to visualize and analyze data from a social network like Twitter or Facebook with the text-based statistical language, R. If you're involved in analytics in any capacity, this repository could be a huge help, showing you how the R **sna** and **igraph** modules works and how to format data for analysis, create graphs, analyze network graphs, and visualize networks. Use the examples in this repository to practice examining relationship and trend among networks in new and exciting ways, and discover information about how individuals in an organization interact.

## Learning objectives:
Introduce different types of netorkds in the real world and why we study them. Learn about the basic elements of networks, as well as different types of networks. Represent and manipulate newtworked data using the **sna** and **igraph** libraries. Identify applications and important questions about networks that network science allow us to answer.

## Terminologies:
Network: A representation of connections among a set of items.
Nodes or Vertices: Itmes defined in a network
Edges: Connection between nodes or vertices
Undirected Network: Edges have no direction
Directed Network: Edges have direction
Weighted Network: A network where edges are assigned a (typically numerical) weight.

## Learnign Path:

### Formatting Data (Directed vs. Undirected)

Network data, though collected at the level of the individual, is analyzed at the structural level.  Data is organized as an actor-by-actor matrix.  Data depicts the presence or absence of a tie.  When the strength of a tie is also of interest similarity or distance matrices could be used.  Similarity matrices depict stronger ties with increasing numerical values, while increasing numerical values in distance matrices reflect weakened ties because the greater the distance between two actors, the weaker the ties. Any actor-by-actor matrix can be converted into graphs and analyzed using social network analysis software and package, such as R SNA package. 

In the example data, we have two data sets to present the directed and undirected networks. The numbers in the data sets represent items/actor in the network. If we have a pair of [1,3], it basically means that there is a connection between item #1 and item #3 in this network. Each row represents a connection between 2 items/actors. 

![undirected_data](/images/undirected_data.png)
![directed_data](/images/directed_data.png)

## Undirected Network:
![undirected](/images/undirected.png)
## Directed Network:
![directed](/images/directed.png)


### Creating Basic Network Graphs

![full](/images/full.png)
![ring](/images/ring.png)
![star](/images/star.png)
![gnp](/images/gnp.png)
![gnm](/images/gnm.png)
![pa](/images/pa.png)

### Measuring Connectedness and Betweenness of Points

### Calculating Networking Density

### Describing Network Components

### Visualizing a Network

![format](/images/gnp_format.png)

### Writing a Network Description to a Text or Image File


**Resources:**  [Social Network Analysis (sna Package)](https://www.rdocumentation.org/packages/sna/versions/2.5)  |  [igraph Package](https://igraph.org/r/)

Copyright © 2020 Norman Lo

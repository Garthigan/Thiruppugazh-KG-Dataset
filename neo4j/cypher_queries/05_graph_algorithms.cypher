// Graph Data Science algorithms for Thiruppugazh KG

// Create projected graph
CALL gds.graph.project(
  'thiruppugazhGraph',
  ['Song', 'Entity', 'Theme', 'MythEvent', 'Philosophy', 'Imagery', 'Place'],
  {
    MENTIONS_ENTITY: {orientation: 'UNDIRECTED'},
    HAS_THEME: {orientation: 'UNDIRECTED'},
    REFERS_TO_EVENT: {orientation: 'UNDIRECTED'},
    USES_IMAGERY: {orientation: 'UNDIRECTED'},
    HAS_PHILOSOPHY: {orientation: 'UNDIRECTED'},
    LOCATED_AT: {orientation: 'UNDIRECTED'}
  }
)
YIELD graphName, nodeCount, relationshipCount;

// Drop the graph projection
CALL gds.graph.drop('thiruppugazhGraph');

// PageRank analysis - Top 10 entities by importance
CALL gds.pageRank.stream('thiruppugazhGraph', {
  scaler: 'MinMax'
})
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS node, score
WHERE node:Entity
RETURN node.name AS Entity, score
ORDER BY score DESC
LIMIT 10;

// PageRank for themes
CALL gds.pageRank.stream('thiruppugazhGraph')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS node, score
WHERE node:Theme
RETURN node.name AS theme, score
ORDER BY score DESC
LIMIT 15;

// PageRank for places/temples
CALL gds.pageRank.stream('thiruppugazhGraph')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS node, score
WHERE node:Place
RETURN node.name AS temple, score
ORDER BY score DESC
LIMIT 20;

// Louvain Community Detection
CALL gds.louvain.stream('thiruppugazhGraph')
YIELD nodeId, communityId
RETURN count(DISTINCT communityId) AS communities;

// Communities grouped by places
CALL gds.louvain.stream('thiruppugazhGraph')
YIELD nodeId, communityId
WITH gds.util.asNode(nodeId) AS node, communityId
WHERE node:Place
RETURN communityId, collect(node.name) AS temples
ORDER BY size(temples) DESC;

// Check GDS version
RETURN gds.version() AS gds_version;

// Basic statistics queries

// Count total nodes by type
MATCH (n:Song) RETURN count(n) AS Songs;
MATCH (n:Entity) RETURN count(n) AS Entities;
MATCH (n:Theme) RETURN count(n) AS Themes;
MATCH (n:MythEvent) RETURN count(n) AS MythEvents;
MATCH (n:Philosophy) RETURN count(n) AS Philosophies;
MATCH (n:Imagery) RETURN count(n) AS Imageries;
MATCH (n:Place) RETURN count(n) AS Places;

// Count total relationships
MATCH ()-[r]->() RETURN count(r) AS TotalRelationships;

// Get relationship types and counts
MATCH ()-[r]->()
RETURN type(r) AS relationship_type, count(r) AS count
ORDER BY count DESC;

// Basic graph statistics
MATCH (n)
WITH count(n) AS nodes
MATCH ()-[r]->()
WITH nodes, count(r) AS edges
RETURN nodes, edges, (2.0 * edges) / nodes AS avg_degree;

// Node degree distribution
MATCH (n)-[r]-()
RETURN n, count(r) AS degree
ORDER BY degree DESC
LIMIT 10;

// Graph density
MATCH (n)
WITH count(n) AS nodes
MATCH ()-[r]->()
WITH nodes, count(r) AS edges
RETURN edges / (nodes * (nodes - 1)) AS density;

// Show database labels
CALL db.labels();

// Database schema visualization
CALL db.schema.visualization();

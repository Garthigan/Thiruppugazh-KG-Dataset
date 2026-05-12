# Neo4j Cypher Queries for Thiruppugazh KG

This directory contains organized Cypher queries for the Thiruppugazh Knowledge Graph dataset.

## Query Files

### 1. `01_constraints.cypher`
Sets up unique constraints for all node types:
- Song (song_number)
- Theme (name)
- Entity (name)
- MythEvent (name)
- Philosophy (name)
- Imagery (name)
- Place (name)

**Purpose:** Ensures data integrity and optimizes query performance.

---

### 2. `02_data_import.cypher`
Loads all data from the JSON dataset and creates relationships:
- Loads Song nodes with properties
- Creates LOCATED_AT relationships with Places
- Creates HAS_THEME relationships with Themes
- Creates REFERS_TO_EVENT relationships with MythEvents
- Creates MENTIONS_ENTITY relationships with Entities
- Creates HAS_PHILOSOPHY relationships with Philosophy nodes
- Creates USES_IMAGERY relationships with Imagery nodes

**Purpose:** Populates the knowledge graph from the source JSON dataset.

---

### 3. `03_basic_queries.cypher`
Basic statistical queries:
- Node counts by type
- Relationship counts
- Graph statistics (density, average degree)
- Node degree distribution
- Database labels and schema visualization

**Purpose:** Explore the basic structure and statistics of the graph.

---

### 4. `04_analysis_queries.cypher`
Domain-specific analysis queries:
- **Theme Analysis:** Most frequent themes in hymns
- **Entity Analysis:** Most mentioned entities (e.g., Murugan)
- **Mythological Events:** Frequency of myth references
- **Philosophy:** Philosophical concepts in songs
- **Imagery:** Symbolic imagery usage
- **Sacred Locations:** Temple frequency and relationships
- **Specific Songs:** Detailed view of individual hymns
- **Related Content:** Songs related by shared properties

**Purpose:** Extract insights and patterns from the devotional literature.

---

### 5. `05_graph_algorithms.cypher`
Advanced graph analysis using Neo4j Graph Data Science (GDS):
- **Graph Projection:** Create in-memory graph projections
- **PageRank:** Identify important nodes (entities, themes, places)
- **Louvain Community Detection:** Find communities of related concepts
- **Version Check:** Verify GDS availability

**Purpose:** Perform advanced network analysis and discover structural patterns.

---

## Usage Instructions

### Prerequisites
- Neo4j Server (4.0+)
- APOC Library (for data loading)
- Graph Data Science Library (for algorithms)

### Import Workflow

1. **Set up constraints first:**
   ```
   Load and execute: 01_constraints.cypher
   ```

2. **Load data into Neo4j:**
   ```
   Place thiruppugazh_dataset.json in Neo4j's import directory
   Load and execute: 02_data_import.cypher
   ```

3. **Explore basic statistics:**
   ```
   Load and execute queries from: 03_basic_queries.cypher
   ```

4. **Perform domain analysis:**
   ```
   Load and execute queries from: 04_analysis_queries.cypher
   ```

5. **Run advanced algorithms:**
   ```
   Load and execute queries from: 05_graph_algorithms.cypher
   ```

### Neo4j Browser Tips
- Copy entire query file content
- Paste into Neo4j Browser query editor
- Execute with Ctrl+Enter (Cmd+Enter on Mac)
- View results in table, graph, or text format

### Common Queries Quick Reference

**Get graph overview:**
```cypher
CALL db.schema.visualization();
```

**Most important entities (by PageRank):**
```cypher
CALL gds.pageRank.stream('thiruppugazhGraph')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS node, score
WHERE node:Entity
RETURN node.name AS Entity, score
ORDER BY score DESC LIMIT 10;
```

**Find community structures:**
```cypher
CALL gds.louvain.stream('thiruppugazhGraph')
YIELD nodeId, communityId
RETURN count(DISTINCT communityId) AS communities;
```

---

## Query Characteristics

| Query Type | File | Complexity | Use Case |
|-----------|------|-----------|----------|
| Setup | 01 | Low | Initial configuration |
| Data Loading | 02 | Medium | Population from JSON |
| Basic Stats | 03 | Low | Quick overview |
| Domain Analysis | 04 | Medium | Research & insights |
| Advanced Analytics | 05 | High | Pattern discovery |

---

## Performance Notes

- Large result sets may require pagination
- Use `LIMIT` clause to manage memory
- GDS algorithms require sufficient heap memory
- Consider indexing frequently queried properties

---

## Related Files

- Dataset: `../dataset/thiruppugazh_kg.json`
- Import logs: `../neo4j_query_cmd_history_2026-5-12.txt`

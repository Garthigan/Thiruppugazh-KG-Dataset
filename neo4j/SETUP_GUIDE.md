# Neo4j Thiruppugazh Knowledge Graph - Setup Guide

This guide provides step-by-step instructions for setting up and populating the Neo4j database for the Thiruppugazh Knowledge Graph dataset.

---

## System Requirements

- **Neo4j Server:** Version 4.0 or higher
- **RAM:** Minimum 2GB (4GB+ recommended)
- **Disk Space:** 5GB+ (depending on dataset size)
- **Java:** 11+ (required by Neo4j)
- **Required Plugins:**
  - APOC Library (for JSON loading)
  - Graph Data Science (for algorithms)

---

## Installation Steps

### 1. Install Neo4j

**On macOS (using Homebrew):**
```bash
brew install neo4j
```

**On Linux:**
```bash
# For Ubuntu/Debian
sudo apt-get install neo4j

# For RHEL/CentOS
sudo yum install neo4j
```

**On Windows:**
- Download from: https://neo4j.com/download-center/
- Follow the installer

### 2. Install APOC Library

1. Navigate to Neo4j plugins directory
2. Download APOC from: https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases
3. Place JAR file in `$NEO4J_HOME/plugins/`
4. Update `neo4j.conf`:
   ```
   dbms.security.procedures.allowlist=apoc.*,gds.*
   ```

### 3. Install Graph Data Science

1. Download from: https://neo4j.com/download-center/
2. Place JAR file in `$NEO4J_HOME/plugins/`
3. Configure in `neo4j.conf` (if not already done):
   ```
   dbms.security.procedures.allowlist=apoc.*,gds.*
   ```

### 4. Configure Neo4j

Edit `$NEO4J_HOME/conf/neo4j.conf`:

```properties
# Memory settings
dbms.memory.heap.initial_size=2G
dbms.memory.heap.max_size=4G

# Import directory
dbms.directories.import=./import

# Allow procedures
dbms.security.procedures.allowlist=apoc.*,gds.*
```

### 5. Start Neo4j

```bash
# Using systemctl (Linux)
sudo systemctl start neo4j

# Using homebrew (macOS)
brew services start neo4j

# Manual start
$NEO4J_HOME/bin/neo4j start
```

---

## Data Loading Workflow

### Step 1: Prepare Dataset File

```bash
# Copy dataset to Neo4j import directory
cp dataset/thiruppugazh_dataset.json $NEO4J_HOME/import/
chmod 644 $NEO4J_HOME/import/thiruppugazh_dataset.json
```

### Step 2: Access Neo4j Browser

1. Open browser: http://localhost:7474
2. Default credentials: neo4j / neo4j
3. Change password on first login

### Step 3: Create Constraints (Recommended first)

Execute all queries from: `cypher_queries/01_constraints.cypher`

### Step 4: Load Data

Execute all queries from: `cypher_queries/02_data_import.cypher`

> **Note:** This may take several minutes depending on dataset size. Monitor progress in Neo4j logs.

### Step 5: Verify Import

Execute queries from: `cypher_queries/03_basic_queries.cypher`

Expected results:
- Songs: ~1,335
- Themes: ~100+
- Entities: ~50+
- MythEvents: ~100+
- Philosophies: ~50+
- Imagery: ~200+
- Places: ~50+

---

## Query Execution

### Using Neo4j Browser

1. Navigate to http://localhost:7474
2. Login with credentials
3. Open query file or copy-paste queries
4. Execute with `Ctrl+Enter` (Cmd+Enter on Mac)

### Using cypher-shell (Command Line)

```bash
# Interactive mode
$NEO4J_HOME/bin/cypher-shell

# Execute query file
$NEO4J_HOME/bin/cypher-shell -u neo4j -p password < cypher_queries/03_basic_queries.cypher
```

### Using Python (with py2neo or neomodel)

```python
from neo4j import GraphDatabase

driver = GraphDatabase.driver("bolt://localhost:7687", 
                            auth=("neo4j", "password"))

with driver.session() as session:
    result = session.run(
        "MATCH (n:Song) RETURN count(n) AS total"
    )
    for record in result:
        print(f"Total songs: {record['total']}")
```

---

## Analysis Queries

### Basic Statistics

```cypher
MATCH (n) RETURN count(n) AS total_nodes;
MATCH ()-[r]->() RETURN count(r) AS total_relationships;
```

### Popular Themes

```cypher
MATCH (s:Song)-[:HAS_THEME]->(t:Theme)
RETURN t.name, count(*) AS frequency
ORDER BY frequency DESC LIMIT 10;
```

### Important Entities (PageRank)

```cypher
CALL gds.pageRank.stream('thiruppugazhGraph')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS node, score
WHERE node:Entity
RETURN node.name, score
ORDER BY score DESC LIMIT 10;
```

### Sacred Locations

```cypher
MATCH (s:Song)-[:LOCATED_AT]->(p:Place)
RETURN p.name, count(*) AS song_count
ORDER BY song_count DESC;
```

---

## Performance Optimization

### Index Creation

```cypher
CREATE INDEX song_number_index IF NOT EXISTS
FOR (s:Song) ON (s.song_number);

CREATE INDEX entity_name_index IF NOT EXISTS
FOR (e:Entity) ON (e.name);

CREATE INDEX theme_name_index IF NOT EXISTS
FOR (t:Theme) ON (t.name);
```

### Query Optimization Tips

- Use `WHERE` clauses early in queries
- Leverage indexes on frequently queried properties
- Use `LIMIT` to manage result sets
- Profile queries: `PROFILE <query>`

---

## Troubleshooting

### Issue: APOC Not Available

```
Error: Unknown procedure 'apoc.load.json'
```

**Solution:**
1. Verify APOC JAR is in plugins directory
2. Restart Neo4j
3. Check `neo4j.conf` for procedure allowlist

### Issue: File Not Found

```
Error: File '/thiruppugazh_dataset.json' not found
```

**Solution:**
1. Copy file to `$NEO4J_HOME/import/`
2. Verify file exists and is readable
3. Check path in query (should match filename exactly)

### Issue: Out of Memory

```
Error: OutOfMemoryError
```

**Solution:**
1. Increase heap size in `neo4j.conf`
2. Process data in batches
3. Run expensive queries during off-peak hours

### Issue: Duplicate Constraints

```
Error: Constraint already exists
```

**Solution:**
- Use `IF NOT EXISTS` clause (already in provided scripts)
- Or drop existing constraint first

---

## Backup and Recovery

### Create Backup

```bash
neo4j-admin dump --database=neo4j --to=thiruppugazh_backup.dump
```

### Restore Backup

```bash
neo4j stop
neo4j-admin load --from=thiruppugazh_backup.dump --database=neo4j --force
neo4j start
```

---

## Monitoring

### Check Database Status

```cypher
CALL dbms.listConfig()
YIELD name, value
WHERE name CONTAINS 'memory'
RETURN name, value;
```

### Monitor Query Performance

```cypher
PROFILE MATCH (n:Song) RETURN count(n);
```

### View Database Size

```bash
du -sh $NEO4J_HOME/data/databases/neo4j
```

---

## Further Resources

- **Neo4j Documentation:** https://neo4j.com/docs/
- **Cypher Manual:** https://neo4j.com/docs/cypher-manual/current/
- **APOC Documentation:** https://neo4j.com/docs/apoc/current/
- **GDS Documentation:** https://neo4j.com/docs/graph-data-science/current/
- **Community Support:** https://community.neo4j.com/

---

## Support

For issues or questions:
1. Check Neo4j logs: `$NEO4J_HOME/logs/`
2. Review this guide's troubleshooting section
3. Consult official Neo4j documentation
4. Post in Neo4j community forums

---

**Last Updated:** 2026-05-12  
**Thiruppugazh-KG Version:** 1.0

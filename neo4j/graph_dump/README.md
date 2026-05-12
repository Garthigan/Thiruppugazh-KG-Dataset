# Neo4j Graph Dump Directory

This directory stores database backups and exports of the Thiruppugazh Knowledge Graph.

## Contents

- **Backup files:** Full database backups from Neo4j
- **Dump exports:** Graph data in various formats (DUMP, CSV, JSON)
- **Recovery files:** Recovery archives for database restoration

## Creating Backups

### Using Neo4j Admin Tool

```bash
# Create a backup
neo4j-admin dump --database=neo4j --to=/path/to/backup.dump

# Restore from backup
neo4j-admin load --from=/path/to/backup.dump --database=neo4j --force
```

### Using Cypher - Export to CSV

```cypher
// Export nodes
MATCH (n:Song)
RETURN n.song_number, n.song_name, n.abode
INTO CSV FILE 'songs.csv';

// Export relationships
MATCH (s:Song)-[:HAS_THEME]->(t:Theme)
RETURN s.song_number, t.name
INTO CSV FILE 'song_themes.csv';
```

### Using apoc.export

```cypher
CALL apoc.export.json.all("thiruppugazh_export.json", {})
YIELD file, nodes, relationships, properties, time
RETURN file, nodes, relationships, properties, time;
```

## Recovery Procedures

1. **Stop Neo4j server**
2. **Restore from dump:**
   ```bash
   neo4j-admin load --from=backup.dump --database=neo4j --force
   ```
3. **Start Neo4j server**
4. **Verify data integrity:**
   ```cypher
   MATCH (n) RETURN count(n) AS total_nodes;
   ```

## Backup Schedule

Recommended backup frequency:
- **Daily:** After significant changes
- **Weekly:** Regular snapshots
- **After major operations:** After imports or data updates

## File Naming Convention

```
thiruppugazh_backup_YYYY-MM-DD.dump
thiruppugazh_export_YYYY-MM-DD.json
thiruppugazh_csv_export_YYYY-MM-DD/
```

## Storage Location

- Local backups: `.../neo4j/graph_dump/`
- Remote backups: [Configure as needed]
- Archive storage: [Configure as needed]

## Related Documentation

- Backup docs: https://neo4j.com/docs/operations-manual/current/backup-restore/
- APOC export: https://neo4j.com/docs/apoc/current/export/

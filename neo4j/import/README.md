# Neo4j Import Directory

This directory is used for storing files to be imported into Neo4j.

## Setup Instructions

1. **Locate Neo4j Import Directory:**
   - On Linux/Mac: `$NEO4J_HOME/import/`
   - On Windows: `%NEO4J_HOME%\import\`

2. **Copy Dataset Files:**
   - Copy `thiruppugazh_dataset.json` to Neo4j's import directory
   - Ensure proper file permissions (readable by Neo4j process)

3. **Using APOC for JSON Import:**
   ```cypher
   CALL apoc.load.json("file:///thiruppugazh_dataset.json")
   YIELD value
   RETURN value.song_number, value.song_name LIMIT 5;
   ```

## Expected File Format

The dataset should be a JSON array with objects containing:
```json
{
  "song_number": 1,
  "song_name": "Song Name",
  "abode": "Sacred Location",
  "summary": "Song summary",
  "url": "Reference URL",
  "themes": ["theme1", "theme2"],
  "entities": ["Entity1", "Entity2"],
  "myth_events": ["Event1", "Event2"],
  "philosophy": ["Concept1", "Concept2"],
  "imagery": ["Image1", "Image2"]
}
```

## Troubleshooting

- **File not found:** Verify file is in Neo4j's import directory
- **Permission denied:** Check file permissions (chmod 644)
- **JSON parse error:** Validate JSON format using jq or a JSON validator
- **APOC not available:** Install APOC library for Neo4j

## Related Documentation

- Cypher queries: `../cypher_queries/02_data_import.cypher`
- Main dataset: `../../dataset/thiruppugazh_dataset.json`

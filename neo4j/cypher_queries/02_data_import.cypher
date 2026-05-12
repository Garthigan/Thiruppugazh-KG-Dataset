// Load Songs from JSON dataset
CALL apoc.load.json("file:///thiruppugazh_dataset.json")
YIELD value
MERGE (s:Song {song_number:value.song_number})
SET s.song_name = value.song_name,
    s.abode = value.abode,
    s.summary = value.summary,
    s.url = value.url;

// Create LOCATED_AT relationships with Places
CALL apoc.load.json("file:///thiruppugazh_dataset.json")
YIELD value
MATCH (s:Song {song_number:value.song_number})
WITH s, value
WHERE value.abode IS NOT NULL AND trim(value.abode) <> ""
MERGE (p:Place {name:value.abode})
MERGE (s)-[:LOCATED_AT]->(p);

// Create HAS_THEME relationships
CALL apoc.load.json("file:///thiruppugazh_dataset.json")
YIELD value
MATCH (s:Song {song_number:value.song_number})
UNWIND value.themes AS theme
MERGE (t:Theme {name:theme})
MERGE (s)-[:HAS_THEME]->(t);

// Create REFERS_TO_EVENT relationships with Myth Events
CALL apoc.load.json("file:///thiruppugazh_dataset.json")
YIELD value
MATCH (s:Song {song_number:value.song_number})
UNWIND value.myth_events AS event
MERGE (e:MythEvent {name:event})
MERGE (s)-[:REFERS_TO_EVENT]->(e);

// Create MENTIONS_ENTITY relationships
CALL apoc.load.json("file:///thiruppugazh_dataset.json")
YIELD value
MATCH (s:Song {song_number:value.song_number})
UNWIND value.entities AS entity
MERGE (e:Entity {name:entity})
MERGE (s)-[:MENTIONS_ENTITY]->(e);

// Create HAS_PHILOSOPHY relationships
CALL apoc.load.json("file:///thiruppugazh_dataset.json")
YIELD value
MATCH (s:Song {song_number:value.song_number})
UNWIND value.philosophy AS ph
MERGE (p:Philosophy {name:ph})
MERGE (s)-[:HAS_PHILOSOPHY]->(p);

// Create USES_IMAGERY relationships
CALL apoc.load.json("file:///thiruppugazh_dataset.json")
YIELD value
MATCH (s:Song {song_number:value.song_number})
UNWIND value.imagery AS img
MERGE (i:Imagery {name:img})
MERGE (s)-[:USES_IMAGERY]->(i);

// Analysis queries for Thiruppugazh dataset

// Theme analysis - Most frequent themes
MATCH (s:Song)-[:HAS_THEME]->(t:Theme)
RETURN t.name AS theme, count(*) AS frequency
ORDER BY frequency DESC
LIMIT 15;

// Entity analysis - Most mentioned entities
MATCH (s:Song)-[:MENTIONS_ENTITY]->(e:Entity)
RETURN e.name AS entity, count(*) AS frequency
ORDER BY frequency DESC
LIMIT 15;

// Mythological events analysis
MATCH (s:Song)-[:REFERS_TO_EVENT]->(m:MythEvent)
RETURN m.name AS myth_event, count(*) AS frequency
ORDER BY frequency DESC
LIMIT 15;

// Philosophy analysis
MATCH (s:Song)-[:HAS_PHILOSOPHY]->(p:Philosophy)
RETURN p.name AS philosophy, count(*) AS frequency
ORDER BY frequency DESC
LIMIT 15;

// Imagery analysis
MATCH (s:Song)-[:USES_IMAGERY]->(i:Imagery)
RETURN i.name AS imagery, count(*) AS frequency
ORDER BY frequency DESC
LIMIT 15;

// Sacred locations - Temple frequency
MATCH (s:Song)-[:LOCATED_AT]->(p:Place)
RETURN p.name AS temple, count(*) AS song_count
ORDER BY song_count DESC
LIMIT 20;

// Find shared locations across songs
MATCH (p1:Place)<-[:LOCATED_AT]-(s:Song)-[:LOCATED_AT]->(p2:Place)
WHERE p1 <> p2
RETURN p1.name, p2.name, count(s) AS shared_songs
ORDER BY shared_songs DESC
LIMIT 20;

// Murugan-centric analysis
MATCH (s:Song)-[:MENTIONS_ENTITY]->(e:Entity {name:"Murugan"})
RETURN s.song_number, s.song_name;

// All connections for Murugan
MATCH (e:Entity {name:"Murugan"})<-[:MENTIONS_ENTITY]-(s:Song)
MATCH (s)-[r]->(n)
RETURN e,s,r,n
LIMIT 100;

// Songs at specific location with Murugan
MATCH (p:Place)<-[:LOCATED_AT]-(s:Song)-[:MENTIONS_ENTITY]->(e:Entity {name:'Murugan'})
RETURN p, s
LIMIT 200;

// Specific song details (example: song 1183)
MATCH (s:Song {song_number:1183})-[r]->(n)
RETURN s, r, n;

// Comprehensive song view with all annotations
MATCH (s:Song {id: "Song_1183"})
OPTIONAL MATCH (s)-[r1:HAS_THEME]->(t:Theme)
OPTIONAL MATCH (s)-[r2:MENTIONS_ENTITY]->(e:Entity)
OPTIONAL MATCH (s)-[r3:REFERS_TO_EVENT]->(m:MythEvent)
OPTIONAL MATCH (s)-[r4:USES_IMAGERY]->(i:Imagery)
OPTIONAL MATCH (s)-[r5:HAS_PHILOSOPHY]->(p:Philosophy)
OPTIONAL MATCH (s)-[r6:LOCATED_AT]->(l:Place)
RETURN s, t, e, m, i, p, l, r1, r2, r3, r4, r5, r6;

// Find songs related to specific myth events
MATCH (s:Song)-[:REFERS_TO_EVENT]->(m:MythEvent)
WHERE m.name CONTAINS "Suran"
RETURN s;

// Sample data for visualization
MATCH (s:Song)-[:USES_IMAGERY]->(i:Imagery)
RETURN s,i
LIMIT 80;

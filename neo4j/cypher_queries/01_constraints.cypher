// Create unique constraints for all node types
CREATE CONSTRAINT song_number_unique IF NOT EXISTS
FOR (s:Song)
REQUIRE s.song_number IS UNIQUE;

CREATE CONSTRAINT theme_unique IF NOT EXISTS
FOR (t:Theme)
REQUIRE t.name IS UNIQUE;

CREATE CONSTRAINT entity_unique IF NOT EXISTS
FOR (e:Entity)
REQUIRE e.name IS UNIQUE;

CREATE CONSTRAINT event_unique IF NOT EXISTS
FOR (m:MythEvent)
REQUIRE m.name IS UNIQUE;

CREATE CONSTRAINT philosophy_unique IF NOT EXISTS
FOR (p:Philosophy)
REQUIRE p.name IS UNIQUE;

CREATE CONSTRAINT imagery_unique IF NOT EXISTS
FOR (i:Imagery)
REQUIRE i.name IS UNIQUE;

CREATE CONSTRAINT place_unique IF NOT EXISTS
FOR (pl:Place)
REQUIRE pl.name IS UNIQUE;

CREATE DATABASE ai_test;

create role db_user with login password ''; --create password for user
GRANT ALL PRIVILEGES ON DATABASE ai_test TO db_user;

-- \connect ai_test
ALTER SCHEMA public OWNER TO db_user;

CREATE EXTENSION IF NOT EXISTS vector;

use ai_test;

-- Adjust DIM to your embedding dimension (e.g. 1536)
CREATE TABLE IF NOT EXISTS documents (
  id BIGSERIAL PRIMARY KEY,
  title TEXT,
  content TEXT NOT NULL,
  metadata JSONB,
  embedding VECTOR(1536),   -- <--- set DIM here
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Fast approximate nearest-neighbor index (ivfflat). Tune lists for performance/accuracy.
CREATE INDEX IF NOT EXISTS documents_embedding_idx
  ON documents USING ivfflat (embedding) WITH (lists = 100);

-- Optional: allow fast metadata queries
CREATE INDEX IF NOT EXISTS documents_metadata_idx ON documents USING gin (metadata);
-- ...existing code...
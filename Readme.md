# GraphRAG Demo with PostgreSQL

This repository demonstrates Graph Retrieval-Augmented Generation (GraphRAG) using a PostgreSQL database as the backend for storing and querying knowledge graphs.

## Project Structure

- `ai_test-db/` — Main project folder containing all database setup, Docker, SQL, and Python code for ingesting documents, extracting entities/relationships, and building/querying the graph.
- `graph_images/` — Visual images and exports of the graph database, useful for presentations and documentation.

## Key Features
- End-to-end pipeline for document ingestion, entity/relation extraction, and graph construction.
- Uses PostgreSQL (with pgvector and Apache AGE) for graph and vector storage.
- Includes Jupyter notebooks and Python scripts for experimentation and visualization.
- Ready-to-use Docker setup for local development.

See `ai_test-db/README.md` for detailed setup and usage instructions.

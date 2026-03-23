# ai_test Database Project

## Overview
This project is designed to set up and manage a PostgreSQL database named "ai_test". It includes SQL scripts for initialization, schema definition, functions, and seeding data, as well as Docker configurations for containerization.

## Project Structure
```
ai_test-db/
├── sql/
│   ├── init.sql
│   ├── schema.sql
│   ├── functions.sql
│   ├── index_tables.sql
│   └── seeds/
│       └── seed_data.sql
├── migrations/
│   └── 001_create_tables.sql
├── docker/
│   ├── Dockerfile
│   └── Dockerfile_index
├── docker-compose.yml
├── .env.example
├── .gitignore
├── requirements.txt
├── Makefile
└── README.md
```

## Setup Instructions

1. **Clone the Repository**
   Clone this repository to your local machine using:
   ```
   git clone <repository-url>
   ```

2. **Environment Variables**
   Copy the `.env.example` file to `.env` and update the variables with your database credentials.

3. **Docker Setup (with pgvector)**
   This project uses a Docker image with the `pgvector` extension pre-installed. To start a fresh database:
   ```powershell
   docker run -d \
     --name ai_test_db \
     -e POSTGRES_USER=postgres \
     -e POSTGRES_PASSWORD=postgrespass \
     -e POSTGRES_DB=ai_test \
     -p 5432:5432 \
     -v %cd%\sql:/docker-entrypoint-initdb.d:ro \
     ankane/pgvector:15-alpine
   ```
   Or use the provided `docker-compose.yml`:
   ```powershell
   docker-compose up -d
   ```
   This will initialize the database and run all SQL scripts in `sql/` on first launch.

4. **Database Initialization**
   The SQL scripts in `sql/` will be executed automatically on first container startup. If you need to re-run them, remove the Docker volume and restart the container.

5. **Run Migrations and Seed Data**
   You can manually apply migrations or seed data using psql:
   ```powershell
   psql -h localhost -U postgres -d ai_test -f migrations/001_create_tables.sql
   psql -h localhost -U postgres -d ai_test -f sql/seeds/seed_data.sql
   ```

## Python Environment & Requirements

Install dependencies in a virtual environment:
```powershell
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
```

## Example: Connect to Postgres from Python

```python
import psycopg2
conn = psycopg2.connect(
    host="localhost",
    port=5432,
    dbname="ai_test",
    user="postgres",
    password="postgrespass"
)
cur = conn.cursor()
cur.execute("SELECT version();")
print(cur.fetchone())
cur.close()
conn.close()
```

## Python Graph RAG Example

This project includes Python code for testing Graph Retrieval-Augmented Generation (RAG) using PostgreSQL. The main notebook and scripts are in `python/graph rag/`.

### Key files:
- `python/graph rag/full_bot.ipynb` — End-to-end notebook for document ingestion, entity/relation extraction, graph building, and querying.
- `python/graph rag/graphrag.ipynb` — Additional graph RAG experiments.
- `python/graph rag/visuals/graph_visual.py` — Visualization helpers.

### Quickstart: Run the Notebook
1. Activate your environment and install requirements:
   ```powershell
   python -m venv .venv
   .venv\Scripts\activate
   pip install -r requirements.txt
   ```
2. Start Jupyter:
   ```powershell
   jupyter notebook
   ```
3. Open `python/graph rag/full_bot.ipynb` and follow the steps:
   - Configure your environment variables (OpenAI/Azure keys, Postgres connection)
   - Run the cells to ingest documents, extract graphs, and visualize/query the knowledge graph

### Minimal Python Postgres Test
You can test your Postgres connection with:
```python
import psycopg2
conn = psycopg2.connect(
    host="localhost",
    port=5432,
    dbname="ai_test",
    user="postgres",
    password="postgrespass"
)
cur = conn.cursor()
cur.execute("SELECT version();")
print(cur.fetchone())
cur.close()
conn.close()
```

For more, see the notebook and scripts in `python/graph rag/`.

## .gitignore

This project ignores sensitive and local files:
- `.env` (but keeps `.env.example`)
- `notes.txt`
- Python, Jupyter, Docker, and OS-specific files

See `.gitignore` for details.

After setting up the database, you can use the defined functions and access the data as needed. Refer to the individual SQL files for more details on the schema and available functions.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
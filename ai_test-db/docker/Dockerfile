FROM postgres:15

# Install build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    postgresql-server-dev-15 \
    flex \
    bison \
    && rm -rf /var/lib/apt/lists/*

# Install PGVector
RUN git clone https://github.com/pgvector/pgvector.git /tmp/pgvector \
    && cd /tmp/pgvector \
    && make install \
    && rm -rf /tmp/pgvector

# Install Apache AGE, this is for Graph
RUN git clone https://github.com/apache/age.git /tmp/age \
    && cd /tmp/age \
    && git checkout PG15 \
    && make PG_CONFIG=/usr/lib/postgresql/15/bin/pg_config install \
    && rm -rf /tmp/age

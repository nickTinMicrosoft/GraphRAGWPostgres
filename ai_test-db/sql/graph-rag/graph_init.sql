CREATE EXTENSION IF NOT EXISTS AGE CASCADE;
-- CREATE EXTENSION IF NOT EXISTS pgvector;


-- LOAD 'age';
LOAD 'age';
SET search_path = ag_catalog, "$user",public;

-- create graph table
SELECT create_graph('bobs_burgers');

--drop schema to restart
-- Drop the graph (if it exists)
-- SELECT drop_graph('bobs_burgers', true);


-- Add nodes (characters)
SELECT * FROM cypher('bobs_burgers', $$
    CREATE
    (bob:Person {name: 'Bob'}),
    (linda:Person {name: 'Linda'}),
    (tina:Person {name: 'Tina'}),
    (gene:Person {name: 'Gene'}),
    (louise:Person {name: 'Louise'})
$$) AS (n agtype);

-- Add relationships (family)
SELECT * FROM cypher('bobs_burgers', $$
    MATCH 
        (bob:Person {name:'Bob'}),
        (linda:Person {name:'Linda'}),
        (tina:Person {name:'Tina'}),
        (gene:Person {name:'Gene'}),
        (louise:Person {name:'Louise'})
    CREATE
        (bob)-[:MARRIED_TO]->(linda),
        (linda)-[:MARRIED_TO]->(bob),
        (bob)-[:PARENT_OF]->(tina),
        (linda)-[:PARENT_OF]->(tina),
        (bob)-[:PARENT_OF]->(gene),
        (linda)-[:PARENT_OF]->(gene),
        (bob)-[:PARENT_OF]->(louise),
        (linda)-[:PARENT_OF]->(louise)
$$) AS (r agtype);

-- Query relationships
SELECT * FROM cypher('bobs_burgers', $$
    MATCH (p:Person)-[r]->(q:Person)
    RETURN p.name AS from_node, type(r) AS relation, q.name AS to_node
$$) AS t(from_node agtype, relation agtype, to_node agtype);



CREATE EXTENSION IF NOT EXISTS age;
LOAD 'age';
SET search_path = ag_catalog, "$user", public;



SELECT * FROM ag_catalog.ag_graph;


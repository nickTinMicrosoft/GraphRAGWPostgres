import psycopg2
import networkx as nx
import matplotlib.pyplot as plt

# Connect to PostgreSQL with AGE
conn = psycopg2.connect("host=localhost dbname=mygraphdb user=postgres password=postgres")
cur = conn.cursor()

# Load the AGE extension and set search path
cur.execute("LOAD 'age';")
cur.execute("SET search_path = ag_catalog, \"$user\", public;")
conn.commit()

# Get relationships
cur.execute("""
SELECT * FROM cypher('bobs_burgers', $$
    MATCH (p:Person)-[r]->(q:Person)
    RETURN p.name AS from_node, type(r) AS relation, q.name AS to_node
$$) AS t(from_node agtype, relation agtype, to_node agtype);
""")
edges = cur.fetchall()

# Create graph
G = nx.DiGraph()
for from_node, relation, to_node in edges:
    G.add_edge(from_node, to_node, label=relation)

# Draw graph
pos = nx.spring_layout(G)
nx.draw(G, pos, with_labels=True, node_color='lightblue', node_size=2000, font_size=12)
edge_labels = nx.get_edge_attributes(G, 'label')
nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)
plt.show()

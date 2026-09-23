vertices = int(input("Enter number of vertices: "))
edges = int(input("Enter number of edges: "))

adj_list = {i: [] for i in range(vertices)}

print("\nEnter edges (source destination) zero-indexed (e.g. 0 1):")
for _ in range(edges):
    u, v = map(int, input().split())
    adj_list[u].append(v)
    adj_list[v].append(u)

print("\n--- Adjacency List ---")
for vertex, neighbors in adj_list.items():
    print(f"Vertex {vertex}: {neighbors}")

print("\n--- Graph Edges ---")
printed_edges = set()
for u in adj_list:
    for v in adj_list[u]:
        if (v, u) not in printed_edges:
            print(f"Edge ({u}, {v})")
            printed_edges.add((u, v))

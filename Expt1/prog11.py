vertices = int(input("Enter number of vertices: "))
edges = int(input("Enter number of edges: "))

adj_matrix = [[0] * vertices for _ in range(vertices)]

print("\nEnter edges (source destination) zero-indexed (e.g. 0 1):")
for _ in range(edges):
    u, v = map(int, input().split())
    adj_matrix[u][v] = 1
    adj_matrix[v][u] = 1

print("\n--- Adjacency Matrix ---")
for row in adj_matrix:
    print(" ".join(map(str, row)))

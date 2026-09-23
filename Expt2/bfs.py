from collections import deque


def bfs(adj):
    V = len(adj)
    visited = [False] * V
    q = deque()
    src = 0
    result = []
    visited[src] = True
    q.append(src)
    while q:
        u = q.popleft()
        result.append(u)
        for v in adj[u]:
            if visited[v] == False:
                visited[v] = True
                q.append(v)
    return result


def distance_adj_list(adj, source, destination):
    V = len(adj)
    visited = [False] * V
    dist = [-1] * V
    q = deque()
    visited[source] = True
    dist[source] = 0
    q.append(source)
    while q:
        u = q.popleft()
        if u == destination:
            return dist[u]
        for v in adj[u]:
            if not visited[v]:
                visited[v] = True
                dist[v] = dist[u] + 1
                q.append(v)
    return -1


def distance(adj_matrix, source, destination):
    V = len(adj_matrix)
    visited = [False] * V
    dist = [-1] * V
    q = deque()
    visited[source] = True
    dist[source] = 0
    q.append(source)
    while q:
        u = q.popleft()
        if u == destination:
            return dist[u]
        for v in range(V):
            if adj_matrix[u][v] == 1 and not visited[v]:
                visited[v] = True
                dist[v] = dist[u] + 1
                q.append(v)
    return -1


adj = {
    0: [1, 2],
    1: [0, 3, 4],
    2: [0, 5],
    3: [1],
    4: [1, 5],
    5: [2, 4]
}

adj_matrix = [
    [0, 1, 1, 0, 0, 0],
    [1, 0, 0, 1, 1, 0],
    [1, 0, 0, 0, 0, 1],
    [0, 1, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 1],
    [0, 0, 1, 0, 1, 0]
]

Traversal = bfs(adj)
print("BFS Traversal:", Traversal)

print("\nFinding Distance in Adjacency List: ")
src = int(input("Enter the Source Node: "))
dest = int(input("Enter the Destination Node: "))
print("Distance:", distance_adj_list(adj, src, dest))

print("\nFinding Distance in Adjacency Matrix: ")
src = int(input("Enter the Source Node: "))
dest = int(input("Enter the Destination Node: "))
print("Distance:", distance(adj_matrix, src, dest))
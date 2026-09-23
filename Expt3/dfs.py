from collections import deque


def dfs(adj, start):
    visited = set()
    stk = [start]
    result = []
    while stk:
        u = stk.pop()
        if u not in visited:
            visited.add(u)
            result.append(u)
            neigh = adj.get(u, [])
            size = len(neigh)
            for i in range(size - 1, -1, -1):
                v = neigh[i]
                if v not in visited:
                    stk.append(v)
    return result


def distance(adj, src, dst):
    if src not in adj or dst not in adj:
        return -1
    if src == dst:
        return 0
    q = deque([src])
    dist = {src: 0}
    while q:
        u = q.popleft()
        for v in adj.get(u, []):
            if v not in dist:
                dist[v] = dist[u] + 1
                if v == dst:
                    return dist[v]
                q.append(v)
    return -1


def has_path(adj, src, dst):
    if src not in adj or dst not in adj:
        return False
    reachable_nodes = dfs(adj, src)
    return dst in reachable_nodes


disjoint_adj = {
    0: [1, 2],
    1: [0],
    2: [0],
    3: [4, 5],
    4: [3, 6],
    5: [3],
    6: [4]
}

adj = {
    0: [1, 2],
    1: [0, 3, 4],
    2: [0, 5],
    3: [1],
    4: [1, 5],
    5: [2, 4]
}

traversal = dfs(adj, 0)
print(traversal)
print()

traversal_1 = dfs(disjoint_adj, 0)
print(traversal_1)

traversal_2 = dfs(disjoint_adj, 3)
print(traversal_2)

print("\nCheck Path Between Two Vertices")
u = int(input("Enter starting vertex: "))
v = int(input("Enter destination vertex: "))
if has_path(disjoint_adj, u, v):
    print(f"Result: TRUE. There is a path between {u} and {v}.")
else:
    print(f"Result: FALSE. No connection exists between {u} and {v}.")

print("\nCount Number of Vertices connected to other Vertices (Direct & Indirect)")

def count(adj, src=None):
    for u in sorted(adj.keys()):
        reachable = set(dfs(adj, u))
        reachable.discard(u)
        print(f"For Vertex {u}: {len(reachable)} vertices are connected -> {sorted(reachable)}\n")

count(adj, 0)

print("\nDistance Between 2 Vertices: ")
print("dist 0->5:", distance(adj, 0, 5))
print("dist 2->5:", distance(adj, 2, 5))
print("\n")

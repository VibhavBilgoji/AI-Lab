from heapq import heappop, heappush


def a_star(h, adj_list, S, G):
    OPEN = [(h[S], S)]
    CLOSED = []
    closed_set = set()
    g = {S: 0}
    prev = {}
    step = 0

    def open_view():
        best = {}
        for f, n in OPEN:
            if n not in closed_set and (n not in best or f < best[n]):
                best[n] = f
        return sorted(best.items(), key=lambda x: (x[1], x[0]))

    print(f"{'Step':<6}{'OPEN':<55}CLOSED")
    print("-" * 110)
    print(f"{'Init':<6}{str(open_view()):<55}{CLOSED}")

    while OPEN:
        f, q = heappop(OPEN)
        if q in closed_set:
            continue
        step += 1
        CLOSED.insert(0, (q, f))
        closed_set.add(q)

        if q == G:
            print(f"{step:<6}{str(open_view()):<55}{CLOSED}")
            return reconstruct_path(S, G, prev), g[G]

        for s, s_cost in adj_list[q]:
            new_g = g[q] + s_cost
            if s not in g or new_g < g[s]:
                g[s] = new_g
                prev[s] = q
                heappush(OPEN, (new_g + h[s], s))
                if s in closed_set:
                    closed_set.discard(s)
                    CLOSED[:] = [c for c in CLOSED if c[0] != s]

        print(f"{step:<6}{str(open_view()):<55}{CLOSED}")

    return None, float('inf')


def reconstruct_path(S, G, prev):
    path = [G]
    while path[-1] != S:
        path.append(prev[path[-1]])
    path.reverse()
    return path


edges = [
    (0, 1, 2), (0, 2, 5),
    (1, 3, 4), (1, 4, 3),
    (2, 3, 1),
    (3, 5, 6),
    (4, 5, 2),
    (5, 6, 3),
]

n = 7
adj_list = {i: [] for i in range(n)}
for u, v, w in edges:
    adj_list[u].append((v, w))
    adj_list[v].append((u, w))

h = [8, 6, 8, 7, 4, 3, 0]
S, G = 0, 6

path, cost = a_star(h, adj_list, S, G)
print()
print("Path:", path)
print("Cost:", cost)
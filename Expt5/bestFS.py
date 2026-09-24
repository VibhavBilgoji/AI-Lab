from heapq import heappop, heappush


def bestFS(graph, heuristics, S, G):
    open = []
    closed = set()
    parent = {}

    heappush(open, (heuristics[S], S))
    while open:
        _, n = heappop(open)
        if n == G:
            return get_path(parent, S, G)

        closed.add(n)
        for s in graph[n]:
            if s not in open and s not in closed:
                parent[s] = n
                heappush(open, (heuristics[s], s))

def get_path(parent, S, G):
   path = [G]
   while path[-1] != S:
       path.append(parent[path[-1]])

   return reversed(path)

def main():
    graph = {
        'S': ['A', 'B', 'C'], 'A': ['D'], 'B': ['E'], 'C': ['F'],
        'D': ['E', 'G'], 'E': [], 'F': ['H'], 'H': ['G'], 'G': []
    }

    heuristics = {
        'S': 12, 'A': 8, 'B': 4, 'C': 9, 'D': 3, 'E': 1, 'F': 6, 'H': 2, 'G': 0
    }

    path = bestFS(graph, heuristics, 'S', 'G')
    if path == None:
        return print("No path found")

    for node in path:
        print(node, end=' -> ')
    return print("\b\b\b   ")

if __name__ == '__main__':
    main()
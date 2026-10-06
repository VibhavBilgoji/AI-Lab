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
        'S': ['A', 'B', 'C'],
        'A': ['D', 'E'],
        'B': ['F'],
        'C': ['G', 'H'],
        'D': ['I'],
        'E': ['I', 'J'],
        'F': ['J'],
        'G': ['K'],
        'H': ['K', 'L'],
        'I': ['M'],
        'J': ['M', 'N'],
        'K': ['N'],
        'L': ['N'],
        'M': ['GOAL'],
        'N': ['GOAL'],
        'GOAL': []
    }

    heuristics = {
        'S': 14, 'A': 10, 'B': 11, 'C': 9,
        'D': 8, 'E': 6, 'F': 9, 'G': 7,
        'H': 5, 'I': 7, 'J': 4, 'K': 4,
        'L': 3, 'M': 2, 'N': 1, 'GOAL': 0
    }

    path = bestFS(graph, heuristics, 'S', 'GOAL')
    if path == None:
        return print("No path found")

    print("Path found:")
    for node in path:
        print(node, end=' -> ')
    return print("\b\b\b   ")

if __name__ == '__main__':
    main()
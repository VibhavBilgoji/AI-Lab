def evaluate(state, heuristics):
    return heuristics[state]

def simpleHillClimbing(graph, heuristics, S):
    current = S
    current_value = evaluate(current, heuristics)
    path = [current]

    while True:
        neighbours = graph[current]
        moved = False

        for i in range(len(neighbours)):
            s = neighbours[i]
            neighbour_value = evaluate(s, heuristics)

            if neighbour_value < current_value:
                current = s
                current_value = neighbour_value
                path.append(current)
                moved = True
                break

        if not moved:
            return path

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
        'D': 8, 'E': 9, 'F': 9, 'G': 7,
        'H': 8, 'I': 7, 'J': 10, 'K': 4,
        'L': 9, 'M': 9, 'N': 1, 'GOAL': 0
    }

    path = simpleHillClimbing(graph, heuristics, 'S')

    for node in path:
        print(node, end=' -> ')
    print("\b\b\b   ")
    return print(f"Stopped at local optimum: {path[-1]}")

if __name__ == '__main__':
    main()
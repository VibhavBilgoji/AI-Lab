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
        'S': ['A', 'B', 'C'], 'A': ['D'], 'B': ['E'], 'C': ['F'],
        'D': ['E', 'G'], 'E': [], 'F': ['H'], 'H': ['G'], 'G': []
    }

    heuristics = {
        'S': 12, 'A': 8, 'B': 4, 'C': 9, 'D': 3, 'E': 1, 'F': 6, 'H': 2, 'G': 0
    }

    path = simpleHillClimbing(graph, heuristics, 'S')

    for node in path:
        print(node, end=' -> ')
    print("\b\b\b   ")
    return print(f"Stopped at local optimum: {path[-1]}")

if __name__ == '__main__':
    main()
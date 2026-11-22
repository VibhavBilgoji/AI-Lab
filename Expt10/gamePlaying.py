initial = (4, 2, 1,
           5, 0, 3,
           8, 7, 6)

goal = (4, 2, 1,
        5, 3, 6,
        8, 0, 7)


def heuristic(state):
    count = 0
    for i in range(9):
        if state[i] != 0 and state[i] != goal[i]:
            count += 1
    return count


def print_board(state):
    for i in range(0, 9, 3):
        print(state[i:i+3])


def getneighbour(state):
    neighbour = []
    blank = state.index(0)
    row = blank // 3
    col = blank % 3

    moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    for dr, dc in moves:
        r = row + dr
        c = col + dc
        if 0 <= r < 3 and 0 <= c < 3:
            pos = r * 3 + c
            newstate = list(state)
            newstate[blank], newstate[pos] = newstate[pos], newstate[blank]
            neighbour.append(tuple(newstate))
    return neighbour


def hillclimbing(initial):
    current = initial
    step = 0
    while True:
        print("Step", step)
        print_board(current)
        print("Heuristic:", heuristic(current))
        print()

        if current == goal:
            print("Goal reached!")
            return

        neighbours = getneighbour(current)
        best = current
        besth = heuristic(current)

        for n in neighbours:
            h = heuristic(n)
            if h < besth:
                best = n
                besth = h

        if best == current:
            print("Stuck at local minimum!")
            return

        current = best
        step += 1


hillclimbing(initial)

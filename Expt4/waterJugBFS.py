from collections import deque


def water_jug_bfs(m: int, n: int, d: int):
    if d > max(m, n):
        return -1

    q: deque[tuple[int, int, int]] = deque()
    q.append((0,0,0))

    visited: list[list[bool]] = [[False] * (n+1) for _ in range(m+1)]
    prev: dict[tuple[int, int, int], tuple[int, int, int]]= {}
    visited[0][0] = True

    while len(q) != 0:
        jug1, jug2, count = q.popleft()

        if jug1 == d or jug2 == d:
            return ((jug1, jug2, count), prev)

        #Case 1: fill jug 1
        if jug1 != m and visited[m][jug2] == False:
            visited[m][jug2] = True
            prev[(m, jug2, count+1)] = (jug1, jug2, count)
            q.append((m, jug2, count+1))

        #Case 2: fill jug 2
        if jug2 != n and visited[jug1][n] == False:
            visited[jug1][n] = True
            prev[(jug1, n, count+1)] = (jug1, jug2, count)
            q.append((jug1, n, count+1))

        #Case 3: empty jug 1
        if jug1 != 0 and visited[0][jug2] == False:
            visited[0][jug2] = True
            prev[(0, jug2, count+1)] = (jug1, jug2, count)
            q.append((0, jug2, count+1))

        #Case 4: empty jug 2
        if jug2 != 0 and visited[jug1][0] == False :
            visited[jug1][0] = True
            prev[(jug1, 0, count+1)] = (jug1, jug2, count)
            q.append((jug1, 0, count+1))

        #Case 5: tranfer from jug 1 to jug 2
        if jug2 != n:
            t = n - jug2
            to_fill = min(t, jug1)
            x, y = jug1 - to_fill, jug2 + to_fill
            if visited[x][y] == False:
                visited[x][y] = True
                prev[(x, y, count+1)] = (jug1, jug2, count)
                q.append((x, y, count+1))

        #Case 6: transfer from jug 2 to jug 1
        if jug1 != m:
            t = m - jug1
            to_fill = min(t, jug2)
            x, y = jug1 + to_fill, jug2 - to_fill
            if visited[x][y] == False:
                visited[x][y] = True
                prev[(x, y, count+1)] = (jug1, jug2, count)
                q.append((x, y, count+1))

    return -1

def construct_path(m: int, n: int, d: int):
    res = water_jug_bfs(m, n, d)
    if res == -1:
        return print("Scenario not possible")

    state, prev = res
    level = state[2]
    path: list[str] = []
    path.append(f"({state[0]}, {state[1]})")

    while state != (0,0,0):
        prev_state = prev[state]
        path.append(f"({prev_state[0]}, {prev_state[1]})")
        state = prev_state

    path.reverse()
    print("\nPath: " + ' -> '.join(path))
    print(f"Level: {level}")


m = int(input("Enter m: "))
n = int(input("Enter n: "))
d = int(input("Enter d: "))
construct_path(m, n, d)
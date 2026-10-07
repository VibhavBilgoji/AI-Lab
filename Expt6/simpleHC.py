import math
import random


def objective(state):
    x, y = state
    return -0.5 * (x ** 2 + y ** 2) + 8 * math.cos(x) * math.cos(y)
    # return -(x - 3) ** 2 - (y + 1) ** 2

def neighbors(state, step=1):
    x, y = state
    return [(x + dx, y + dy)
            for dx in (-step, 0, step)
            for dy in (-step, 0, step)
            if (dx, dy) != (0, 0)]

def simple_hill_climbing(objective, neighbors, start):
    current, current_val = start, objective(start)
    path = [(current, current_val)]
    while True:
        for n in neighbors(current):
            n_val = objective(n)
            if n_val > current_val:
                current, current_val = n, n_val
                path.append((current, current_val))
                break
        else:
            return path

start = (random.randint(-10, 10), random.randint(-10, 10))
path = simple_hill_climbing(objective, neighbors, start)

print("Sequence of states:")
for i, (state, val) in enumerate(path):
    print(f"Step {i}: state = {state}, value = {val:.4f}")
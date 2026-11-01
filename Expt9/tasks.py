#1. Create a graph with 5 nodes, give edges some cost, every edge will have some cost. one source node, one destination node. Given a node, find the neighbour of the first node

adj_list = {
    'A': (('B', 5), ('D', 2)),
    'B': (('C', 3), ('D', 3), ('A', 5)),
    'C': (('G', 3), ('B', 3)),
    'D': (('B', 3), ('G', 5), ('A', 2)),
    'G': (('C', 3), ('D', 5))
}

for node, neighbours in adj_list:
    print(node)
    for s in neighbours:
        print(s[0], end=', ')
    print("\b\b\n\n")

neighbours_a = adj_list['A']
for s in neighbours_a:
    print(s[0], end=', ')
print("\b\b\n\n")

neighbours_g = adj_list['G']
for s in neighbours_g:
    print(s[0], end=', ')
print("\b\b\n\n")

path = []
open = ['A']
while len(open) != 0:
    node = open[0]
    n = adj_list[node]
    for s in n:

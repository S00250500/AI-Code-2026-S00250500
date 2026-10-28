import inspect

from searchProblem import Arc, Search_problem_from_explicit_graph
from searchGeneric import Searcher

nodes = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'X'}

# Edge costs are copied from the worksheet.
# Searcher is depth-first by default. Its frontier is a stack, so the last
# successor added is explored first. With this arc order it explores C before B,
# then X before D, reaching G by A -> C -> X -> G.
arcs = [
    Arc('A', 'B', 2),
    Arc('A', 'C', 1),
    Arc('B', 'E', 4),
    Arc('B', 'F', 4),
    Arc('E', 'A', 6),  # Back edge creates the loop E -> A.
    Arc('F', 'G', 1),
    Arc('C', 'D', 6),
    Arc('C', 'X', 4),
    Arc('D', 'G', 4),
    Arc('X', 'G', 5),
]

# AIPython releases differ: newer versions take a graph name as the first
# argument, while some earlier course releases do not.
parameters = list(inspect.signature(Search_problem_from_explicit_graph).parameters)
if parameters and parameters[0] in {'name', 'title'}:
    problem = Search_problem_from_explicit_graph(
        'Week 5 Poole Graph', nodes, arcs, start='A', goals={'G'}
    )
else:
    problem = Search_problem_from_explicit_graph(
        nodes, arcs, start='A', goals={'G'}
    )


def main():
    searcher = Searcher(problem)  # Searcher performs depth-first search by default.
    solution = searcher.search()

    if solution is None:
        print('No path to G was found.')
        return

    # Path.nodes() yields the nodes from goal back toward the start in AIPython.
    path_nodes = list(solution.nodes())
    path_nodes.reverse()

    print('Depth-first search solution:')
    print(' -> '.join(str(node) for node in path_nodes))
    print('Path cost:', solution.cost)


if __name__ == '__main__':
    main()

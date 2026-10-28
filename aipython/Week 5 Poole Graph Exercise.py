import inspect

from searchProblem import Arc, Search_problem_from_explicit_graph
from searchGeneric import Searcher


nodes = {'A', 'B', 'C', 'D', 'E', 'f', 'G', 'X'}

arcs = [
    # Put A -> C first so DFS explores this branch first.
    Arc('A', 'C', 1),
    Arc('A', 'B', 2),

    # B's branch
    Arc('B', 'E', 4),
    Arc('B', 'f', 4),
    Arc('E', 'A', 6),  # The cycle from E back to A
    Arc('f', 'G', 1),

    # C's branch
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

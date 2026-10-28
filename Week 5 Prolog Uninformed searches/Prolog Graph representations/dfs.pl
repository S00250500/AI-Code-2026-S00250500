% Prolog atoms use lowercase letters: a represents node A, etc.
% Edges are written in the order shown in the worksheet (left to right).

% solve(Start, Solution): Solution is a path in reverse order.
solve(Start, Solution) :-
    depthfirst([], Start, Solution).

depthfirst(Path, Node, [Node|Path]) :-
    goal(Node).

depthfirst(Path, Node, Solution) :-
    s(Node, NextNode),
    \+ member(NextNode, Path),
    depthfirst([Node|Path], NextNode, Solution).

% Depth-limited search.
% depthfirst2(Start, Solution, MaximumDepth).
% The returned path is in forward order.
depthfirst2(Node, [Node], _) :-
    goal(Node).

depthfirst2(Node, [Node|Solution], MaxDepth) :-
    MaxDepth > 0,
    s(Node, NextNode),
    NextDepth is MaxDepth - 1,
    depthfirst2(NextNode, Solution, NextDepth).

% Goal node.
goal(g).

% Directed links in the worksheet graph.
s(a, b).
s(a, c).
s(b, e).
s(b, f).
s(e, g).
s(f, g).
s(c, d).
s(c, g).

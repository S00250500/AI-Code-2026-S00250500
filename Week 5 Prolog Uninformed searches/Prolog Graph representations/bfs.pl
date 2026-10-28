% Solution paths are returned in reverse order: [Goal, ..., Start].

solve(Start, Solution) :-
    breadthfirst([[Start]], Solution).

breadthfirst([[Node|Path]|_], [Node|Path]) :-
    goal(Node).

breadthfirst([Path|Paths], Solution) :-
    extend(Path, NewPaths),
    append(Paths, NewPaths, UpdatedPaths),
    breadthfirst(UpdatedPaths, Solution).

% Extend a path by one successor. A path with no successors gives [].
extend([Node|Path], NewPaths) :-
    bagof([NextNode, Node|Path],
          (s(Node, NextNode), \+ member(NextNode, [Node|Path])),
          NewPaths),
    !.
extend(_, []).

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

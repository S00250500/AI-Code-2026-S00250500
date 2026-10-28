% square(Row, Column, Content).
% e means empty; x and o represent the two marks.

square(1, 1, e).
square(1, 2, e).
square(1, 3, e).

square(2, 1, e).
square(2, 2, x).
square(2, 3, e).

square(3, 1, e).
square(3, 2, e).
square(3, 3, e).

% adjacent([Row, Column, Content], Squares)
% Return the existing squares directly above, left, right, and below
% the supplied square. Diagonal squares are not included.
adjacent([Row, Column, Content], Squares) :-
    square(Row, Column, Content),
    findall([NextRow, NextColumn, NeighbourContent],
            (neighbour(Row, Column, NextRow, NextColumn),
             square(NextRow, NextColumn, NeighbourContent)),
            Squares).

% The order of these rules above, left, right, below.
neighbour(Row, Column, NextRow, Column) :-
    NextRow is Row - 1,
    NextRow >= 1.

neighbour(Row, Column, Row, NextColumn) :-
    NextColumn is Column - 1,
    NextColumn >= 1.

neighbour(Row, Column, Row, NextColumn) :-
    NextColumn is Column + 1,
    NextColumn =< 3.

neighbour(Row, Column, NextRow, Column) :-
    NextRow is Row + 1,
    NextRow =< 3.

% Example queries:
% ?- adjacent([2, 2, x], Squares).
% ?- adjacent([1, 1, e], Squares).
% ?- adjacent([3, 3, e], Squares).

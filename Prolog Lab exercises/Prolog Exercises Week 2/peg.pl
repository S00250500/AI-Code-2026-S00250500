% Peg facts: peg(PegName, Shape)
peg(p2, square).
peg(p1, round).

%Hole facts: hole(HoleName, Shape)
hole(h1, round).
hole(h2, square).
hole(h3, round).

%Rule: find a peg that fits a hole if both have the same shape.
fits(Peg, Hole) :-
    peg(Peg, Shape),
    hole(Hole, Shape).

% Example queries:
% Which pegs fit into which holes?
% ?- fits(Peg, Hole).
%
% Which round pegs fit into round holes?
% ?- peg(Peg, round), hole(Hole, round), fits(Peg, Hole). 
% arc(FromNode, ToNode, Cost).
% The cost is attached to the directed edge, not the node.

arc(a, b, 2).
arc(a, c, 2).
arc(b, e, 4).
arc(b, f, 7).
arc(e, g, 5).
arc(f, g, 5).
arc(c, d, 2).
arc(c, g, 4).

% Example query:
% ?- arc(a, NextNode, Cost).
% It will find b with cost 2, then c with cost 2.

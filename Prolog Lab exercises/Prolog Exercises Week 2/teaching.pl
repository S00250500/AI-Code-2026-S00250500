% Lecturer facts.
lecturer(paul).
lecturer(viv).
lecturer(francis).

% Module facts.
module(ai).
module(csharp101).
module(maths101).

% Teaches facts: teaches(Lecturer, Module).
teaches(paul, ai).
teaches(viv, csharp101).
teaches(francis, maths101).

% Student facts: in(Student, Group).
in(ursula, bsc4).
in(fred, bsc4).
in(mary, bsc1).

% Rules describing which modules each group takes.
takes(Student, ai) :- 
    in(Student, bsc4).

takes(Student, software_engineering) :- 
    in(Student, bsc4).

takes(Student, csharp101) :- 
    in(Student, bsc1).

% Example queries:
% ?- takes(Student, ai).
% ?- takes(Student, software_engineering).
% ?- takes(Student, csharp101).
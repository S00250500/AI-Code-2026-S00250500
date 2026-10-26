% parent(Parent, Child).
% male(Person).
% female(Person).

% Gender facts.
female(pam).
male(tom).
male(bob).
female(liz).
female(anne).
male(pat).
male(jim).

% Parent relationships shown by the arrows in the graph.
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, anne).
parent(bob, pat).
parent(pat, jim).

% Rule 1: two different people are siblings if they share a parent.
sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.

% Rule 2: someone is a sister of another person if she is female and the two people are siblings.
sister(Sister, Sibling) :-
    sibling(Sister, Sibling),
    female(Sister).

% Rule 3: an aunt is a female sibling of one of the childs parents.
aunt(Aunt, Child) :-
    sister(Aunt, Parent),
    parent(Parent, Child).

% Example queries:
% ?- sibling(anne, pat).
% ?- sister(liz, bob).
% ?- aunt(liz, anne).
% ?- aunt(Aunt, Child).

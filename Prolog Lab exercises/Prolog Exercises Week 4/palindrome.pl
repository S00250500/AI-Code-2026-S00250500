% A palindrome reads the same forwards and backwards.

% Base case 1: an empty list is a palindrome.
palindrome([]).

% Base case 2: a list with one item is a palindrome.
palindrome([_]).

% Recursive case: remove the first and last items,
% check that they match, then check the middle list.
palindrome(List) :-
    append([First|Middle], [Last], List),
    First = Last,
    palindrome(Middle).

% Example queries
% ?- palindrome([c,i,v,i,c]).
% ?- palindrome([p,r,o,l,o,g]).
% ?- palindrome([r,a,d,a,r]).
% ?- palindrome([a,b,c]).
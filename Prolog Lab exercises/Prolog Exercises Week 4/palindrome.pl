% A palindrome reads the same forwards and backwards.

% Base case 1: an empty list is a palindrome.
palindrome([]).

% Base case 2: a list with one item is a palindrome.
palindrome([_]).

% Recursive case: the first and last items must match,
% and the items between them must also form a palindrome.
palindrome(List) :-
    List = [First|_],
    append(Middle, [Last], List),
    First = Last,
    palindrome(Middle).


% Example queries
% ?- palindrome([c,i,v,i,c]).
% ?- palindrome([p,r,o,l,o,g]).
% ?- palindrome([r,a,d,a,r]).
% ?- palindrome([a,b,c]).
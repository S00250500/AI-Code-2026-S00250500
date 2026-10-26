% Hand facts.
right_handed(fred).
left_handed(bill).
right_handed(mary).

% Opposite handedness facts.
opposite(left, right).
opposite(right, left).

% the trunk is heavy.
heavy(trunk).

% Rule: find a persons best hand from their handedness facts.
best_hand(Person, right) :- 
    right_handed(Person).

best_hand(Person, left) :-
    left_handed(Person).

% Rule: two different people can lift an object together if it is heavy and they have opposite handedness.
can_lift(Person1, Person2, Object) :-
    heavy(Object),
    best_hand(Person1, Hand1),
    best_hand(Person2, Hand2),
    opposite(Hand1, Hand2).

% Example query:
% ?- can_lift(Person1, Person2, trunk).
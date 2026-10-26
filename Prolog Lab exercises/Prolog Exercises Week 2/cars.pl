% car(Type, Age, Cost)
% "there is a car of this Type, this many years old, costing this much"
car(ford, 3, 5000).
car(opel, 2, 6000).
car(toyota, 5, 1000).
car(ford, 2, 2000).

% has(Person, Type, Age, Cost)
% "Person owns a car of this Type, Age, Cost"
has(joe, ford, 3, 5000).
has(joe, opel, 2, 6000).
has(mick, toyota, 5, 1000).
has(mick, ford, 2, 2000).

% Rule: succeed for each car type in the car facts.
car(Type) :- 
    car(Type, _, _).

% Rule: find a person who owns a car costing less than Price.
car_less_than(Who, Price) :- 
    has(Who, _, _, Cost), 
    Cost < Price.

% Rule: find the type of car owned by a particular person.
what_car(Who, Car) :- 
    has(Who, Car, _, _).

% Example queries to run after loading this file:
% ?- car(Type).
% ?- car(ford).
% ?- car_less_than(Who, 3000).
% ?- what_car(joe, Car).
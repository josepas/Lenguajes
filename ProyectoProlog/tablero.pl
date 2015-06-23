tableroValido([X|[]]) :- is_list(X), maplist(number,X), !.
tableroValido([X|[Y|RS]]) :-
    X \= [],
    is_list(X), is_list(Y), 
    maplist(number,X),
    length(X,N), length(Y,N), 
    tableroValido([Y|RS]), !.


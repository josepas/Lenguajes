enteros([]) :- !.
enteros([X|XS]) :- 
    number(X), X < 10, X >= 0, enteros(XS). 

tableroValido([X|[]]) :- enteros(X), !.
tableroValido([X|[Y|RS]]) :-
    X \= [],
    enteros(X), is_list(Y), 
    length(X,N), length(Y,N), 
    tableroValido([Y|RS]), !.


saltoEnPosicion([F1|FS], N, X, Y, Sol) :-
    tableroValido([F1|FS]), 
    nonvar(X), nonvar(Y), nonvar(N), N > 0,
    length([F1|FS],LX), length(F1,LY),
    X >= 0, X =< LX, Y >= 0, Y < LY, 
    encontrar([F1|FS],N,X,Y,Sol,LX,LY).

salto([F1|FS], N, Sol) :- 
    tableroValido([F1|FS]), nonvar(N), N >= 0,
    length([F1|FS],LX), length(F1,LY),
    XH is LX -1, YH is LY -1,
    between(0,XH,X), between(0,YH,Y), 
    encontrar([F1|FS],N,X,Y,Sol,LX,LY).



encontrar(Tablero, 0, X, Y, solucion([I],X,Y,[]),LX,LY) :-
    X >= 0, X < LX, Y >= 0, Y < LY,
    nth0(X,Tablero,Fila), nth0(Y,Fila,I), !.

encontrar(Tablero, N, X, Y, solucion([I|IS],X,Y,[norte|Pasos]),LX,LY) :-
    N > 0,
    X > 0, nth0(X,Tablero,Fila), nth0(Y,Fila,I),
    N1 is N - 1, X1 is X-1,
    encontrar(Tablero,N1,X1,Y, solucion(IS,X1,Y,Pasos),LX,LY).

encontrar(Tablero, N, X, Y, solucion([I|IS],X,Y,[este|Pasos]),LX,LY) :-
    N > 0,
    Y < LY - 1, nth0(X,Tablero,Fila), nth0(Y,Fila,I),
    N1 is N - 1, Y1 is Y+1,
    encontrar(Tablero,N1,X,Y1, solucion(IS,X,Y1,Pasos),LX,LY).

encontrar(Tablero, N, X, Y, solucion([I|IS],X,Y,[sur|Pasos]),LX,LY) :-
    N > 0,
    X < LX - 1, nth0(X,Tablero,Fila), nth0(Y,Fila,I),
    N1 is N - 1, X1 is X+1,
    encontrar(Tablero,N1,X1,Y, solucion(IS,X1,Y,Pasos),LX,LY).

encontrar(Tablero, N, X, Y, solucion([I|IS],X,Y,[oeste|Pasos]),LX,LY) :-
    N > 0,
    Y > 0, nth0(X,Tablero,Fila), nth0(Y,Fila,I),
    N1 is N - 1, Y1 is Y - 1,
    encontrar(Tablero,N1,X,Y1, solucion(IS,X,Y1,Pasos),LX,LY).
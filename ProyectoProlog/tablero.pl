%% Nombre:
%%      Proyecto de Programacion orientada a pruebas
%%
%% Integrantes:
%%      Gustavo Gutierrez   11-10428
%%      Jose Pascarella     11-10743
%% 
%% Descripción:
%%      Construccion de los predicados que resulven el juego planteado
%%      en el enunciado. 
%%      
%%      Dada una matriz resuelve consultas de caminos que podrian crearse.




% tableroValido(Tablero)
% Verifica si el tablero esta construido correctamente.
%
%   enteros(L)
%   Verifica si los miembros de una lista estan en el rango [0,9].
%   
%   Se usaron además los predicados is_list/1, number/1, length/1
%   como apoyo.


enteros([]) :- !.
enteros([X|XS]) :- 
    number(X), X < 10, X >= 0, enteros(XS). 

tableroValido([X|[]]) :- enteros(X), !.
tableroValido([X|[Y|RS]]) :-
    X \= [],
    enteros(X), is_list(Y), 
    length(X,N), length(Y,N), 
    tableroValido([Y|RS]), !.


% saltoEnPosición(Tablero, N, X, Y, Sol)
% Verdadero si en el tablero se encuentra la solución con N saltos.
%
% saltoEnPosición(+Tablero, +N, +X, +Y, Sol) 
% Unifica en Sol todos los saltos posibles con los N pasos dados
% desde la posicion (X,Y).
%
%   Se usaron los predicados nonvar/1, length/1
%   

saltoEnPosicion([F1|FS], N, X, Y, Sol) :-
    tableroValido([F1|FS]), 
    nonvar(X), nonvar(Y), nonvar(N), N > 0,
    length([F1|FS],LX), length(F1,LY),
    X >= 0, X =< LX, Y >= 0, Y < LY, 
    encontrar([F1|FS],N,X,Y,Sol,LX,LY).


% salto(Tablero, N, Sol)
% Verdadero si existe la solucion en el tablero con N pasos.
% 
% Ejemplo:
%   salto(+Tablero, 2, solucion([1, 2, 3], X, Y, Pasos))
%   Unifica en X e Y la posicion inicial y en Pasos, los saltos cardinales
%   si el salto [1,2,3] existe en el tablero con 2 saltos 
%
% Se usaron los predicados nonvar/1, length/2 y between/3 este ultimo para 
% generar numeros en un rango

salto([F1|FS], N, Sol) :- 
    tableroValido([F1|FS]), nonvar(N), N >= 0,
    length([F1|FS],LX), length(F1,LY),
    XH is LX -1, YH is LY -1,
    between(0,XH,X), between(0,YH,Y), 
    encontrar([F1|FS],N,X,Y,Sol,LX,LY).


% encontrar/7 se uso como función auxiliar para salto y saltoEnPosición para
% evitar el chequeo constante del tablero asi como para agregar los limites 
% del tablero y preservarlos a traves de las llamadas.
%
% Se uso el predicado nth0/3 para obtener el elemento de una posición de 
% una lista indexado en 0.  
%

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
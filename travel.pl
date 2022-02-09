byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).


travel(X,Y) :- byCar(X,Y).
travel(X,Y) :- byPlane(X,Y).
travel(X,Y) :- byTrain(X,Y).

travel(X,Y) :- byCar(X,Z), !, travel(Z,Y).
travel(X,Y) :- byPlane(X,Z), !, travel(Z,Y).
travel(X,Y) :- byTrain(X,Z), !, travel(Z,Y).


travel(X,Y, go(X,Y)) :- byCar(X,Y).
travel(X,Y, go(X,Y)) :- byPlane(X,Y).
travel(X,Y, go(X,Y)) :- byTrain(X,Y).

travel(X,Y, go(X,Z,R)) :- byCar(X,Z), travel(Z,Y,R).
travel(X,Y, go(X,Z,R)) :- byPlane(X,Z), travel(Z,Y,R).
travel(X,Y, go(X,Z,R)) :- byTrain(X,Z), travel(Z,Y,R).



connection(X, Y) :- directTrain(X, Y).
connection(X, Y) :- directTrain(Y, X), !.



route(X,Y,RL,L):- connection(X, Y), reverse([Y|RL],L).
route(X,Y,RL,L):- connection(X,Z), \+member(Z,RL), route(Z,Y,[Z|RL],L), !.
route(X,Y,L):- route(X,Y,[X],L).










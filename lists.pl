append([],L,L).
append([H|T],L1,[H|L2]) :- append(T,L1,L2).

prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).

sublist(S,L) :- prefix(P,L), suffix(S,P).

member(H,[H|_]).
member(X,[_|T]) :- member(X,T).

mem_rem(H, [H|T], T).
mem_rem(X, [H|T], [H|R]) :- mem_rem(X, T, R).

sel(0,S,[],S).
sel(N,S,[X|Xs],R) :-
N > 0, N1 is N-1,
mem_rem(X, S, S1),
sel(N1,S1,Xs,R).

range(X) :- member(X,[1,2,3,4,5,6,7,8,9]).
ranges([]).
ranges([H|T]) :- range(H), ranges(T).


sol([X1,X2,X3,X4,X5,X6,X7,X8,X9]) :- 
sel(9, [1,2,3,4,5,6,7,8,9], [X1,X2,X3,X4,X5,X6,X7,X8,X9], _),
X1 * X2 - X3 =:= 3,
X4 + X5 * X6 =:= 19,
X7 - X8 + X9 =:= 8,
X1 * X4 * X7 =:= 14,
X2 * X5 - X8 =:= 16,
X3 + X6 + X9 =:= 17 .








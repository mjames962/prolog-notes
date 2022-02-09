% Group 95
% Mitchell James 981988, Ethan Pugh 985094, Vladyslav Kashtelyanov 959423 

% QUESTION 1

% Program: ROYAL
parent(queenmother,elisabeth). 
parent(elisabeth,charles).
parent(elisabeth,andrew). 
parent(elisabeth,anne).
parent(elisabeth,edward). 
parent(diana,william).
parent(diana,harry). 
parent(sarah,beatrice).
parent(anne,peter). 
parent(anne,zara).
parent(george,elisabeth). 
parent(philip,charles).
parent(philip,andrew). 
parent(philip,edward).
parent(charles,william). 
parent(charles,harry).
parent(andrew,beatrice). 
parent(andrew,eugenie).
parent(mark,peter). 
parent(mark,zara).
parent(william,georgejun). 
parent(kate,georgejun).
parent(william,charlotte). 
parent(kate,charlotte).
parent(philip,anne). 
parent(william,louis).
parent(kate,louis). 
parent(harry,archie).
parent(meghan,archie).

the_royal_females([queenmother,elisabeth,anne,diana,sarah,beatrice,
zara,eugenie,charlotte,kate,meghan]).

the_royal_males([charles,andrew,edward,william,harry,peter,george,
philip,mark,georgejun,louis,archie]).

the_royal_family(X) :- the_royal_females(XX), the_royal_males(XY), append(XY, XX, X).

father(X, Y) :- the_royal_males(Z), member(X, Z), parent(X, Y).

granddad(X, Y) :- father(X, Z), parent(Z, Y).

has_child(X) :- parent(X, _).

ancestor(X, Y) :- parent(X, Y); (parent(X, Z), ancestor(Z, Y)).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

brother(X, Y) :- the_royal_males(Z), member(X, Z), sibling(X, Y).


% ?- granddad(X, george).
% false.

% ?- has_child(X).
% X = queenmother ;
% X = elisabeth ;
% X = elisabeth ;
% X = elisabeth ;
% X = elisabeth ;
% X = diana ;
% X = diana ;
% X = sarah ;
% X = anne ;
% X = anne ;
% X = george ;
% X = philip ;
% X = philip ;
% X = philip ;
% X = charles ;
% X = charles ;
% X = andrew ;
% X = andrew ;
% X = mark ;
% X = mark ;
% X = william ;
% X = kate ;
% X = william ;
% X = kate ;
% X = philip ;
% X = william ;
% X = kate ;
% X = harry ;
% X = meghan.

% ?- ancestor(diana, X).
% X = william ;
% X = harry ;
% X = georgejun ;
% X = charlotte ;
% X = louis ;
% X = archie ;
% false.

% ?- ancestor(X, archie).
% X = harry ;
% X = meghan ;
% X = queenmother ;
% X = elisabeth ;
% X = diana ;
% X = george ;
% X = philip ;
% X = charles ;
% false.

has_brother_who_is_granddad(X, Y) :- brother(Y, X), granddad(Y, _).

% ?- has_brother_who_is_granddad(X, Y).
% X = andrew,
% Y = charles ;
% X = andrew,
% Y = charles ;
% X = andrew,
% Y = charles ;
% X = andrew,
% Y = charles ;
% X = anne,
% Y = charles ;
% X = anne,
% Y = charles ;
% X = anne,
% Y = charles ;
% X = anne,
% Y = charles ;
% X = edward,
% Y = charles ;
% X = edward,
% Y = charles ;
% X = edward,
% Y = charles ;
% X = edward,
% Y = charles ;
% X = andrew,
% Y = charles ;
% X = andrew,
% Y = charles ;
% X = andrew,
% Y = charles ;
% X = andrew,
% Y = charles ;
% X = edward,
% Y = charles ;
% X = edward,
% Y = charles ;
% X = edward,
% Y = charles ;
% X = edward,
% Y = charles ;
% X = anne,
% Y = charles ;
% X = anne,
% Y = charles ;
% X = anne,
% Y = charles ;
% X = anne,
% Y = charles ;
% X = anne,
% Y = charles ;
% false.

% QUESTION 2

is_odd(X) :- X mod 2 =\= 0.

toEven([], []).
toEven([H1|T1], [H2|T2]) :- is_odd(H1), H2 is H1 * 2, toEven(T1, T2).
toEven([H1|T1], [H2|T2]) :- not(is_odd(H1)), H2 is H1, toEven(T1, T2).

star(0).
star(N) :- N > 0, N1 is N - 1, star_print(N), star(N1).

star2(N) :- star(N), star_print2(N, 2). 

star_print(0).
star_print(1) :- write(*), write('\n').
star_print(N) :- N > 1, N1 is N-1, write(*), star_print(N1).

star_print2(0, _).
star_print2(_, 0).
star_print2(N, C) :- N > 1, C > 0, N1 is N - 1, C1 is C + 1, star_print(C), star_print2(N1, C1).

% QUESTION 3

euclidsqr(X,Y, ED) :- euclidaux(X, Y, Distance), ED is sqrt(Distance).

euclidaux([], [], 0).
euclidaux([X|Xs], [Y|Ys], Distance) :- euclidaux(Xs, Ys, Distance2), Distance is ((X-Y)**2) + Distance2. 

euclidsqr2(X,Y, ED) :-
	euclidean_acc(X,Y,0,SquaredDistance),
	ED is sqrt(SquaredDistance).

euclidean_acc([],[],Distance,Distance).

euclidean_acc([X|Xs],[Y|Ys],Current,SquaredDistance) :-
	New is Current+(X-Y)**2,
	euclidean_acc(Xs,Ys,New,SquaredDistance).


% QUESTION 4

member_rem(H, [H|T], T).
member_rem(X, [H|T], [H|R]) :- member_rem(X, T, R).

gen_n(0,_,[]).
gen_n(N,D,[X|Xs]) :- N>0, N1 is N-1, member_rem(X, D, D1), gen_n(N1,D1,Xs).

gen4(L) :- gen_n(4, [1,2,3,4], L).

distinct_in_entries(X, Y) :- X \= Y.

gen_poss_soln([R1, R2, R3, R4]) :- gen4(R1), gen4(R2), gen4(R3), gen4(R4),
								   distinct_in_entries(R1, R2),
								   distinct_in_entries(R1, R3),
								   distinct_in_entries(R1, R4),
								   distinct_in_entries(R2, R3),
								   distinct_in_entries(R2, R4),
								   distinct_in_entries(R3, R4).

solve([R1, R2, R3, R4]) :- gen_poss_soln([R1, R2, R3, R4]),
                           R1 = [R11, R12, _, _],
						   R2 = [R21, R22, _, R24],
						   R3 = [R31, R32, R33, R34],
						   R4 = [_, _, R43, R44],
						   R11 > R12,
						   R21 < R22, R24 > R34,
						   R31 > R32, R33 < R34,
						   R43 < R44.
						   
solve_in_steps([R1, R2, R3, R4]) :- gen4(R1), R1 = [R11, R12, _, _], R11 > R12,
                                    gen4(R2), R2 = [R21, R22, _, R24], R21 < R22,
									gen4(R3), R3 = [R31, R32, R33, R34], R31 > R32, R33 < R34, R34 < R24,
									gen4(R4), R4 = [_, _, R43, R44], R43 < R44,
									distinct_in_entries(R1, R2),
								    distinct_in_entries(R1, R3),
								    distinct_in_entries(R1, R4),
								    distinct_in_entries(R2, R3),
								    distinct_in_entries(R2, R4),
								    distinct_in_entries(R3, R4).
								   
								   


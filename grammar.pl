%TASK 1

s --> foo,bar,wiggle.
foo --> [choo].
foo --> foo,foo.
bar --> mar,zar.
mar --> me,my.

me --> [i].
my --> [am].
zar --> blar,car.
blar --> [a].
car --> [train].
wiggle --> [toot].
wiggle --> wiggle,wiggle.


sList(A-C):- fooList(A-B), sListaux(B-C). 
sListaux(A-C):- barList(A-B), wiggleList(B-C).
fooList([choo|W]-W).
fooList(A-C):- fooList(A-B), fooList(B-C).
barList(A-C):- marList(A-B), zarList(B-C).
marList(A-C):- meList(A-B), myList(B-C).


meList([i|W]-W).
myList([am|W]-W).
zarList(A-C):- blarList(A-B), carList(B-C).
blarList([a|W]-W).
carList([train|W]-W).
wiggleList([toot|W]-W).
wiggleList(A-C):- wiggleList(A-B), wiggleList(B-C).



%TASK 2 & 3



s(s(NP,VP)) --> npPlural(subject,NP), vpPlural(VP).
s(s(NP,VP)) --> npSingle(subject,NP), vpSingle(VP).



npPlural(_,np(Det,N)) --> detPlural(Det), nPlural(N).
npSingle(_,np(Det,N)) --> det(Det), nSingle(N).



vpPlural(vp(V,NP)) --> vPlural(V), npPlural(object,NP).
vpPlural(vp(V,NP)) --> vPlural(V), npSingle(object,NP).
vpSingle(vp(V,NP)) --> vSingle(V), npSingle(object,NP).
vpSingle(vp(V,NP)) --> vSingle(V), npPlural(object,NP).


det(det(the)) --> [the].
det(det(a)) --> [a].
detPlural(det(two)) --> [two].
detPlural(det(the)) --> [the].


nSingle(n(woman)) --> [woman].
nSingle(n(man)) --> [man].
nPlural(n(women)) --> [women].
nPlural(n(men)) --> [men].


vPlural(v(hire)) --> [hire].
vSingle(v(hires)) --> [hires].











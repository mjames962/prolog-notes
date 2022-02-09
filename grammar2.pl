
%TASK 4

s(s(NP,VP)) --> npPlural(subject,NP), vpPlural(VP).
s(s(NP,VP)) --> npSingle(subject,NP), vpSingle(VP).



npPlural(_,np(Det,N)) --> detPlural(Det), nPlural(N).
npSingle(_,np(Det,N)) --> det(Det), nSingle(N).



vpPlural(vp(V)) --> vIntransPlural(V).
vpSingle(vp(V)) --> vIntransSingle(V).

vpPlural(vp(V,NP)) --> vTransPlural(V), npPlural(object,NP).
vpPlural(vp(V,NP)) --> vTransPlural(V), npSingle(object,NP).
vpSingle(vp(V,NP)) --> vTransSingle(V), npSingle(object,NP).
vpSingle(vp(V,NP)) --> vTransSingle(V), npPlural(object,NP).




det(det(Word)) --> [Word], {lex(Word,det)}.
detPlural(det(Word)) --> [Word], {lex(Word,detPlural)}.


nSingle(n(Word)) --> [Word], {lex(Word,nSingle)}.
nPlural(n(Word)) --> [Word], {lex(Word,nPlural)}.


vTransSingle(v(Word)) --> [Word], {lex(Word,vTransSingle)}.
vTransPlural(v(Word)) --> [Word], {lex(Word,vTransPlural)}.

vIntransSingle(v(Word)) --> [Word], {lex(Word,vIntransSingle)}.
vIntransPlural(v(Word)) --> [Word], {lex(Word,vIntransPlural)}.


lex(the, det).
lex(the, detPlural).
lex(a, det).
lex(two, detPlural).

lex(woman, nSingle).
lex(man, nSingle).
lex(women, nPlural).
lex(men, nPlural).


lex(hires, vTransSingle).
lex(hire, vIntransPlural).
lex(falls, vIntransSingle).
lex(fall, vIntransPlural).
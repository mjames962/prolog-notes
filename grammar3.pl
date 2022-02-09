s(s(NP,VP)) --> np(subject, singular, Person, Animacy, NP), vp(singular, Person, Animacy, VP).
s(s(NP,VP)) --> np(subject, plural, Person, Animacy, NP), vp(plural, Person, Animacy, VP).


np(_, Number, 3, Animacy, np(Det,N)) --> det(Number, Det), nbar(Number, Animacy, N).
np(_, Number, 3, Animacy, np(Det,N, P)) --> det(Number, Det), nbar(Number, Animacy, N), pp(P).
np(X, Number, Person, Animacy, np(Pro)) --> pro(X, Number, Person, Animacy, Pro).


pp(pp(P, NP)) --> prep(P), np(object, _, 3, _, NP).
prep(prep(Word)) --> [Word], {lex(Word, prep)}.

nbar(Number, Animacy, nbar(N)) --> n(Number, Animacy, N).
nbar(Number, Animacy, nbar(N)) --> jp(Number, Animacy, N).

jp(Number, Animacy, jp(A,B)) --> adj(A), jp(Number, Animacy, B).
jp(Number, Animacy, A) --> n(Number, Animacy, A).
adj(adj(Word)) --> [Word], {lex(Word, adj)}.



vp(Number, Person, Animacy, vp(V)) --> v(iv, Number, Person, Animacy, V).
vp(Number, Person, Animacy, vp(V,NP)) --> v(tv, Number, Person, Animacy, V), np(object, _, _, _, NP).


det(Number, det(Word)) --> [Word], {lex(Word, det, Number)}.


n(Number, Animacy, n(Word)) --> [Word], {lex(Word, n, Number, Animacy)}.


v(Trans, Number, Person, Animacy, v(Word)) --> [Word], {lex(Word, Trans, Number, Person, Animacy)}.

pro(subject, Number, Person, Animacy, pro(Word)) --> [Word], {lex(Word, pro, Number, Person, subject, Animacy)}.
pro(object, Number, Person, Animacy, pro(Word)) --> [Word], {lex(Word, pro, Number, Person, object, Animacy)}.




%pronouns
%word, pronoun, single or plural, grammatical person, subject or object, animate or inanimate
lex(i, pro, singular, 1, subject, animate).
lex(you, pro, singular, 2, subject, animate).
lex(he, pro, singular, 3, subject, animate).
lex(she, pro, singular, 3, subject, animate).
lex(it, pro, singular, 3, subject, _).
lex(we, pro, plural, 1, subject, animate).
lex(you, pro, plural, 2, subject, animate).
lex(they, pro, plural, 3, subject, _).
lex(me, pro, singular, 1, object, animate).
lex(you, pro, singular, 2, object, animate).
lex(him, pro, singular, 3, object, animate).
lex(her, pro, singular, 3, object, animate).
lex(it, pro, singular, 3, object, _).
lex(us, pro, plural, 1, object, animate).
lex(you, pro, plural, 2, object, animate).
lex(them, pro, plural, 3, object, _).


%verbs
%word, transitive or intransitive, single or plural, grammatical person, animate or inanimate
lex(know, tv, singular, 1, animate).
lex(know, tv, singular, 2, animate).
lex(knows, tv, singular, 3, animate).
lex(know, tv, plural, _, animate).
lex(see, tv, singular, 1, animate).
lex(see, tv, singular, 2, animate).
lex(sees, tv, singular, 3, animate).
lex(see, tv, plural, _, animate).
lex(hire, tv, singular, 1, animate).
lex(hire, tv, singular, 2, animate).
lex(hires, tv, singular, 3, animate).
lex(hire, tv, plural, _, animate).
lex(fall, iv, singular, 1, _).
lex(fall, iv, singular, 2, _).
lex(falls, iv, singular, 3, _).
lex(fall, iv, plural, _, _).
lex(sleep, iv, singular, 1, animate).
lex(sleep, iv, singular, 2, animate).
lex(sleeps, iv, singular, 3, animate).
lex(sleep, iv, plural, _, animate).


%determiners
%word, determiner, single or plural
lex(the, det, _).
lex(a, det, singular).
lex(two, det, plural).


%nouns
%word, noun, singular or plural, animate or inanimate
lex(man, n, singular, animate).
lex(woman, n, singular, animate).
lex(apple, n, singular, inanimate).
lex(chair, n, singular, inanimate).
lex(room, n, singular, inanimate).
lex(men, n, plural, animate).
lex(women, n, plural, animate).
lex(apples, n, plural, inanimate).
lex(chairs, n, plural, inanimate).
lex(rooms, n, plural, inanimate).


%prepositions
%word, prep 
lex(on, prep).
lex(in, prep).
lex(under, prep).


%adjectives
%word, adj 
lex(old, adj).
lex(young, adj).
lex(red, adj).
lex(short, adj).
lex(tall, adj).


%Test Sentences

%1.	the woman sees the apples
%?- s(Tree, [the, woman, sees, the, apples],[]).
%Tree = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples)))))

%2.	a woman knows him
%?- s(Tree, [a, woman, knows, him],[]).
%Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him))))

%3.	*two woman hires a man
%?- s(Tree, [two, woman, hires, a, man],[]).
%false.

%4.	two women hire a man
%?- s(Tree, [two, women, hire, a, man],[]).
%Tree = s(np(det(two), nbar(n(women))), vp(v(hire), np(det(a), nbar(n(man)))))

%5.	she knows her
%?- s(Tree, [she, knows, her],[]).
%Tree = s(np(pro(she)), vp(v(knows), np(pro(her))))

%6.	*she know the man
%?- s(Tree, [she, know, the, man],[]).
%false.

%7.	*us see the apple
%?- s(Tree, [us, see, the, apple],[]).
%false.

%8.	we see  the apple
%?- s(Tree, [we, see, the, apple],[]).
%Tree = s(np(pro(we)), vp(v(see), np(det(the), nbar(n(apple)))))

%9.	i know a short man
%?- s(Tree, [i, know, a, short, man],[]).
%Tree = s(np(pro(i)), vp(v(know), np(det(a), nbar(jp(adj(short), n(man))))))

%10.	*he hires they
%?- s(Tree, [he,hires, they],[]).
%false.

%11.	two apples fall
%?- s(Tree, [two, apples, fall],[]).
%Tree = s(np(det(two), nbar(n(apples))), vp(v(fall)))

%12.	the apple falls
%?- s(Tree, [the, apple, falls],[]).
%Tree = s(np(det(the), nbar(n(apple))), vp(v(falls)))

%13.	the apples fall
%?- s(Tree, [the, apples, fall],[]).
%Tree = s(np(det(the), nbar(n(apples))), vp(v(fall)))

%14.	i sleep
%?- s(Tree, [i, sleep],[]).
%Tree = s(np(pro(i)), vp(v(sleep)))

%15.	you sleep
%?- s(Tree, [you, sleep],[]).
%Tree = s(np(pro(you)), vp(v(sleep)))

%16. 	she sleeps
%?- s(Tree, [she, sleeps],[]).
%Tree = s(np(pro(she)), vp(v(sleeps)))

%17.	*he sleep
%?- s(Tree, [he, sleep],[]).
%false.

%18.	*them sleep
%?- s(Tree, [them, sleep],[]).
%false.

%19.	*a men sleep
%?- s(Tree, [a, men, sleep],[]).
%false.

%20.	*the tall woman sees the red
%?- s(Tree, [the, tall, woman, sees, the, red],[]).
%false.

%21.	the young tall man knows the old short woman
%?- s(Tree, [the, young, tall, man, knows, the, old, short, woman],[]).
%Tree = s(np(det(the), nbar(jp(adj(young), jp(adj(tall), n(man))))), vp(v(knows), np(det(the), nbar(jp(adj(old), jp(adj(short), n(woman)))))))

%22.	*a man tall knows the short woman
%?- s(Tree, [a, man, tall, knows, the, short, woman],[]).
%false.

%23.	a man on a chair sees a woman in a room
%?- s(Tree, [a, man, on, a, chair, sees, a, woman, in, a, room],[]).
%Tree = s(np(det(a), nbar(n(man)), pp(prep(on), np(det(a), nbar(n(chair))))), vp(v(sees), np(det(a), nbar(n(woman)), pp(prep(in), np(det(a), nbar(n(room)))))))

%24.	*a man on a chair sees a woman a room in
%?- s(Tree, [a, man, on, a, chair, sees, a, woman, a, room, in],[]).
%false.

%25.	the tall young woman in a room on the chair in a room in the room sees the red apples under the chair.
%?- s(Tree, [the, tall, young, woman, in, a, room, on, the, chair, in, a, room, in, the, room, sees, the, red, apples, under, the, chair],[]).
%Tree = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))), pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the), nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...)), pp(prep(...), np(..., ...))))))))), vp(v(sees), np(det(the), nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the), nbar(n(chair)))))))


%Animacy Tests

%1.	the woman sees the apples
%?- s(Tree, [the, woman, sees, the, apples],[]).
%Tree = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples)))))

%2.	a woman knows him
%?- s(Tree, [a, woman, knows, him],[]).
%Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him))))

%3.	the man sleeps
%?- s(Tree, [the, man, sleeps],[]).
%Tree = s(np(det(the), nbar(n(man))), vp(v(sleeps)))

%4.	*the room sleeps
%?- s(Tree, [the, room, sleeps],[]).
%false.

%5.	*the apple sees the chair
%?- s(Tree, [the, apple, sees, the, chair],[]).
%false.

%6.	*the rooms know the man
%?- s(Tree, [the, rooms, know, the, man],[]).
%false.

%7.	the apple falls
%?- s(Tree, [the, apple, falls],[]).
%Tree = s(np(det(the), nbar(n(apple))), vp(v(falls)))

%8.	the man falls
%?- s(Tree, [the, man, falls],[]).
%Tree = s(np(det(the), nbar(n(man))), vp(v(falls)))


% zad1.pl
arc(a,b).
arc(b,a).
arc(a,d).
arc(b,c).
arc(b,e).
arc(d,e).
arc(d,g).
arc(c,f).
arc(e,h).
arc(g,h).
arc(f,i).
arc(h,i).

path(X, Y) :-
    path(X, Y, _).

path(Start, End) :-
    path(Start, End, []).

path(Cur, End, _) :-
    arc(Cur, Tmp),
    Tmp == End, !.

path(Cur, End, Acc) :-
    arc(Cur, Tmp),
    \+ member(Tmp, Acc),
    path(Tmp, End, [Cur|Acc]).


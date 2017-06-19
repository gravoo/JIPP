% test.pl
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

/*
path(X, Y) :-
    path(X, Y, _).

path(Start, End, Path) :-
    path(Start, End, [], Path).

path(Now, End, Acc, Path) :-
    arc(Now, Mid),
    Mid == End, !,
    append(Acc, [Now, End], Path).

path(Now, End, Acc, Path) :-
    arc(Now, Mid),
    \+ member(Mid, Acc),
    path(Mid, End, [Now|Acc], Path).
*/

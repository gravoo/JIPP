% test.pl
arc(a,b).
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
patch(X,Y) :-
    arc(X,Y).

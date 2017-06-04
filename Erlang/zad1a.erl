-module(zad1a).
-export([pyth2/1]).
pyth2(D) ->
    [{X,Y,Z} || X <- lists:seq(1, D - 2), Y <-lists:seq(X + 1, D - 1),Z<-lists:seq(Y + 1, D),
                X * X + Y * Y =:= Z * Z, X + Y + Z =:= D].

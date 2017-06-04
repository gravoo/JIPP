-module(zad1).
-export([pythag/1]).
pythag(D) ->
    getValuesEqD(generateTuples(D),D).
generateTuples(D) ->
    [{X,Y,Z} || Z<-lists:seq(1, round(D/2)), X <- lists:seq(1, Z), Y <-lists:seq(1, X),
                X * X + Y * Y =:= Z * Z].
getValuesEqD([{X,Y,Z} | Rest], D) when X + Y + Z =:= D ->
    [{X,Y,Z}|getValuesEqD(Rest, D)];
getValuesEqD([{X,Y,Z} | Rest], D) ->
    getValuesEqD(Rest, D);
getValuesEqD([], D) ->
    [].

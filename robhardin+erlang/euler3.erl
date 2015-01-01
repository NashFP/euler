-module(euler3).
-export([factor/2]).

% learning all about the guards and recursion.
factor(X, P) when X =< P -> P;
factor(X, P) ->
    if X rem P =:= 0 -> factor(X div P, 2);
        true -> factor(X, P + 1)
    end.
% 28> c(euler3).
% {ok,euler3}
% 29> euler3:factor(13195, 2).
% 29
% 30> euler3:factor(600851475143, 2).
% 6857

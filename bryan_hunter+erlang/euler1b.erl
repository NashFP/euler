-module(euler1b).

-export([solve/0]).

solve() ->
    summer(0, lists:seq(1,1000)).

summer(Sum, [H|T]) when H rem 3 == 0; H rem 5 == 0 -> 
    summer(Sum + H, T);
summer(Sum, [_|T]) ->
    summer(Sum, T);
summer(Sum, []) ->
    Sum.

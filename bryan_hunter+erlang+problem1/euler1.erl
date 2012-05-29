-module(euler1).

-export([solve/0]).

solve() ->
    lists:sum(
      lists:filter(
	fun(X) -> (X rem 5 == 0) or (X rem 3 == 0) end, 
	lists:seq(1,1000))).

% notes:
%  http://www.erlang.org/doc/man/lists.html
%  http://www.erlang.org/doc/reference_manual/expressions.html

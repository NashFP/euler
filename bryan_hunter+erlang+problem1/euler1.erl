-module(euler1).

-export([solve/0]).


solve() ->
    lists:sum(
      lists:filter(
	fun(X) -> (X rem 5 == 0) or (X rem 3 == 0) end, 
	lists:seq(1,1000))).


% Notes:
% If we list all the natural numbers below 10 that are multiples of 3
% or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
% Find the sum of all the multiples of 3 or 5 below 1000.
%
%  http://www.erlang.org/doc/man/lists.html
%  http://www.erlang.org/doc/reference_manual/expressions.html

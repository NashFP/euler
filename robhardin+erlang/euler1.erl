% Eurler #1:
%   If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
%   Find the sum of all the multiples of 3 or 5 below 1000.
%
% Problem statement-- { x1..x1000 : x % 3 or x % 5 }
%
-module(euler1).
-export([mod/1]).
-export([solve/0]).
%
% learning about function definition.
mod(N) -> (N rem 3 =:= 0) or (N rem 5 =:= 0).
% Using a list comprehension to do our little set math and test the first statement.
% 24> euler1:mod(3).
% true
% 25> [N || N <- [1,2,3,4,5,6,7,8,9], euler1:mod(N) =:= true].
% [3,5,6,9]
%
% Now we're ready to solve.
solve() -> [N || N <- lists:seq(1,1000), mod(N) =:= true].
% 1> c(euler1).
% {ok,euler1}
% 2> euler1:solve().
% [3,5,6,9,10,12,15,18,20,21,24,25,27,30,33,35,36,39,40,42,45,
% 48,50,51,54,55,57,60,63|...]

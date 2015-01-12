% Euler #6:
% Take 2, more erlang-style approach using feedback from CalvinB
-module(euler6a).
-export([sqr/1,
         squares/2,
         sum_of_squares/2,
         square_of_sum/2,
         difference/2]).
%
sqr(N) -> N * N.
%
% return a list of squares From:To.
squares(From, To) -> lists:map(fun(N)-> N * N end, lists:seq(From, To)).
%   2> euler6a:squares(1, 10).
%   [1,4,9,16,25,36,49,64,81,100]
%
% sum of squares
sum_of_squares(From, To) -> lists:sum(squares(From, To)).
% test:
%   3> euler6a:sum_of_squares(1, 10).
%   385
%
% square of sum
square_of_sum(From, To) -> sqr(lists:sum(lists:seq(From, To))).
% test:
%   4> euler6a:square_of_sum(1, 10).
%   3025
%
% difference between sum of squares and square of sums
difference(From, To) -> square_of_sum(From, To) - sum_of_squares(From, To).
% test:
%   5> euler6a:difference(1, 10).
%   2640
%
% solve:
%   6> euler6a:difference(1, 100).
%   25164150

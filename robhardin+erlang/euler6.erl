% Euler #6:
% The sum of the squares of the first ten natural numbers is,
%   1^2 + 2^2 + ... + 10^2 = 385
% The square of the sum of the first ten natural numbers is,
%   (1 + 2 + ... + 10)^2 = 552 = 3025
% Hence the difference between the sum of the squares of the first ten natural
% numbers and the square of the sum is 3025 − 385 = 2640.
% Find the difference between the sum of the squares of the first one hundred
% natural numbers and the square of the sum.
-module(euler6).
-export([sqr/1,
         squares/2,
         sum/1,
         sum_of_squares/2,
         square_of_sum/2,
         difference/2]).
%
% my own version of pow(N, 2).
sqr(N) -> N * N.
% return a list of squares From:To.
squares(From, To) -> [sqr(N) || N <- lists:seq(From, To)].
%
% sum a list
sum([]) -> 0;
sum([N|T]) ->
    N + sum(T).
%
% sum of squares
sum_of_squares(From, To) -> sum(squares(From, To)).
% test:
%   20> euler6:sum_of_squares(1,10).
%   385
%
% square of sum
square_of_sum(From, To) -> sqr(sum(lists:seq(From, To))).
% test:
%   23> euler6:square_of_sum(1, 10).
%   3025
%
% difference between sum of squares and square of sums
difference(From, To) -> square_of_sum(From, To) - sum_of_squares(From, To).
% test:
%   26> euler6:difference(1,10).
%   2640
%
% solve:
%   27> euler6:difference(1,100).
%   25164150

# coding: utf-8
=begin
Problem 6 「二乗和の差」
最初の10個の自然数について, その二乗の和は,

12 + 22 + ... + 102 = 385
最初の10個の自然数について, その和の二乗は,

(1 + 2 + ... + 10)2 = 3025
これらの数の差は 3025 - 385 = 2640 となる.

同様にして, 最初の100個の自然数について二乗の和と和の二乗の差を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%206

=end
# a ** b => math.pow
def sum_square_difference(range)

sum_squares = (1..range).reduce(0){|m,x| m += (x ** 2) }
squares_sum = (1..range).reduce(0){|m,x| m += x } ** 2

(squares_sum - sum_squares)

end

def euler006
sum_square_difference(100)
end
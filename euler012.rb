# coding: utf-8
=begin
Problem 12 「高度整除三角数」 †
三角数の数列は自然数の和で表わされ, 7番目の三角数は 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28 である. 三角数の最初の10項は:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
となる.

最初の7項について, その約数を列挙すると, 以下のとおり.

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28

これから, 7番目の三角数である28は, 5個より多く約数をもつ最初の三角数であることが分かる.

では, 500個より多く約数をもつ最初の三角数はいくつか.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2012

=end
require 'prime'

def get_triangular_number(tag)
	cacu_triangular = 0
	cacu_num = 1
	cacu = 1
	loop do
		cacu_num = 1
		cacu_triangular += cacu
		break if Prime.prime_division(cacu_triangular).reduce(0){|m,x| cacu_num *= (x[1]+1)} >= tag
		cacu += 1
	end
	cacu_triangular
end

def euler012
get_triangular_number(500)
end
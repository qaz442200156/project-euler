# coding: utf-8
=begin
Problem 21 「友愛数」 †
d(n) を n の真の約数の和と定義する. (真の約数とは n 以外の約数のことである. )
もし, d(a) = b かつ d(b) = a (a ≠ b のとき) を満たすとき, a と b は友愛数(親和数)であるという.

例えば, 220 の約数は 1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110 なので d(220) = 284 である.
また, 284 の約数は 1, 2, 4, 71, 142 なので d(284) = 220 である.

それでは10000未満の友愛数の和を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2021

=end
require 'prime'

def get_div(num)
return 0 if num <= 0
sum = 1
Prime.prime_division(num).reduce(0){|m,x| 
sum *= (x[0] ** x[1])
#puts sum
}
#puts "@@@@@@@@@@@@@@@@@@@@@@  #{num} ---- #{sum}"
sum
end
SKIP_LIST=[]
def prime_sum(tag,range)
	return 0 if SKIP_LIST != nil and SKIP_LIST.include?(tag)
	a = get_div(tag) 
	return 0 if a >= range
	b = get_div(a)
	return 0 if b >= range
	#puts "#{a}  #{b}"
	if a == b
		SKIP_LIST << a.to_i if SKIP_LIST.include?(a) == false

		(a + tag)
	else
		0
	end
end

def euler021
(2..9_999).select{|x| Prime.instance.prime?(x) == false }.reduce(0){|m,x| m += prime_sum(x,9_999) }
end
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

	in_num = num
	primes = []
	div = Prime.prime_division(num)
	div.each_with_index do |value,x| 
		preme_per_sum = 1
		value[1].times do |i|
			preme_per = value[0] ** (i+1)
			preme_per_sum *= preme_per
			div.each_with_index do |_value,_x| 
				prime_value = (preme_per * _value[0])
				if  value[0] != _value[0]
				preme_per_sum *= _value[0]
				end
				primes << (preme_per_sum) if preme_per_sum != num and (preme_per_sum) < num and primes.include?(preme_per_sum) == false
				primes << (prime_value) if prime_value != num and (prime_value) < num and value[0] != _value[0] and primes.include?(prime_value) == false
			end

			primes << preme_per if preme_per != num and primes.include?(preme_per) == false
			in_num /= value[0]
			primes << in_num if in_num != num and primes.include?(in_num) == false
			break if in_num == 1
		end	
		break if in_num == 1
	end
	(primes.reduce(0){|m,x| m += x})
end
SKIP_LIST=[]
def prime_sum(tag)
	return 0 if SKIP_LIST != nil and SKIP_LIST.include?(tag)
	a = get_div(tag) 
	return 0 if a == 0
	b = get_div(a)
	return 0 if b == 0
	if b == tag and a != b
		SKIP_LIST << a.to_i if SKIP_LIST.include?(a) == false
		(a + tag)
	else
		0
	end
end

def euler021
(2..9_999).select{|x| Prime.instance.prime?(x) == false}.reduce(0){|m,x| m += prime_sum(x) }
end
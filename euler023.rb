# coding: utf-8
=begin
Problem 23 「非過剰数和」 †
完全数とは, その数の真の約数の和がそれ自身と一致する数のことである. たとえば, 28の真の約数の和は, 1 + 2 + 4 + 7 + 14 = 28 であるので, 28は完全数である.

真の約数の和がその数よりも少ないものを不足数といい, 真の約数の和がその数よりも大きいものを過剰数と呼ぶ.

12は, 1 + 2 + 3 + 4 + 6 = 16 となるので, 最小の過剰数である. よって2つの過剰数の和で書ける最少の数は24である. 数学的な解析により, 28123より大きい任意の整数は2つの過剰数の和で書けることが知られている. 2つの過剰数の和で表せない最大の数がこの上限よりも小さいことは分かっているのだが, この上限を減らすことが出来ていない.

2つの過剰数の和で書き表せない正の整数の総和を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2023

=end
require 'prime'

NON_List = Hash.new
def get_div_c(num)
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
	
	sum = (primes.reduce(0){|m,x| m += x})

	if sum > num and num != sum and Prime.instance.prime?(num) == false
		NON_List[num.to_s] = num if NON_List.key?(num.to_s) == false
		return sum
	else
		return 0
	end
end

#4179871

def euler023

	normal_value =0
	(1..28123).to_a.map{|x|#28123
		if get_div_c(x) == 0
			is_ok = true
			
			NON_List.each {|key,value| 
				 if NON_List.key?((x-value).to_s)
					 is_ok = false
					 break
				 end
			}
			if is_ok
			normal_value += x 
			end
		end
	}
	#puts "#{NON_List}"
	normal_value
end
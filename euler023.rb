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
	if Prime.instance.prime?(num)
	return 0
	end

	div.each_with_index do |value,x|
		value[1].times do |i|
			f_value = div[x][0] ** (i+1)
				div.each_with_index do |_value,_x| 
					sum_a_a = 1
					if _value[0] != div[x][0]
						sum_a_a = f_value * _value[0]
					end
					div_per_v = (in_num / sum_a_a)
					primes << div_per_v if primes.include?(div_per_v) == false and in_num % sum_a_a == 0 and div_per_v <= num/2
					primes << sum_a_a if primes.include?(sum_a_a) == false and sum_a_a <= num/2
				end
			primes << f_value if primes.include?(f_value) == false and f_value <= num/2
			div_v = (in_num / f_value)
			primes << div_v if primes.include?(div_v) == false and in_num % f_value == 0 and div_v <= num/2
		end
	end
	
	sum = (primes.reduce(0){|m,x| m += x})
	if sum > num and num != sum
		NON_List[num.to_s] = num if NON_List.key?(num.to_s) == false
		return num
	else
	
		return 0
	end
end

#4179871

def euler023

	normal_value =0
	all_group = (1..28123).to_a.each{|all_num| get_div_c(all_num)}#28123
	NON_List.sort.uniq

	all_group.each{|item|
		is_ok = true
		range = NON_List.values.select{|lv| lv <= item and item - lv > 0}
		if range != nil and range != []
			if item - range.min > 10_000
				range.reverse_each{|r_value|
					per_cacu = item - r_value
					break if per_cacu < 0 or r_value < per_cacu 
					if NON_List.key?(per_cacu.to_s)
						is_ok = false
					end
				}
			else
				range.each{|value|
				per_cacu = item - value
				break if per_cacu < 0 or value > per_cacu
				if NON_List.key?(per_cacu.to_s)
					is_ok = false
				end
			}
			end
			
		end
		
		if is_ok
			normal_value += item
		end
	}
	
	normal_value
end
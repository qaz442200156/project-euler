# coding: utf-8
=begin
 Problem 3 「最大の素因数」
13195 の素因数は 5, 7, 13, 29 である.

600851475143 の素因数のうち最大のものを求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%203

=end

def prime_num(n)
	prime_list = []
	input_num = n
	base = 2

	loop do
		if input_num % base == 0
			prime_list << base if prime_list.include?(base) == false
			input_num = input_num / base
			base = 2
		else
		break if base >= input_num
		base+=1
		end
		
	end
	prime_list.max

end

def euler003
	prime_num(600851475143)
end
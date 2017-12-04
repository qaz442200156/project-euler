# coding: utf-8
=begin
Problem 5 「最小の倍数」
2520 は 1 から 10 の数字の全ての整数で割り切れる数字であり, そのような数字の中では最小の値である.

では, 1 から 20 までの整数全てで割り切れる数字の中で最小の正の数はいくらになるか.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%205

=end
# a ** b => math.pow
def min_range(range)
all_primes = {}
	for x in (1..range)
		per_low_common(x).each do |key , value|
			if all_primes.key?(key) == false
				all_primes[key] = value 
			else
				all_primes[key] = value if all_primes[key] < value
			end
		end
	end
	low_common_num = 1
	all_primes.each do |key , value|
		low_common_num *= key.to_i ** value
	end
	low_common_num
end

def per_low_common(n)
	base = 2
	prime_hash = {}
	loop do
		if n % base == 0
			if prime_hash.key?(base.to_s) == false
				prime_hash[base.to_s] = 1
			else
				prime_hash[base.to_s] += 1
			end
			n = n / base
			base = 2
		else
			break if base >= n
			base+=1
		end
	end
	prime_hash
end

def euler005
min_range(20)
end
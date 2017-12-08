# coding: utf-8
=begin
Problem 14 「最長のコラッツ数列」 †
正の整数に以下の式で繰り返し生成する数列を定義する.

n → n/2 (n が偶数)

n → 3n + 1 (n が奇数)

13からはじめるとこの数列は以下のようになる.

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
13から1まで10個の項になる. この数列はどのような数字からはじめても最終的には 1 になると考えられているが, まだそのことは証明されていない(コラッツ問題)

さて, 100万未満の数字の中でどの数字からはじめれば最長の数列を生成するか.

注意: 数列の途中で100万以上になってもよい
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2014

=end


def euler014
	index = 0
	index_value = 0
	tag = 1000_000
	((tag/2).to_i..tag).select{|v| v % 2 != 0 }.map{ |x| 
		cacu_value = x
		counter = 0
		loop do
			if cacu_value % 2 == 0
				cacu_value /= 2
				counter += 1
			else
				cacu_value = (cacu_value*3+1)
				counter += 1
			end

			if cacu_value <= 1
				if index_value <= counter
					index = x
					index_value = counter
				end
				break
			end
		end
		break if x < tag / 2 
	}

	index

end
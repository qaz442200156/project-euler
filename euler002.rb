# coding: utf-8
=begin
 Problem 2 「偶数のフィボナッチ数」 
フィボナッチ数列の項は前の2つの項の和である. 最初の2項を 1, 2 とすれば, 最初の10項は以下の通りである.

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
数列の項の値が400万以下の, 偶数値の項の総和を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%202

=end

def fib_num(n)
	if(n<=1)
		n
	else
		n = fib_num(n-1) + fib_num(n-2)
	end
end

def euler002
	base = 0
	totel_list = []
	loop do
		base += 1
		break if totel_list.last.to_i > 4000_000
		totel_list << fib_num(base)
	end
	base = 0

	totel_list.each_with_index do |item , index|
		 base += item if item % 2 == 0
	end
	base
end

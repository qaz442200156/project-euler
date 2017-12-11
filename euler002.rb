# coding: utf-8
=begin
 Problem 2 「偶数のフィボナッチ数」 
フィボナッチ数列の項は前の2つの項の和である. 最初の2項を 1, 2 とすれば, 最初の10項は以下の通りである.

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
数列の項の値が400万以下の, 偶数値の項の総和を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%202

=end



def euler002
	totel_list = [1,2]
	loop do
		totel_list << (totel_list[-1]+totel_list[-2])
		break if totel_list.last.to_i > 4000_000
	end

	totel_list.select{|x| x% 2 == 0}.reduce(0){|m,v| m+=v}
end

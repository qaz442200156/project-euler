# coding: utf-8
=begin
Problem 10 「素数の和」 †
10以下の素数の和は 2 + 3 + 5 + 7 = 17 である.

200万以下の全ての素数の和を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2010

=end
require 'prime'
def euler010
totel = 0
	Prime.each_with_index do |value , index|
	break if value > 2000_000
	totel += value
	end
	totel
end
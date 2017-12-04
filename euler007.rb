# coding: utf-8
=begin
Problem 7 「10001番目の素数」
素数を小さい方から6つ並べると 2, 3, 5, 7, 11, 13 であり, 6番目の素数は 13 である.

10 001 番目の素数を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%207

=end
require 'prime'

def tag_prime(tag)
(Prime.first tag).max

end

def euler007
tag_prime(10_001)
#
end
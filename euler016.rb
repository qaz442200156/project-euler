# coding: utf-8
=begin
Problem 16 「各位の数字の和」 †
215 = 32768 であり, 各位の数字の和は 3 + 2 + 7 + 6 + 8 = 26 となる.

同様にして, 21000 の各位の数字の和を求めよ.

注: Problem 20 も各位の数字の和に関する問題です。解いていない方は解いてみてください。
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2016

=end


def pow_pervalue_sum(num,pow)
num = num ** pow
num.to_s.split('').reduce(0){|m,x| m += x.to_i}
end

def euler016
pow_pervalue_sum(2,1000)
end
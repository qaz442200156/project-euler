# coding: utf-8
=begin
Problem 20 「各位の数字の和 2」 †
n × (n - 1) × ... × 3 × 2 × 1 を n! と表す.

例えば, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800 となる.
この数の各桁の合計は 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27 である.

では, 100! の各位の数字の和を求めよ.

注: Problem 16 も各位の数字の和に関する問題です。解いていない方は解いてみてください。
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2020

=end

def fact(n)
  if n == 0
    1
  else
    n * fact(n-1)
  end
end

def euler020
fact(100).to_s.split('').reduce(0){|m,x| m+=x.to_i}
end
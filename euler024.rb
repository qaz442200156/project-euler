# coding: utf-8
=begin
Problem 24 「辞書式順列」 †
順列とはモノの順番付きの並びのことである. たとえば, 3124は数 1, 2, 3, 4 の一つの順列である. すべての順列を数の大小でまたは辞書式に並べたものを辞書順と呼ぶ. 0と1と2の順列を辞書順に並べると

012 021 102 120 201 210
になる.

0,1,2,3,4,5,6,7,8,9からなる順列を辞書式に並べたときの100万番目はいくつか?
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2024

=end

def euler024
a = [0,1,2,3,4,5,6,7,8,9]
a.permutation.to_a[999_999].join.to_i
end
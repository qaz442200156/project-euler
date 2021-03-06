# coding: utf-8
# Problem 1 「3と5の倍数」
#10未満の自然数のうち, 3 もしくは 5 の倍数になっているものは 3, 5, 6, 9 の4つがあり, これらの合計は 23 になる.
#同じようにして, 1000 未満の 3 か 5 の倍数になっている数字の合計を求めよ.
#http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%201
def euler001
  (1..999).select{|x| x % 3 == 0 or x % 5 == 0}.reduce(0){|m,x| m += x }
end

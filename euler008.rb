# coding: utf-8
=begin
Problem 8 「数字列中の最大の積」 †
次の1000桁の数字のうち, 隣接する4つの数字の総乗の中で, 最大となる値は, 9 × 9 × 8 × 9 = 5832である.

73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
この1000桁の数字から13個の連続する数字を取り出して, それらの総乗を計算する. では、それら総乗のうち、最大となる値はいくらか.

EX 6桁の数123789から5個の連続する数字を取り出す場合, 1*2*3*7*8と2*3*7*8*9の二通りとなり, 後者の2*3*7*8*9=3024が最大の総乗となる.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%208

=end

def get_tag_prime(input_data,slice_space)
str_arr = input_data.delete!("\n").to_i.to_s
max_value=0
get_group=[]
nums = []

for x in (0..str_arr.length) do
	current_value = 1;
	get_group = str_arr[x,slice_space].split('')
	if get_group.include?('0') == false
	get_group.reduce(0){|m,index| current_value *= index.to_i }
	nums << current_value
	end
end
nums.max
end

def euler008
get_tag_prime(
"
73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
",13)
end
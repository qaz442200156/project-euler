# coding: utf-8
=begin
Problem 18 「最大経路の和 その1」 †
以下の三角形の頂点から下まで移動するとき, その数値の和の最大値は23になる.

3
7 4
2 4 6
8 5 9 3
この例では 3 + 7 + 4 + 9 = 23.

以下の三角形を頂点から下まで移動するとき, その最大の和を求めよ.

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
注: ここではたかだか 16384 通りのルートしかないので, すべてのパターンを試すこともできる. Problem 67 は同じ問題だが100行あるので, 総当りでは解けない. もっと賢い方法が必要である.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2018

=end

EULER18 = <<EOT
75
95 64
17 47 82
18 35 87 10
EOT

def euler018
	all = EULER18.split("\n")
	cacu_group = []
	last_index = 0
	all.each_with_index do |item,index|
		all[index] = item.split(" ")

		point_index = 0
		if index > 1
			cacu_group[index]=[]
			tmp_group =[]
			
				all[index].each_with_index do |per_value,per_id|
					if per_id < all[index].length.to_i
						if per_id+1 == all[index].length.to_i
							tmp_group << (all[index][per_id].to_i - all[index][per_id-1].to_i)
						else
							tmp_group << (all[index][per_id].to_i - all[index][per_id+1].to_i)
						end
				end

				all[index].each_with_index do |per_value,per_id|
					new_index = (all[index].length.to_i - 1 - per_id)
					if new_index > 0 and new_index < all[index].length-1
						tmp_group[new_index] += (all[index][new_index].to_i - all[index][(new_index-1)].to_i)
					end
				end
			cacu_group[index] = tmp_group
		elsif index == 1
			cacu_group[index] << (all[index][0].to_i - all[index][1].to_i)#(cacu_group[index-1][point_index].to_i + all[index][0].to_i)
			cacu_group[index] << (all[index][1].to_i - all[index][0].to_i)#(cacu_group[index-1][point_index].to_i + all[index][1].to_i)
		elsif index == 0
			cacu_group = [[]] * all.length 
			cacu_group[index] = [0]
		end
	end
	cacu_group.last.max
end
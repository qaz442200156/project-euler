# coding: utf-8
=begin
Problem 15 「格子経路」 †
2×2 のマス目の左上からスタートした場合, 引き返しなしで右下にいくルートは 6 つある.

では, 20×20 のマス目ではいくつのルートがあるか.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2015

=end


def cacu_map_road(x_size,y_size)
all_road_max = 0;

map = [[1] * (x_size+1)]*(y_size+1)

map.each_with_index do |x_item , x_id| # X 0 ,0
	x_item.each_with_index do |y_item , y_id| # Y 0 ,1
		if x_id > 0 and y_id > 0
			map[x_id][y_id] = map[x_id-1][y_id]+map[x_id][y_id-1]
			if all_road_max <= map[x_id][y_id]
			all_road_max = map[x_id][y_id]
			end
		end
	end
end

all_road_max

end

def euler015
cacu_map_road(20,20)
end
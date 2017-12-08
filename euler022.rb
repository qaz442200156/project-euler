# coding: utf-8
=begin
roblem 22 「名前のスコア」 †
5000個以上の名前が書かれている46Kのテキストファイル filenames.txt を用いる. まずアルファベット順にソートせよ.

のち, 各名前についてアルファベットに値を割り振り, リスト中の出現順の数と掛け合わせることで, 名前のスコアを計算する.

たとえば, リストがアルファベット順にソートされているとすると, COLINはリストの938番目にある. またCOLINは 3 + 15 + 12 + 9 + 14 = 53 という値を持つ. よってCOLINは 938 × 53 = 49714 というスコアを持つ.

ファイル中の全名前のスコアの合計を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2022

=end
WORDS = Hash.new
def name_sum(_name)
	_name.split('').reduce(0){|m,x| m += WORDS[x]}
end

def euler022
	('A'..'Z').to_a.each_with_index do |value ,index|
		WORDS[value] = index+1	
	end
	sum = 0
	all_group = []
	all = File.read("./p022_names.txt").delete("\"").split(',').compact.sort
	all.each_with_index do |name, name_index|
		sum += ((name_index+1) * name_sum(name))
	end
	sum
end
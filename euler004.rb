# coding: utf-8
=begin
 Problem 4 「最大の回文積」
左右どちらから読んでも同じ値になる数を回文数という. 2桁の数の積で表される回文数のうち, 最大のものは 9009 = 91 × 99 である.

では, 3桁の数の積で表される回文数の最大値を求めよ.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%204

=end

def getmax_palindromic_num(n)
base_max_num = 10 ** n-1
cacu_num = max_num = base_max_num
base_value = max_num * cacu_num
cur_value = base_value
pnum_list = []
#cu_pnum_list = (cur_value-(cur_value*0.25).to_i..cur_value).to_a.select{|x| check_palindromic_num(x.to_s.split(''))}

loop do
	cur_value =(max_num * cacu_num)
	pnum = cur_value.to_s.split('')
	if check_palindromic_num(pnum) == true
		pnum_list << cur_value if pnum_list.include?(cur_value) == false
	else
		if cacu_num < (base_max_num*0.7).to_i
			max_num -= 1
			cacu_num = base_max_num
			base_value = max_num * cacu_num
		end
	end
		cacu_num -= 1
	break if max_num < (base_max_num*0.7).to_i
end
pnum_list.max
end

def check_palindromic_num(_pnum)
length = _pnum.length / 2
check_ans = true
	_pnum.each_index do |index|
		if index < length
			if _pnum[index] != _pnum[_pnum.length-1-index]
				check_ans = false
			end
		end
	end
	check_ans
end

def euler004
getmax_palindromic_num(3)
end
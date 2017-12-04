# coding: utf-8
=begin
Problem 9 「特別なピタゴラス数」 †
ピタゴラス数(ピタゴラスの定理を満たす自然数)とは a < b < c で以下の式を満たす数の組である.

a^2 + b^2 = c^2
例えば, 3^2 + 4^2 = 9 + 16 = 25 = 5^2 である.

a + b + c = 1000 となるピタゴラスの三つ組が一つだけ存在する.
これらの積 abc を計算しなさい.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%209

=end

def euler009
ans = 0
for x in (0..500) do
	for y in (0..500) do
	_a = x**2
	_b = y**2
	_c = (1000 - x-y)**2
		if _c == (_a+_b)
			if _a < _b and _c > _b 
				ans = x*y*(1000 - x-y)
			end
		end
	end
end
ans
end
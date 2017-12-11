# coding: utf-8
=begin
Problem 17 「数字の文字数」 †
1 から 5 までの数字を英単語で書けば one, two, three, four, five であり, 全部で 3 + 3 + 5 + 4 + 4 = 19 の文字が使われている.

では 1 から 1000 (one thousand) までの数字をすべて英単語で書けば, 全部で何文字になるか.

注: 空白文字やハイフンを数えないこと. 例えば, 342 (three hundred and forty-two) は 23 文字, 115 (one hundred and fifteen) は20文字と数える. なお, "and" を使用するのは英国の慣習.
http://odz.sakura.ne.jp/projecteuler/index.php?cmd=read&page=Problem%2017

=end

def in_words(int)
  numbers_to_name = {
	1000 => "thousand",100 => "hundred",90 => "ninety",80 => "eighty",70 => "seventy",60 => "sixty",50 => "fifty",40 => "forty",30 => "thirty",20 => "twenty",19=>"nineteen",18=>"eighteen",17=>"seventeen", 16=>"sixteen",
	15=>"fifteen",14=>"fourteen",13=>"thirteen",12=>"twelve",11 => "eleven",10 => "ten",9 => "nine",8 => "eight",7 => "seven",6 => "six",5 => "five",4 => "four",3 => "three",2 => "two",1 => "one"
  }
  str = ""
  numbers_to_name.each do |num, name|
    if int == 0
      return str
    elsif int.to_s.length == 1 && int/num > 0
      return str + "#{name}"      
    elsif int < 100 && int/num > 0
      return str + "#{name}" if int%num == 0
      return str + "#{name} " + in_words(int%num)
    elsif int/num > 0
	  if int% 100 != 0
	   return str + in_words(int/num) + " #{name} and " + in_words(int%num)
	  end
      return str + in_words(int/num) + " #{name} " + in_words(int%num)
    end
  end
end

def euler017
all_words = ""
(1..1000).to_a.reduce(0){|m,x| all_words+= in_words(x)}
all_words.delete(" ").length

end
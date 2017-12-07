task :default do
  sh 'ruby', 'runner.rb', '-v'
end

task :all do
  sh 'ruby', 'runner.rb', *Dir.glob('../*').select{|f| File.directory? f}.to_a
end

task :check do
tag = ENV["num"]
tag = tag.to_i
files = Dir.glob('euler*.rb').sort

files.each do |f|
  load f
end

if tag != nil and tag > 0 and tag <= files.length
  mo = files[tag-1].match /(euler(\d+))\.rb/
  num = mo[2].to_i
  result = __send__(mo[1])
  puts format("%04d     %d", num, result)
  exit
end
files.each do |f|
  mo = f.match /(euler(\d+))\.rb/
  num = mo[2].to_i
  result = __send__(mo[1])
  puts format("%04d     %d", num, result)
end

end
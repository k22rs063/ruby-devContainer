#! /usr/bin/env ruby

puts "Hello, World!"
a = 0
s = "ruby"
d = 3.14
puts "a:"+a.to_s()
puts s
puts d
if a>3
  puts "Lurge"
elsif a<=0
  puts "Negative"
else
  puts "Little"
end

x=5
while x>0
  print "x"
  x-=1
end
puts
5.times do |i|
  print i.to_s + ","
end
puts
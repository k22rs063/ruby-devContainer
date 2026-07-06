#! /usr/local/bin/ruby
# server1.rb

require 'socket'
def server s
  cmd, path, ver = s.gets.split " "
  if path == "/"
    pp "INDEX"
    s.puts "index"
  else
    pp "OTHER"
    s.puts "other"
  end
  s.close
  
  while line = s.gets
    pp line
    s.puts line
    break if line == "\r\n"
  end
  s.close
end

gs = TCPServer.open 'http'
loop do
  pp "start accept"
  s = gs.accept
  Thread.new do
    server s
  end
end

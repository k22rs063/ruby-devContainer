#! /usr/local/bin/ruby
# server1.rb
# おみくじサーバ

require 'socket'

omikuji = ["大吉", "中吉", "小吉", "末吉", "凶"]

gs = TCPServer.open 80
loop do
  pp "start accept"
  s = gs.accept
  s.puts omikuji.sample
  s.close
end

#! /usr/local/bin/ruby
#report_server.rb
#おみくじクライアント

require 'socket'

s = TCPSocket.open('localhost', 80)
puts s.gets
s.close
#! /usr.local.bin/ruby
# client1.rb

require 'socket'

host ='www.is.kyusan-u.ac.jp'
port = 'http'
path = '/~toshi/'

sock = TCPSocket.new host, port
cmd =  'GET ' + path + "\r\n"
pp cmd
sock.print cmd

while line = sock.gets
  puts line
end

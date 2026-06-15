#! /usr.local.bin/ruby
# client1.rb

require 'socket'

host ='www.is.kyusan-u.ac.jp'
port = 'http'
path = '/~toshi/'

sock = TCPSocket.new host, port
sock.print "GET #{path} HTTP/1.0\r\n"
sock.print "Host: #{host}\r\n"
sock.print "\r\n"

# cmd = 'GET ' + path + " HTTP/1.0\r\n\r\n"
# pp cmd
# sock.print cmd


is_body = false
while line = sock.gets
  # pp line
  puts line if is_body
  is_body = true if line == "\r\n"
end


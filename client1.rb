#! /usr/local/bin/ruby
# client1.rb

require 'socket'

host = ARGV[0]
port = 'http'
# path = '/~toshi/'
path = ARGV[1]
if path == nil
  path = '/'
end

# sock = TCPSocket.new host, port
# sock.print "GET #{path} HTTP/1.0\r\n"
# sock.print "Host: #{host}\r\n"
# sock.print "\r\n"

sock = TCPSocket.new host, port
cmd = 'GET ' + path + " HTTP/1.0\r\n\r\n"
pp cmd
sock.print cmd

# sock = TCPSocket.new host, port
# cmd = 'GET ' + path + " HTTP/1.1\r\n" + "Host: " + host + "\r\n\r\n"
# pp cmd
# sock.print cmd

# sock = TCPSocket.new host, port
# cmd = "GET #{path} HTTP/1.1\r\n"
# cmd += "Host: #{host}\r\n"
# cmd += "connection: close\r\n"
# cmd += "\r\n"
# pp cmd
# sock.print cmd


is_body = false
while line = sock.gets
  pp line
  puts line if is_body
  is_body = true if line == "\r\n"
end


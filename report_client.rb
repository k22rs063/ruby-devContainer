#! /usr/local/bin/ruby
#report_server.rb
#おみくじクライアント

require 'socket'

host = ARGV[0]
port = 'http'
path = ARGV[1]
if path == nil
    path = '/'
end

sock = TCPSocket.new host, port
cmd = 'GET ' + path + " HTTP/1.0\r\n\r\n"
pp cmd
sock.print cmd

is_body = false
while line = sock.gets
    pp line
    puts line if is_body
    is_body = true if line == "\r\n"
end
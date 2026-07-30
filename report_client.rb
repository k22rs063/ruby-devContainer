#! /usr/local/bin/ruby
#report_client.rb
#おみくじクライアント

require 'socket'

method = ARGV[0]
path = ARGV[1]
if method == nil
    method = 'OMIKUJI'
end
if path == nil
    path = '/'
end

sock = TCPSocket.new 'localhost', 'http'
cmd = method + " " + path + " HTTP/1.0\r\n\r\n"
# pp cmd
sock.print cmd

is_body = false
while line = sock.gets
    # pp line
    puts line if is_body
    is_body = true if line == "\r\n"
end

sock.close
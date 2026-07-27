#! /usr/local/bin/ruby
# server1.rb
# おみくじサーバ

require 'socket'

omikuji = ["大吉", "中吉", "小吉", "末吉", "凶"]

def server s
  cmd, path, ver = s.gets.split " "

  if path == "/"
    kuji = omikuji.sample
    s.print "HTTP/1.0 200 OK\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    s.puts "<h1>おみくじ</h1>"
    s.puts "<p>今日の運勢は#{kuji}です</p>"
  elsif path == "/api/now"
    s.print "HTTP/1.0 200 OK\r\n"
    s.print "Content-Type: application/json\r\n"
    s.print "\r\n"
    s.puts "{"
    s.puts '"\"time\:"' + "#{Time.now}" + '"'
    s.puts "}"
  else
    s.print "HTTP/1.0 404 Not Found\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    s.puts "<h1>404 Not Found</h1>"
    s.puts "<p>404 Not Found</p>"
  end
end


gs = TCPServer.open 80
loop do
  pp "start accept"
  s = gs.accept
  Thread.new do
    server s
  end
end
